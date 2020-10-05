
import SwiftUI

extension CardInfoView {
    func makeDescription() -> some View {
        VStack(spacing: 0) {
            Text("Description")
                .customFont(size: 30, weight: .medium)
                .customPadding(t: 2, b: 4)
                .foregroundColor(.custom(.green()))
            
            Text(card.info.description)
                .customFont(size: 19, weight: .medium)
                .customPadding(l: 6, b: 3, tr: 6)
                .multilineTextAlignment(.center)
        }
        .customFrame(maxWidth: .infinity)
        .customPadding(6)
        .background(Color.custom(.white()))
        .customCornerRadius(8)
        .customPadding(t: 6, l: 10, b: 6, tr: 10)
        .shadow(color: .custom(.blackShadow(), opacity: 0.2), radius: 4, x: 0, y: 0)
    }
}
