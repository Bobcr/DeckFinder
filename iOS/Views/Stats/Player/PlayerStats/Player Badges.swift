import SwiftUI

extension PlayerBaseView.StatsView {
    @ViewBuilder
    func makeBadges() -> some View {
        
        let badges = Funcs.Player.identifyAllBadges(badges: datas.playerProfile.badges)
        let columns = Int(screen.width/CGFloat.custom(414/5))
        
        VStack(spacing: 0) {
            Text("Badges")
                .foregroundColor(.custom(.green()))
                .customFont(size: 28, weight: .medium)
                .customPadding(t: 3, b: 5)
            
            CustomGrid.init(allItemsCount: badges.count, columns: columns) { idx in
                
                let badge = badges[idx]
                let CGColumns = CGFloat(columns)
                
                HStack(spacing: 0) {
                    Spacer(minLength: 0)
                    
                    VStack(spacing: 0) {
                        Image(badge.imageName)
                            .resizable()
                            .scaledToFit()
                            .customFrame(width: 280/CGColumns, height: 280/CGColumns)
                        
                        Text(badge.progress)
                            .customFont(size: 72/CGColumns)
                            .customFrame(width: 250/CGColumns)
                            .lineLimit(1)
                            .minimumScaleFactor(0.001)
                    }
                    
                    Spacer(minLength: 0)
                }
                .customPadding(.vertical, 3)
                .contextMenu {
                    Text(badge.explanation)
                }
            }
            .customPadding(.vertical, 3)
        }
        .customPadding(t: 4, l: 3, b: 4, tr: 3)
        .background(Color.custom(.white()))
        .customCornerRadius(8)
        .customPadding(t: 5, l: 8, b: 5, tr: 8)
        .shadow(color: .custom(.blackShadow(), opacity: 0.2), radius: 2)
    }
}
