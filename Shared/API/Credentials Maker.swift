import Foundation
import PerfectBCrypt
import Alamofire

class BCryptModel { }

extension BCryptModel {
    struct Credentials {
        let username: String
        let password: String
    }
}

extension BCryptModel {
    private func createString() -> String {
        return ""
    }
}

extension BCryptModel {
    func createCredentialsForBasicAuth() -> HTTPHeaders? {
        
        #warning("""
            Currently you can't make api calls,
            but i'll be happy to give you an username-password for your test uses.
            if you don't need to make api calls, you can ignore this warning and
            fill username and password below with empty strings.
            """)
        
        let username = <#usrename#>
        let password = <#password#>
        
        return Credentials(username: username, password: password).convertToBasicAuthHeader()
    }
}

extension BCryptModel.Credentials {
    func convertToBasicAuthHeader() -> HTTPHeaders? {
        
        guard let credentialData = "\(username):\(password)"
                .data(using: .utf8) else {
            return nil
        }
        
        let base64Credentials = credentialData.base64EncodedString(options: [])
        let authHeader: HTTPHeaders = ["Authorization": "Basic \(base64Credentials)"]
        
        return authHeader
    }
}
