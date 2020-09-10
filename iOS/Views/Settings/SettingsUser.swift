import SwiftUI
import AuthenticationServices

extension SettingsBaseView {
    @ViewBuilder
    func makeUser() -> some View {
        
        let signInWithApple = SignInWithApple(appearance: $appearance,
                                              datas: $datas)
        
        VStack(spacing: 0) {
            Text("User")
                .customFont(size: 24, weight: .medium)
                .customPadding(.bottom, 4)
                .foregroundColor(.custom(.green()))
            
            if let user = user {
                makeKeyValueText(key: "Username:", value: user.username)
                makeKeyValueText(key: "Email:", value: user.email)
                makeKeyValueText(key: "ID:", value: user.id.description)
                
                Button(action: signOutFromUser) {
                    HStack(spacing: 0) {
                        Spacer()
                        
                        Text("Sign Out")
                            .customFont(size: 22, weight: .semibold)
                            .customPadding(.vertical, 3)
                        
                        Spacer()
                    }
                    .customPadding(t: 3, l: 4, b: 3, tr: 4)
                    .foregroundColor(.white)
                    .background(Color.custom(.red()))
                    .customCornerRadius(8)
                    .customPadding(t: 3, l: 4, b: 3, tr: 4)
                }
                .buttonStyle(SpringButtonStyle())
            }
            
            let token = UD.standardValue(forKey: .SIWAAccessToken) as? String
            if user == nil || token == nil {
                SignInWithAppleButton(onRequest: signInWithApple.onRequest,
                                      onCompletion: { result in
                                        signInWithApple.onCompletion(result: result, user: $user)
                                      })
                    .signInWithAppleButtonStyle(.black)
                    .customFrame(height: 48)
                    .customPadding(t: 3, l: 4, b: 3, tr: 4)
            }
        }
        .customFrame(maxWidth: .infinity)
        .customPadding(6)
        .background(Color.custom(.white()))
        .customCornerRadius(8)
        .customPadding(t: 6, l: 10, b: 6, tr: 10)
        .shadow(color: .custom(.blackShadow(), opacity: 0.2), radius: 4, x: 0, y: 0)
    }
    
    private func makeKeyValueText(key: String, value: String) -> some View {
        HStack(spacing: 0) {
            Text(key)
                .customFont(size: 20, weight: .medium)
                .customPadding(t: 3, l: 4, b: 3, tr: 4)
            
            Text(value)
                .customFont(size: 19, weight: .medium)
                .customPadding(t: 3, l: 4, b: 3, tr: 4)
                .customFrame(maxWidth: .infinity, alignment: .center)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
        }
        .customPadding(.vertical, 3)
    }
    
    private func signOutFromUser() {
        appearance.alert = .init(title: "Do You Want To Sign Out From Your Account?",
                                 message: nil,
                                 primaryButton: .cancel(),
                                 secondaryButton: .destructive(Text("Sign Out")) {
                                    Requests.SignOutUser.init(datas: $datas,
                                                              appearance: $appearance)
                                        .request(showsAlerts: false) { _ in
                                            UD.standardSet(nil, forKey: .SIWAAPIID)
                                            UD.standardSet(nil, forKey: .SIWAEmail)
                                            UD.standardSet(nil, forKey: .SIWAUsername)
                                            UD.standardSet(nil, forKey: .SIWAAccessToken)
                                            withAnimation {
                                                appearance.progressViewPresentation = false
                                                user = nil
                                            }
                                        }
                                 })
    }
    
    private func sendDeleteUserReq() {
        Requests.DeleteUser.init(datas: $datas,
                                 appearance: $appearance,
                                 appleIdentifier: KeychainItem.currentUserAppleIdentifier ?? "")
            .request { status in
                switch status {
                case .succeeded:
                    UD.standardSet(nil, forKey: .SIWAAPIID)
                    UD.standardSet(nil, forKey: .SIWAEmail)
                    UD.standardSet(nil, forKey: .SIWAUsername)
                    UD.standardSet(nil, forKey: .SIWAAccessToken)
                    withAnimation {
                        user = nil
                    }
                case .failed:
                    break
                }
            }
    }
    
}
