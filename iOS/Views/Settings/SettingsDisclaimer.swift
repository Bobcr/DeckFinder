import SwiftUI

extension SettingsBaseView {
    func makeDisclaimerAndAll() -> some View {
        VStack(spacing: 0) {
            Text("Disclaimer")
                .customFont(size: 24, weight: .medium, design: .monospaced)
                .customPadding(.bottom, 6)
                .foregroundColor(.custom(.red()))
            
            Text("This content is not affiliated with, endorsed, sponsored, or specifically approved by Supercell, and Supercell is not responsible for it. For more information, see Supercell's Fan Content Policy")
                .customFont(size: 18, weight: .medium, design: .monospaced)
                .multilineTextAlignment(.center)
                .customPadding(.bottom, 4)
            
            Button("Supercell's Fan Content Policy") {
                if let url = URL(string: "https://www.supercell.com/fan-content-policy") {
                    openURL.callAsFunction(url)
                }
                else {
                    Present.notificationMessage(appearance: $appearance,
                                                message: "Something Went Wrong :(")
                }
            }
            .customFont(size: 18, weight: .medium)
        }
        .customFrame(maxWidth: .infinity)
        .customPadding(6)
        .background(Color.custom(.white()))
        .customCornerRadius(8)
        .customPadding(t: 6, l: 10, b: 6, tr: 10)
        .shadow(color: .custom(.blackShadow(), opacity: 0.2), radius: 4, x: 0, y: 0)
    }
}
