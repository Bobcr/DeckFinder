import Foundation

extension UserAPI {
    struct PublicUser: Codable {
        var id: UUID
        var username: String
        var email: String
        
        static func getFromUD() -> Self? {
            guard let idString = UD.standardValue(forKey: .SIWAAPIID) as? String,
                  let id = UUID.init(uuidString: idString),
                  let email = UD.standardValue(forKey: .SIWAEmail) as? String,
                  let username = UD.standardValue(forKey: .SIWAUsername) as? String
            else {
                return nil
            }
            
            return .init(id: id,
                         username: username,
                         email: email)
        }
        
        func saveToUD() {
            UD.standardSet(self.id, forKey: .SIWAAPIID)
            UD.standardSet(self.email, forKey: .SIWAEmail)
            UD.standardSet(self.username, forKey: .SIWAUsername)
        }
    }
    
    struct LoginResponse: Codable {
        let accessToken: String?
        let user: PublicUser
        
        func saveToUD() {
            UD.standardSet(accessToken, forKey: .SIWAAccessToken)
            user.saveToUD()
        }
    }
}

extension UserAPI.LoginResponse: DecodeConvertible {
    func actionsToBeTakenAfterCompletion(datas: DatasEnvObj, arg: String) { }
}
