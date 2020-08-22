import SwiftUI

extension SettingsBaseView {
    func makeTwitter() -> some View {
        VStack(spacing: 0) {
            Text("Social Media")
                .customFont(size: 24, weight: .medium)
                .foregroundColor(.custom(.green()))
            
            HStack(spacing: 0) {
                // commented out because of SwiftUI problems.
//                Image("twitter-logo")
//                    .resizable()
//                    .customFrame(width: 70, height: 70)
                
                Text("Follow us on Twitter & stayed tuned of all the latest Royale Alchemist news!")
                    .customFont(size: 18, weight: .medium)
                    .multilineTextAlignment(.center)
                    .customPadding(.bottom, 4)
            }
            
            Button("Follow Royale Alchemist on Twitter") {
                if let url = URL(string: "https://twitter.com/RoyaleAlchemist") {
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
        .customFont(size: 16)
        .customPadding(t: 6, l: 10, b: 6, tr: 10)
        .shadow(color: .custom(.blackShadow(), opacity: 0.2), radius: 4, x: 0, y: 0)
    }
}
