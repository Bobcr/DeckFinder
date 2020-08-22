import Foundation

extension UserAPI {
    struct SIWADTO: Codable {
        var appleIdentityToken: String
        var userAppleIdentifier: String
        var email: String?
        var username: String?
    }
}
