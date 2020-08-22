import SwiftUI

struct DeckWalletCompactView: View {
    
    @EnvironmentObject var appearance: EnvObjs.Appearance
    @Environment(\.openURL) var openURL
    @Environment(\.managedObjectContext) var moc
    
    @Binding var deckCategories: [DeckWalletCategory]
    var category: DeckWalletCategory
    var categoryIndex: Int
    
    @Binding var updateDeckMenuIsVisible: Bool
    @Binding var updateDeckMenuDeckCards: [String]
    
    var body: some View {
        ZStack {
            CustomGrid(allItemsCount: category.decks.count,
                       columns: 1) { idx in
                
                VStack(spacing: 0) {
                    let cards = category.decks[idx].cards
                    
                    makeDeckHeader(idx: idx)
                    makeDeck(cards: cards)
                }
                .id(category.decks[idx].cards.joined())
                .background(Color.custom(.gray(id: .c6)))
                .customCornerRadius(12)
                .customPadding(t: 3, l: 6, b: 3, tr: 6)
                .contextMenu(menuItems: { deckContextMenu(idx: idx) })
                
            }
            .customPadding(t: -4, l: 2, b: 0, tr: 2)
        }
    }
    
    func makeDeck(cards: [String]) -> some View {
        return HStack(spacing: 0) {
            ForEach(0...7, id: \.self) { idx in
                Image(cards[idx])
                    .resizable()
                    .scaledToFit()
            }
        }
        .customCornerRadius(12)
    }
    
    func makeDeckHeader(idx: Int) -> some View {
        let deck = category.decks[idx]
        let deckCount = category.decks.count
        
        return VStack(spacing: 0) {
            
            if deck.name != "" {
                Text(deck.name)
                    .customFont(size: 24)
                    .customPadding(.horizontal, 6)
                    .lineLimit(1)
                    .foregroundColor(.custom(.black()))
            }
            
            HStack(spacing: 0) {
                Text(deck.avgElixirCost)
                    .customFont(size: 24, weight: .semibold)
                    .customPadding(.leading, 6)
                
                Spacer()
                
                Text("#\(deckCount-(idx))")
                    .customFont(size: 24, weight: .semibold)
                    .customPadding(.trailing, 6)
            }
            .foregroundColor(.custom(.orange()))
        }
        .customPadding(.top, 2)
    }
    
    func deckContextMenu(idx: Int) -> some View {
        
        let deckCards = category.decks[idx].cards
        let safariDeckLink = Funcs.Deck
            .makeDeckLink(deckCards: deckCards,
                          appearance: $appearance)
        
        return VStack(spacing: 0) {
            
            if let link = safariDeckLink,
               let linkURL = URL(string: link) {
                
                Button("Copy deck in game", imageSystemName: "square.and.arrow.up") {
                    openURL.callAsFunction(linkURL)
                }
                
                Button("Share deck link", imageSystemName: "square.and.arrow.up") {
                    appearance.shareSheetItems = [.init(name: "Deck link", url: linkURL)]
                    appearance.shareSheetPresentation = true
                }
            }
            
            Button("Update deck", imageSystemName: "arrow.triangle.2.circlepath") {
                withAnimation {
                    updateDeckMenuDeckCards = deckCards
                    updateDeckMenuIsVisible = true
                }
            }
            
            Button("Delete deck", imageSystemName: "trash") {
                let cardNamesJoined = deckCards.map{ DataSet.Cards.find(by: .key, value: $0).info.name }
                    .joined(separator: ", ")
                appearance.alert = .init(title: "Delete Deck?",
                                         message: cardNamesJoined,
                                         primaryButton: .cancel(),
                                         secondaryButton: .destructive(Text("Delete")) {
                                            withAnimation {
                                                Funcs.Deck.findAndDeleteFromCoreData(deckCards: deckCards,
                                                                                     appearance: $appearance,
                                                                                     moc: moc)
                                                deckCategories = .getMOCCategories(moc: moc,
                                                                              appearance: $appearance)
                                            }
                                         })
            }
        }
    }
}

//struct DeckWalletCompactView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            DeckWalletBaseView(deckWalletMode: .compact)
//                .previewDevice("iPhone 7 Plus")
//        }
//    }
//}
