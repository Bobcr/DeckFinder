import SwiftUI

extension PlayerBaseView.StatsView {
    @ViewBuilder
    func makeCardStats() -> some View {
        let statsPairs = datas.playerCardsStats
        
        VStack(spacing: 0) {
            let dividerIndices = [1, 3, 7, 9, 11, 13]
            let keysColorizedIndices: [(index: Int, color: Color)] = [
                (2, .custom(.yellow())),
                (3, .custom(.yellow())),
                (8, .custom(.blue())),
                (9, .custom(.blue())),
                (10, .custom(.orange())),
                (11, .custom(.orange())),
                (12, .custom(.purple())),
                (13, .custom(.purple())),
                (14, .custom(.pink())),
                (15, .custom(.pink())),
            ]
            
            makeStatsList(title: "Cards Stats",
                          pairs: statsPairs,
                          dividerIndices: dividerIndices,
                          keysColorizedIndices: keysColorizedIndices)
            
        }
        .customPadding(t: 4, l: 3, b: 4, tr: 3)
        .background(Color.custom(.white()))
        .customCornerRadius(8)
        .customPadding(t: 5, l: 8, b: 5, tr: 8)
        .shadow(color: .custom(.blackShadow(), opacity: 0.2), radius: 2)
    }
}
