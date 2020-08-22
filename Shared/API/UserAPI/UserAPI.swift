import Foundation

class UserAPI { }

extension UserAPI {
    static let baseUrl = "https://www.royalealchemist.com/api/v1/user/"
    
    enum HeaderMode {
        case bearer, basic
    }
}
