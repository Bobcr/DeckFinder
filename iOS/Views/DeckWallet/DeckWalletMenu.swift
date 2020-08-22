import SwiftUI
import CoreData

extension DeckWalletBaseView {
    
    @ViewBuilder
    func makeOverlayMenu(activationDatePath: ReferenceWritableKeyPath<EnvObjs.ZIndex, Date?>?) -> some View {
        OverlayMenuStack.init(isPresented: $overlayMenuPresentation,
                              activationDatePath: activationDatePath) {
            OverlayMenuItem.button(title: "Save Decks",
                                   bgColor: .custom(.green()),
                                   action: askUserToSaveDecksOnTheServers)
            OverlayMenuItem.button(title: "Get Decks",
                                   bgColor: .custom(.yellow()),
                                   action: getAndSaveDecks)
            OverlayMenuItem.dismissButton(isPresented: $overlayMenuPresentation)
        }
    }
    
    private func saveDecksOnTheServers(mode: Requests.SaveUserDecks.SaveUserDecksMode) {
        guard !(deckCategories.map{$0.decks}).isEmpty else {
            appearance.alert = .init(
                title: "No Decks have been saved on the your device yet",
                message: nil)
            return
        }
        let deckCats = deckCategories.map { category -> DeckWalletCategory in
            var category = category
            category.decks = category.decks.map { deck -> DeckWalletCategory.Deck in
                var deck = deck
                deck.avgElixirCost = ""
                return deck
            }
            return category
        }
        
        Requests.SaveUserDecks.init(datas: $datas,
                                    appearance: $appearance,
                                    deckCategories: deckCats,
                                    mode: mode)
            .request { status in
                switch status {
                case .succeeded:
                    appearance.alert = .init(title: "Your decks were successfully saved to your account!",
                                             message: nil)
                default: break
                }
            }
    }
    
    private func askUserToSaveDecksOnTheServers() {
        if UD.standardValue(forKey: .SIWAAccessToken) != nil {
            
            let replaceConfirmationAlert = EnvObjs.Appearance.Alert(
                title: "Are you sure? old decks will be removed from our servers.",
                message: nil,
                primaryButton: .cancel(),
                secondaryButton: .default(Text("I'm Sure!"),
                                          action: { saveDecksOnTheServers(mode: .replace) }))
            
            appearance.alert = .init(title: "Replace current decks with those that are saved on your account on our servers(if any!), or only add the new decks to them?",
                                     message: nil,
                                     primaryButton: .default(Text("Add"),
                                                             action: { saveDecksOnTheServers(mode: .add) }),
                                     secondaryButton: .default(Text("Replace"),
                                                               action: {
                                                                Funcs.after(seconds: 0.1) {
                                                                    appearance.alert = replaceConfirmationAlert
                                                                }
                                                               }))
        }
        else {
            saveDecksOnTheServers(mode: .add)
        }
    }
    
    private func saveDecksToDeckWallet(decodedCategories: [DeckWalletCategory]) {
        let fetchedDecks = DeckWallet.getAll(moc: moc, appearance: $appearance)
        let categories = fetchedDecks.convertToCategorizedDecks()
        var decodedCategories = decodedCategories
        
        var newCategoryNames = decodedCategories.map{$0.name}
        let oldCategoryNames = UD.sharedValue(forKey: .deckWalletCategoryNames) as? [String] ?? ["Default"]
        newCategoryNames.removeAll { oldCategoryNames.contains($0) }
        newCategoryNames = oldCategoryNames + newCategoryNames
        UD.sharedSet(newCategoryNames, forKey: .deckWalletCategoryNames)
        
        // from decoded decks, delete decks that are already saved on the Deck Wallet
        for category in categories {
            for deck in category.decks {
                decodedCategories = decodedCategories.map { decodedCat in
                    var mutableCat = decodedCat
                    mutableCat.decks
                        .removeAll { $0.cards.sorted() == deck.cards.sorted() }
                    return mutableCat
                }
            }
        }
        
        // Save the remaining decks
        for category in decodedCategories {
            for deck in category.decks {
                let newDeck = DeckWallet.init(context: moc)
                newDeck.cardNames = deck.cards
                newDeck.deckCategory = category.name
                newDeck.deckTitle = deck.name
            }
        }
        
        moc.handeledSave(appearance: $appearance)
        withAnimation {
            deckCategories = .getMOCCategories(moc: moc, appearance: $appearance)
        }
    }
    
    private func getAndSaveDecks() {
        Requests.GetUserDecks.init(datas: $datas,
                                   appearance: $appearance)
            .request { status in
                switch status {
                case .succeeded(let decodedCategroies):
                    guard !(decodedCategroies.map{$0.decks}).isEmpty else {
                        appearance.alert = .init(
                            title: "No Decks have been saved on the servers yet",
                            message: nil)
                        return
                    }
                    saveDecksToDeckWallet(decodedCategories: decodedCategroies)
                default: break
                }
            }
    }
    
}
