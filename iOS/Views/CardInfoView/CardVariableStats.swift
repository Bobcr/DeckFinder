import SwiftUI

extension CardInfoView {
    func makeVariableStatsGrid(variableStats: [StringArrayOfStringPair],
                                       variableImageNames: [String]) -> some View {
        VStack(spacing: 0) {
            let rowCount = variableStats[0].values.count + 1
            let itemCount = rowCount * variableStats.count
            
            CustomGrid(isLazy: false,
                       allItemsCount: itemCount,
                       rows: rowCount) { idx in
                
                let index = idx % rowCount
                let columnNumber = Int((Double(idx+1)/Double(rowCount)).rounded(.up))
                let text = index == 0 ? variableStats[columnNumber-1].key :
                    variableStats[columnNumber-1].values[index-1]
                let iconName = variableImageNames[columnNumber-1]
                
                HStack(spacing: 0) {
                    if index == 0 {
                        Image(iconName)
                            .resizable()
                            .scaledToFit()
                            .customFrame(maxWidth: 25)
                            .customPadding(tr: 1)
                    }
                    
                    Text(text)
                        .customFont(size: 20, weight: .semibold)
                        .lineLimit(1)
                        
                    
                }.minimumScaleFactor(0.1)
                .customPadding(t: 6, l: 2, b: 6, tr: 2)
            }
        }
    }
    
    func makeVariableStatsForSelf() -> some View {
        VStack(spacing: 0) {
            Text("Stats")
                .customFont(size: 30, weight: .medium)
                .customPadding(t: 2)
                .foregroundColor(.custom(.green()))
            
            makeVariableStatsGrid(variableStats: variableStats,
                                  variableImageNames: card.variableStats.imageIconNames())
        }
        .customFrame(maxWidth: .infinity)
        .customPadding(6)
        .background(Color.custom(.white()))
        .customCornerRadius(8)
        .customPadding(t: 6, l: 10, b: 6, tr: 10)
        .shadow(color: .custom(.blackShadow(), opacity: 0.2), radius: 4, x: 0, y: 0)
    }
    
}
