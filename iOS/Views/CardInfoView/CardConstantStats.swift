import SwiftUI

extension CardInfoView {
    func makeConstantStats() -> some View {
        VStack(spacing: 0) {
            Text("Constants")
                .customFont(size: 30, weight: .medium)
                .customPadding(t: 2, b: 4)
                .foregroundColor(.custom(.green()))
            
            CustomGrid(isLazy: false,
                       allItemsCount: constantStats.count,
                       columns: Device.isPad ? 3 : 2) { idx in
                let constants = constantStats[idx]
                
                HStack(spacing: 0) {
                    Image(constantsImageNames[idx])
                        .resizable()
                        .scaledToFit()
                        .customFrame(width: 25)
                        .customPadding(.trailing, 1)
                    
                    HStack(alignment: .firstTextBaseline, spacing: 0) {
                        Text("\(constants.key):")
                            .customFont(size: 19, weight: .semibold)
                            .lineLimit(1)
                            .minimumScaleFactor(0.1)
                        
                        Spacer(minLength: .custom(4))
                        
                        Text(constants.value)
                            .customFont(size: 18, weight: .medium)
                            .lineLimit(1)
                            .minimumScaleFactor(0.1)
                    }
                }
                .customFrame(maxWidth: .infinity)
                .customPadding(.horizontal, 2)
            }
        }
        .customFrame(maxWidth: .infinity)
        .customPadding(6)
        .background(Color.custom(.white()))
        .customCornerRadius(8)
        .customPadding(t: 6, l: 10, b: 6, tr: 10)
        .shadow(color: .custom(.blackShadow(), opacity: 0.2), radius: 4, x: 0, y: 0)
    }
}
