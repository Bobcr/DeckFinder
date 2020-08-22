import SwiftUI
import AuthenticationServices

class SignInWithApple {
    
    var appearance: AppearanceEnvObj
    var datas: DatasEnvObj
    
    init(appearance: AppearanceEnvObj,
         datas: DatasEnvObj) {
        
        self.appearance = appearance
        self.datas = datas
    }
    
    func onRequest(_ request: ASAuthorizationAppleIDRequest) {
        request.requestedScopes = [.email, .fullName]
    }
    
    func onCompletion(result: Result<ASAuthorization, Error>,
                      user: Binding<UserAPI.PublicUser?> = .constant(nil)) {
        switch result {
        case .success(let authorization):
            switch authorization.credential {
            case let appleIDCredential as ASAuthorizationAppleIDCredential:
                
                guard let tokenData = appleIDCredential.identityToken,
                      let appleIdentityToken = String(data: tokenData, encoding: .utf8),
                      appleIdentityToken != "" else {
                    
                    print("cominucation fail")
                    appearance.alert.set(to: .init(title: "Fail",
                                                   message: "Cominucation with apple servers was incomplete"))
                    return
                }
                let userAppleIdentifier = appleIDCredential.user
                let familyName = appleIDCredential.fullName?.familyName
                let givenName = appleIDCredential.fullName?.givenName
                let emailByApple = appleIDCredential.email
                print("heree")
                var usernameByApple: String? {
                    if let familyName = familyName,
                       let givenName = givenName {
                        return givenName + " " + familyName
                    }
                    else {
                        return nil
                    }
                }
                
                let udUsername = UD.standardValue(forKey: .SIWAUsername) as? String
                let udEmail = UD.standardValue(forKey: .SIWAEmail) as? String
                
                if UD.standardValue(forKey: .SIWAEmail) == nil ||
                    UD.standardValue(forKey: .SIWAUsername) == nil {
                    safeSaveToUD(email: emailByApple,
                                 username: usernameByApple)
                }
                
                do {
                    try KeychainItem(service: Constants.appBundleId,
                                     account: "userAppleIdentifier")
                        .saveItem(userAppleIdentifier)
                } catch {
                    appearance.alert.set(to: .init(title: "Failed to get User",
                                                   message: "Could not get your user identifier from keychain"))
                }
                
                Requests.LoginUser.init(datas: datas,
                                        appearance: appearance,
                                        siwaDTO: .init(appleIdentityToken: appleIdentityToken,
                                                       userAppleIdentifier: userAppleIdentifier,
                                                       email: emailByApple ?? udEmail,
                                                       username: usernameByApple ?? udUsername))
                    .request(errorTexts: { defaultTexts in
                        var defaultTexts = defaultTexts
                        defaultTexts[417] = "Due to comminucation problems, we don't have access to your email and/or username, so we can't continue the process. To solve the problem please disable Royale Alchemist from using your apple id by going to Settings -> AppleID (should be the first item) -> Password & Security -> Apps Using Your Apple ID -> Royale Alchemist and choose `Stop Using Apple ID`. Then after a few minutes try to register in Royale Alchemist again"
                        return defaultTexts
                    }) { status in
                        switch status {
                        case .succeeded(let data):
                            UD.standardSet(data.accessToken, forKey: .SIWAAccessToken)
                            UD.standardSet(data.user.id.description, forKey: .SIWAAPIID)
                            safeSaveToUD(email: data.user.email,
                                         username: data.user.username)
                            withAnimation {
                                user.set(to: .getFromUD())
                            }
                        default: { }()
                        }
                    }
            default:
                appearance.alert.set(to: .init(title: "Failed to register you using your AppleID",
                                               message: "Registration was unsuccessful"))
            }
        case .failure(let error):
            appearance.alert.set(to: .init(title: "Failed to sign you in/up using your AppleID",
                                           message: "Apple error description: \(error.localizedDescription)"))
        }
    }
    
}

private func safeSaveToUD(email: String?, username: String?) {
    if let email = email,
       email != "" {
        UD.standardSet(email, forKey: .SIWAEmail)
    }
    
    if let username = username,
       username != "" {
        UD.standardSet(username, forKey: .SIWAUsername)
    }
}
