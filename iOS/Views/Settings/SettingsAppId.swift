import SwiftUI

extension SettingsBaseView {
    func makeAppId(id: UUID) -> some View {
        VStack(spacing: 0) {
            Text("App Identifier")
                .customFont(size: 24, weight: .medium)
                .customPadding(.bottom, 6)
                .foregroundColor(.custom(.green()))
            
            Text("\(id)")
                .customFont(size: 18, weight: .medium)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
            
            Button("tap to copy") {
                UIPasteboard.general.string = "\(id)"
                Present.notificationMessage(appearance: $appearance,
                                            message: "Copied to clipboard!")
            }
        }
        .customFrame(maxWidth: .infinity)
        .customPadding(6)
        .background(Color.custom(.white()))
        .customCornerRadius(8)
        .customFont(size: 16)
        .customPadding(t: 6, l: 10, b: 6, tr: 10)
        .shadow(color: .custom(.blackShadow(), opacity: 0.2), radius: 4, x: 0, y: 0)
    }
}
