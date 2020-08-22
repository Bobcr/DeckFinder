import SwiftUI

extension PlayerBaseView.CardsView {
    struct LockedCardsView: View {
        
        @Binding var columns: Int
        @EnvironmentObject var datas: EnvObjs.Datas
        @State var navigationLinkCard: DataSet.Cards = .unknownCard
        @State var navigationLinkTriggerer: Bool? = nil
        
        var cardWidth: CGFloat { 414/CGFloat(columns) }
        var cardWidthWith5Columns: CGFloat { 414/5 }
        var cardHeight: CGFloat { 414/CGFloat(columns)*(363/302) }
        var multiplier: CGFloat { cardWidth/cardWidthWith5Columns }
        
        var lockedCards: [DataSet.Cards] {
            var allCards = DataSet.Cards.allValids
            let allPlayerCards = datas.playerProfile.cards.map { $0.enumValue }
            allCards.removeAll { allPlayerCards.contains($0) }
            
            return (allPlayerCards.count > 6) ? allCards : []
        }
        
        var lockImage: some View {
            Image(systemName: "lock.fill")
                .resizable()
                .scaledToFit()
                .opacity(0.8)
                .customPadding(15, id: .s2)
                .shadow(color: .custom(.white(), opacity: 0.7), radius: 5, x: 0, y: 0)
        }
        
        var body: some View {
            VStack(spacing: 0) {
                NavigationLink(destination: CardInfoView(card: navigationLinkCard),
                               tag: true,
                               selection: $navigationLinkTriggerer) {
                    EmptyView()
                }
                
                CustomGrid.init(allItemsCount: lockedCards.count,
                                columns: columns) { idx in
                    
                    let card = lockedCards[idx]
                    
                    VStack(spacing: 0) {
                        Image(card.info.key)
                            .resizable()
                            .scaledToFit()
                            .overlay(lockImage)
                        
                        Text(card.info.name)
                            .customFont(size: 13*multiplier, id: .s4)
                            .lineLimit(1)
                            .minimumScaleFactor(0.1)
                            .customFrame(width: cardWidth*0.98, id: .s4)
                            .customPadding(t: -2, id: .s4)
                            .sameHeightAs(text: "Clone",
                                          withFont: .custom(size: 14*multiplier),
                                          add: 2,
                                          id: .s4)
                        
                    }
                    .customPadding(.vertical, 2)
                    .frame(width: screen.width/CGFloat(columns))
                    .onTapGesture {
                        navigationLinkCard = card
                        navigationLinkTriggerer = true
                    }
                }
            }
        }
    }
}
