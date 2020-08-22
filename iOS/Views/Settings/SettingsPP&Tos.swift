import SwiftUI

extension SettingsBaseView {
    func makePrivacyPolicyAndToS() -> some View {
        VStack(spacing: 0) {
            Text("Privacy Policy & ToS")
                .customFont(size: 24, weight: .medium)
                .customPadding(.bottom, 6)
                .foregroundColor(.custom(.green()))
            
            Text("By using Royale Alchemist, you agree to our Privacy Policy and ToS")
                .customFont(size: 18, weight: .medium)
                .multilineTextAlignment(.center)
                .customPadding(.bottom, 4)
            
            Button("Royale Alchemist's Privacy Policy & ToS") {
                if let url = URL(string: "https://t.me/RoyaleAlchemistPP/8") {
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
