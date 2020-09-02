import SwiftUI

extension PlayerBaseView.CardsView {
    struct UnlockedCardsView: View {
        
        @Binding var columns: Int
        @State var navigationLinkCard: DataSet.Cards = .unknownCard
        @State var navigationLinkTriggerer: Bool? = nil
        @EnvironmentObject var datas: EnvObjs.Datas
        
        var cardWidth: CGFloat { 414/CGFloat(columns) }
        var cardWidthWith5Columns: CGFloat { 414/5 }
        var cardHeight: CGFloat { 414/CGFloat(columns)*(363/302) }
        var multiplier: CGFloat { cardWidth/cardWidthWith5Columns }
        
        var body: some View {
            VStack(spacing: 0) {
                NavigationLink(destination: CardInfoView(card: navigationLinkCard),
                               tag: true,
                               selection: $navigationLinkTriggerer) {
                    EmptyView()
                }
                
                CustomGrid.init(allItemsCount: datas.playerProfile.cards.count,
                                columns: columns) { idx in
                    
                    let playerCard = datas.playerProfile.cards[idx]
                    
                    VStack(spacing: 0) {
                        ZStack {
                            let isGolden = playerCard.starLevel > 0
                            let cardKey = playerCard.enumValue.info.key
                            Image(isGolden ?
                                    "\(cardKey)-g" : cardKey)
                                .resizable()
                                .scaledToFit()
                            
                            makeProgressText(playerCard: playerCard)
                            
                            makeUpgradeableToLevel(playerCard: playerCard)
                            
                            makeLevel(playerCard: playerCard)
                        }
                        
                        Text(playerCard.enumValue.info.name)
                            .customFont(size: 13*multiplier, id: .s4)
                            .lineLimit(1)
                            .minimumScaleFactor(0.1)
                            .customFrame(width: cardWidth*0.98, id: .s4)
                            .customPadding(t: -2, id: .s4)
                            .sameHeightAs(text: "Clone",
                                          withFont: .custom(size: 14*multiplier),
                                          add: 2,
                                          id: .s4)
                        
                        makeFooter(playerCard: playerCard)
                    }
                    .customPadding(.vertical, 2)
                    .frame(width: screen.width/CGFloat(columns))
                    .onTapGesture {
                        navigationLinkCard = playerCard.enumValue
                        navigationLinkTriggerer = true
                    }
                }
            }
        }
        
        private func makeLevel(playerCard: OAPI.Models.PlayerProfile.ProfileCard) -> some View {
            Text("lvl.\(playerCard.level)")
                .frame(width: (screen.width / CGFloat(columns)) * 0.8)
                .customFont(size: 16.5*multiplier, weight: .bold, id: .s4)
                .foregroundColor(.white)
                .shadow(color: .black, radius: 2)
                .offset(y: .custom(cardHeight/3, id: .s4))
        }
        
        @ViewBuilder
        private func makeProgressText(playerCard: OAPI.Models.PlayerProfile.ProfileCard) -> some View {
            if playerCard.progressText != "100%" {
                ZStack {
                    Text(playerCard.progressText)
                        .frame(width: screen.width/CGFloat(columns)*0.9)
                        .foregroundColor(.custom(.black(id: .c2)))
                        .customFont(size: 16*multiplier, id: .s4)
                        .customPadding(8.5*multiplier, id: .s4)
                        .background(
                            Circle()
                                .foregroundColor(.custom(.yellow(), opacity: 0.9))
                        )
                        .offset(x: .custom(-cardWidth/3.7, id: .s4),
                                y: .custom(-cardHeight/3.2, id: .s4))
                    
                }
            }
        }
        
        @ViewBuilder
        private func makeUpgradeableToLevel(playerCard: OAPI.Models.PlayerProfile.ProfileCard) -> some View {
            if playerCard.upgradeableToLevel != playerCard.level {
                ZStack {
                    Text("\(playerCard.upgradeableToLevel)↑")
                        .frame(width: screen.width/CGFloat(columns)*0.9)
                        .foregroundColor(.custom(.black(id: .c2)))
                        .customFont(size: 16*multiplier, id: .s4)
                        .customPadding(8*multiplier, id: .s4)
                        .background(
                            Circle()
                                .foregroundColor(.custom(.yellow(), opacity: 0.9))
                        )
                        .offset(x: .custom(cardWidth/3.7, id: .s4),
                                y: .custom(-cardHeight/3.2, id: .s4))
                }
            }
        }
        
        @ViewBuilder
        private func makeFooter(playerCard: OAPI.Models.PlayerProfile.ProfileCard) -> some View {
            if playerCard.level == 13 {
                makeMaxedCardFooter(playerCard: playerCard)
            }
            else {
                makeUnmaxedCardFooter(playerCard: playerCard)
            }
        }
        
        private func makeUnmaxedCardFooter(playerCard: OAPI.Models.PlayerProfile.ProfileCard) -> some View {
            let text = "\(playerCard.count)/\(playerCard.upgradeIsPossibleAtThisCardCount)"
            let ratio = CGFloat(playerCard.count)/CGFloat(playerCard.upgradeIsPossibleAtThisCardCount)
            
            return ZStack {
                let rectangleHeight: CGFloat = 14*multiplier
                
                RoundedRectangle(cornerRadius: 5, style: .continuous)
                    .foregroundColor(.custom(.gray()))
                    .customFrame(width: cardWidth*0.9, height: rectangleHeight, id: .s4)
                
                if ratio < 1 {
                    let leftMargin: CGFloat = Device.isPhone ? 0.12 : 0.07
                    let rightMargin: CGFloat = Device.isPhone ? 0.07 : 0.4
                    let roundedRatio = (ratio > (1 - rightMargin)) ? 1 :
                        (ratio != 0 && ratio < leftMargin) ? leftMargin : ratio
                    
                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                        .customFrame(width: cardWidth*0.9*roundedRatio, height: rectangleHeight, id: .s4)
                        .foregroundColor(.custom(.blue()))
                        .customFrame(width: cardWidth*0.9, height: rectangleHeight, alignment: .leading, id: .s4)
                }
                else {
                    RoundedRectangle(cornerRadius: 5, style: .continuous)
                        .foregroundColor(.custom(.green()))
                        .customFrame(width: cardWidth*0.9, height: rectangleHeight, id: .s4)
                }
                
                Text(text)
                    .customFont(size: 12*multiplier, id: .s4)
                    .lineLimit(1)
                    .minimumScaleFactor(0.1)
                    .customFrame(width: cardWidth*0.85, id: .s4)
            }
        }
        
        @ViewBuilder
        private func makeMaxedCardFooter(playerCard: OAPI.Models.PlayerProfile.ProfileCard) -> some View {
            let cardCurrentStarLevels = playerCard.starLevel
            let cardMissingStarLevels = playerCard.enumValue.info.starLevels - cardCurrentStarLevels
            
            HStack(spacing: 0) {
                ForEach(0..<cardCurrentStarLevels, id: \.self) { idx in
                    Image("star-level")
                        .resizable()
                        .scaledToFit()
                        .customFrame(height: 16*multiplier, id: .s4)
                        .customPadding(t: -1, l: 2, b: -1, tr: 2, id: .s4)
                }
                
                if cardMissingStarLevels >= 0 {
                    ForEach(0..<cardMissingStarLevels, id: \.self) { idx in
                        Image("star-level-gray")
                            .resizable()
                            .scaledToFit()
                            .customFrame(height: 16*multiplier, id: .s4)
                            .customPadding(t: -1, l: 2, b: -1, tr: 2, id: .s4)
                    }
                }
            }
        }
        
    }
}
