import SwiftUI

extension DeckWalletBaseView {
    struct CreateDeckView: View {
        
        @State var fetchedDecks = [DeckWallet]()
        
        @State var actionMenuIsVisible = false
        @State var advancedMenuIsVisible = false
        @State var settingsMenuIsVisible = false
        
        @State var deckCards = getUDDeckCards()
        @State var allCardKeys = getUDAllCardKeys()
        @State var columns = UD.standardValue(forKey: .deckWalletCreateDeckColumnsCount) as? Int ?? 6
        
        @ObservedObject var zIndex = EnvObjs.ZIndex()
        
        var body: some View {
            BGStack {
                ZStack {
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 0) {
                            
                            VStack(spacing: 0) {
                                makeDeck(cards: deckCards)
                                makeDeckFooter()
                            }
                            .background(Color.custom(.gray(id: .c6)))
                            .customCornerRadius(12)
                            .customPadding(.horizontal, 8)
                            
                            DeckCardsView(deckCards: $deckCards,
                                          allCardKeys: $allCardKeys,
                                          columns: $columns)
                                .customPadding(.top, 4)
                        }
                        .customPadding(.top, 6)
                    }
                    
                    ActionMenuView(selfIsVisible: $actionMenuIsVisible,
                                   deckCards: $deckCards,
                                   activationDatePath: \.first)
                        .zIndex(Double(zIndex.first?.timeIntervalSince1970 ?? 0))
                    
                    AdvancedMenuView(selfIsVisible: $advancedMenuIsVisible,
                                     deckCards: $deckCards)
                        .zIndex(Double(zIndex.second?.timeIntervalSince1970 ?? 0))
                    
                    SettingsMenuView(selfIsVisible: $settingsMenuIsVisible,
                                     allCardKeys: $allCardKeys,
                                     columns: $columns)
                        .zIndex(Double(zIndex.third?.timeIntervalSince1970 ?? 0))
                    
                }.environmentObject(zIndex)
            }
            .navigationTitle("Create Deck")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: trailingButtons())
            .onAppear(perform: onAppearAction)
            .onDisappear(perform: onDisappearAction)
        }
        
        private func makeDeck(cards: [String]) -> some View {
            VStack(spacing: 0) {
                ForEach(0...1, id: \.self) { idx in
                    HStack(spacing: 0) {
                        ForEach(0...3, id: \.self) { ind in
                            let card = cards[idx*4+ind]
                            
                            if card != "" {
                                Image(card)
                                    .resizable()
                                    .scaledToFit()
                                    .onTapGesture {deckCardTapAction(key: card)}
                            }
                            else {
                                Image("unknown-card")
                                    .resizable()
                                    .scaledToFit()
                                    .opacity(0)
                            }
                        }
                    }
                }
            }
            .customCornerRadius(12)
        }
        
        private func deckCardTapAction(key: String) {
            withAnimation {
                if let index = deckCards.firstIndex(of: key) {
                    deckCards[index] = ""
                    UD.standardSet(deckCards, forKey: .deckWalletCreateDeckCards)
                }
            }
        }
        
        private func makeDeckFooter() -> some View {
            HStack(spacing: 0) {
                Text(Funcs.Deck.avgElixirCost(deckCards: deckCards))
                    .foregroundColor(.custom(.orange()))
                
                Spacer()
                
                Button(action: doneAction) {
                    Text("Action!")
                        .foregroundColor(deckCards.contains("") ? .custom(.gray()) : .custom(.blue()))
                }
                .disabled(deckCards.contains(""))
            }
            .customFont(size: 26)
            .customPadding(t: 2, l: 6, b: 2, tr: 6)
        }
        
        private func doneAction() {
            withAnimation {
                actionMenuIsVisible.toggle()
            }
        }
        
        private func coverButtonAction() {
            withAnimation {
                actionMenuIsVisible = false
                settingsMenuIsVisible = false
                advancedMenuIsVisible = false
            }
        }
        
        private func onAppearAction() {
            columns = UD.standardValue(forKey: .deckWalletCreateDeckColumnsCount) as? Int ?? 6
            deckCards = getUDDeckCards()
            allCardKeys = getUDAllCardKeys()
        }
        
        private func onDisappearAction() {
            UD.standardSet(deckCards, forKey: .deckWalletCreateDeckCards)
        }
        
        private func trailingButtons() -> some View {
            HStack {
                Button(action: {
                    withAnimation { settingsMenuIsVisible = true }
                }) {
                    Image(systemName: "gear")
                        .font(.title)
                }
                
                Button("Advanced") {
                    withAnimation { advancedMenuIsVisible = true }
                }
            }
        }
        
    }
}

//struct DeckWalletBaseView.CreateDeckView_Previews: PreviewProvider {
//    static var previews: some View {
//        DeckWalletBaseView.CreateDeckView()
//    }
//}

private func getUDDeckCards() -> [String] {
    let defaultValue = Array(repeating: "", count: 8)
    return UD.standardValue(forKey: .deckWalletCreateDeckCards) as? [String] ?? defaultValue
}

private func getUDAllCardKeys() -> [String] {
    
    let allCards = DataSet.Cards.allValids
    let cardKeys: ([DataSet.Cards]) -> ([String]) = {
        return $0.map{$0.info.key}
    }
    let defaultValue = cardKeys(allCards.sortByElixirAscending())
    
    guard let sortMode = UD.standardValue(forKey: .deckWalletCreateDeckSettingsSortMode) as? String,
          let orderMode = UD.standardValue(forKey: .deckWalletCreateDeckSettingsOrderMode) as? String
    else {
        return defaultValue
    }
    
    switch orderMode {
    case "Ascending":
        switch sortMode {
        case "Elixir": return cardKeys(allCards.sortByElixirAscending())
        case "Rarity": return cardKeys(allCards.sortByRarityAscending())
        default: {}()
        }
    case "Descending":
        switch sortMode {
        case "Elixir": return cardKeys(allCards.sortByElixirDescending())
        case "Rarity": return cardKeys(allCards.sortByRarityDescending())
        default: {}()
        }
    default: {}()
    }
    
    return defaultValue
}
