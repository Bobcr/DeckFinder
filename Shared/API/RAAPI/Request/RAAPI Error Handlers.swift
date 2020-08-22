import SwiftUI
import Alamofire

extension RAAPI.Requester {
    func checkPreconditionsAndReturnValues() -> (urlString: String,
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
        guard let authHeader = BCryptModel().createCredentialsForBasicAuth() else {
            if showAlerts {
                model.appearance.alert.set(to: .init(
                                            title: "Internal failure",
                                            message: "App failed to create authentication headers\nPlease report a bug if the problem continues."))
                
                dismissProgressView()
            }
            return nil
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

extension RAAPI.Requester {
    func checkResponseAndReturnData(response: AFDataResponse<Any>) -> Data? {
        guard let statusCode = response.response?.statusCode else {
            if showAlerts {
                self.model.appearance.alert.set(to: .init(
                                                    title: "Internal failure",
                                                    message: "App failed to create authentication headers\nPlease report a bug if the problem continues."))
            }
            
            return nil
        }
        guard statusCode == 200 else {
            if showAlerts {
                self.model.appearance.alert.set(to: .init(
                                                    title: "Fail",
                                                    message: errorText(errorCode: statusCode)))
            }
            
            return nil
        }
        if let error = response.error {
            print(error.localizedDescription)
            
            if showAlerts {
                self.model.appearance.alert.set(to: .init(
                                                    title: "Fail",
                                                    message: "Some errors happend in the server-side of the app.\nReport a bug if the problem continues."))
            }
            
            return nil
        }
        guard let responseData = response.data else {
            if showAlerts {
                self.model.appearance.alert.set(to: .init(
                                                    title: "Fail",
                                                    message: "No data could be infered from web request.\nReport a bug if the problem continues."))
            }
            
            return nil
        }
        
        return responseData
    }
}

private func errorText(errorCode: Int) -> String {
    switch errorCode {
    case 400: return "Bad request, please contact us with the error code if the problem continues."
    case 401: return "Unauthorized, please contact us with the error code."
    case 403: return "Forbidden, please contact us with the error code."
    case 404: return "Nothing could be found"
    case 417: return "Expectation failed, please contact us with the error code if the problem continues."
    case 420: return "You've been blocked from the servers. Contact support if you think this is a mistake."
    case 429: return "Servers are busy, please try again later, and contact us with the error code if the problem continues."
    case 500: return "Internal server error, please try again later, and contact us with the error code if the problem continues."
    case 501: return "Endpoint not implemented yet, please contact us with the error code."
    case 503: return "API is currently under maintenance, please come back later."
    case 504: return "API took too long to respond."
    case 522: return "Service unavailable. We're offline."
    default: return "Unknown error, please contact us with the error code if the problem continues."
    }
}
