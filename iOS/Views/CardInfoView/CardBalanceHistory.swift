import SwiftUI

extension CardInfoView {
    func makeBalanceHistory() -> some View {
        VStack(spacing: 0) {
            Text("History")
                .customFont(size: 30, weight: .medium)
                .customPadding(t: 2)
                .foregroundColor(.custom(.green()))
            
            ForEach(history.indices, id: \.self) { idx in
                HStack(alignment: .firstTextBaseline, spacing: 0) {
                    Text("#\(history.count-idx):")
                        .customFont(size: 20, weight: .bold)
                        .customPadding(.trailing, 10)
                    
                    Text(history[idx])
                        .customFont(size: 20, weight: .medium)
                        .multilineTextAlignment(.leading)
                        .fixedSize(horizontal: false, vertical: true)
                        .customFrame(maxWidth: .infinity, alignment: .leading)
                }
                .customPadding(t: 4, l: 6, b: 4, tr: 6)
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
