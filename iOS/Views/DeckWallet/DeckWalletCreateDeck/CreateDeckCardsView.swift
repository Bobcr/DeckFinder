import SwiftUI

extension DeckWalletBaseView.CreateDeckView {
    struct DeckCardsView: View {
        
        @Binding var deckCards: [String]
        @Binding var allCardKeys: [String]
        @Binding var columns: Int
        @State var navigationCard: DataSet.Cards = .unknownCard
        @State var navigationLinkTriggerer: Bool? = nil
        
        var body: some View {
            VStack(spacing: 0) {
                NavigationLink(destination:
                                CardInfoView(card: navigationCard),
                               tag: true,
                               selection: $navigationLinkTriggerer)
                    { EmptyView() }
                
                CustomGrid(allItemsCount: allCardKeys.count, columns: columns) { idx in
                    
                    makeCard(key: allCardKeys[idx], deckIsFull: !deckCards.contains(""))
                }
            }
        }
        
        func makeCard(key: String, deckIsFull: Bool) -> some View {
            return Button(action: {cardTappedAction(key: key)}) {
                ZStack {
                    let isInDeck = deckCards.contains(key)
                    
                    Image(key)
                        .resizable()
                        .scaledToFit()
                        .blur(radius: (isInDeck || deckIsFull) ? 1.5 : 0)
                    
                    if isInDeck {
                        Image(systemName: "checkmark.shield")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.custom(.green()))
                            .customPadding(10)
                            .shadow(color: .black, radius: 2, x: 0, y: 0)
                    }
                }
            }
            .contextMenu {
                Button(action: {
                    navigationCard = .find(by: .key, value: key)
                    navigationLinkTriggerer = true
                })
                {
                    Text("Card info")
                    Spacer()
                    Image(systemName: "arrowshape.turn.up.right")
                }
            }
        }
        
        func cardTappedAction(key: String) {
            withAnimation {
                if let index = deckCards.firstIndex(of: key) {
                    deckCards[index] = ""
                }
                else if let index = deckCards.firstIndex(of: "") {
                    deckCards[index] = key
                }
                UD.standardSet(deckCards, forKey: .deckWalletCreateDeckCards)
            }
        }
        
    }
}
