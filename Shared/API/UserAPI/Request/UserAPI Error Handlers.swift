import SwiftUI
import Alamofire

extension UserAPI.Requester {
    func checkPreconditionsAndReturnValues(headerMode: UserAPI.HeaderMode) -> (urlString: String,
                                                                       url: URL,
                                                                       header: HTTPHeaders)? {
        guard let urlString = model.urlString() else {
            if showAlerts {
                model.appearance.alert.set(to: .init(
                                            title: "Fail",
                                            message: "Input is invalid."))
                
                dismissProgressView()
            }
            return nil
        }
        guard let url = URL(string: urlString) else {
            if showAlerts {
                model.appearance.alert.set(to: .init(
                                            title: "Internal failure",
                                            message: "App failed to process the URL.\nPlease report a bug."))
                
                dismissProgressView()
            }
            return nil
        }
        
        var authHeader: HTTPHeaders
        if headerMode == .basic {
            guard let basicHeaders = BCryptModel().createCredentialsForBasicAuth() else {
                if showAlerts {
                    model.appearance.alert.set(to: .init(
                                                title: "Internal failure",
                                                message: "App failed to create authentication headers\nPlease report a bug if the problem continues."))
                    
                    dismissProgressView()
                }
                return nil
            }
            
            authHeader = basicHeaders
        }
        else {
            guard let token = UD.standardValue(forKey: .SIWAAccessToken) as? String else {
                if showAlerts {
                    model.appearance.alert.set(to: .init(
                                                title: "Instructions: Go to Royale Alchemist settings and tap `Sign In With Apple`",
                                                message: "You should have a Royale Alchemist account for this feature to work, so you can access your data across all your devices.\nIf you already have an account, you might need to sign in again so we can make sure its still YOU behind this device.",
                                               primaryButton: .cancel(),
                                                secondaryButton: .default(Text("Sign In/Up")) {
                                                    model.appearance.tabBarSelection.set(to: "Settings")
                                                }))
                    
                    dismissProgressView()
                }
                return nil
            }
            
            authHeader = ["Authorization" : "Bearer \(token)"]
        }
        guard Reachability.isConnectedToNetwork() else {
            if showAlerts {
                model.appearance.alert.set(to: .init(
                                            title: "Fail",
                                            message: "Make sure your device is connected to network."))
                
                dismissProgressView()
            }
            return nil
        }
        
        return (urlString: urlString, url: url, header: authHeader)
    }
}

extension UserAPI.Requester {
    func checkResponseAndReturnData(response: AFDataResponse<Any>, errorTexts: [Int: String]) -> Data? {
        guard let statusCode = response.response?.statusCode else {
            if showAlerts {
                self.model.appearance.alert.set(to: .init(
                                                    title: "Internal failure",
                                                    message: "App failed to create authentication headers\nPlease report a bug if the problem continues."))
            }
            
            return nil
        }
        guard statusCode < 300 && statusCode >= 200 else {
            if showAlerts {
                self.model.appearance.alert.set(to: .init(
                                                    title: "Fail",
                                                    message: errorTexts[statusCode] ?? errorTexts[0]!))
            }
            
            return nil
        }
        
        
        
        if let error = response.error,
           !error.isResponseSerializationError {
            print(error.localizedDescription)
            
            if showAlerts {
                self.model.appearance.alert.set(to: .init(
                                                    title: "Fail",
                                                    message: "Some errors happend in the server-side of the app.\nReport a bug if the problem continues."))
            }
            
            return nil
        }
        
        return response.data ?? .init()
    }
}

extension UserAPI {
    static var errorTexts = [400 : "Bad request, please contact us with the error code if the problem continues.",
                      401 : "Unauthorized, you need to sign in again so we know its still YOU behind the device.",
                      403 : "Forbidden, you are not permitted to access to this data",
                      404 : "Nothing could be found",
                      417 : "Expectation failed, please contact us with the error code if the problem continues.",
                      420 : "You've been blocked from the servers. Contact support if you think this is a mistake.",
                      429 : "Servers are busy, please try again later, and contact us with the error code if the problem continues.",
                      500 : "Internal server error, please try again later, and contact us with the error code if the problem continues.",
                      501 : "Endpoint not implemented yet, please contact us with the error code.",
                      503 : "API is currently under maintenance, please come back later.",
                      504 : "API took too long to respond.",
                      522 : "Service unavailable. We're offline.",
                      0 : "Unknown error, please contact us with the error code if the problem continues."]
}
