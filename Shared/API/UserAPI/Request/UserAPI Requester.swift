import Alamofire
import SwiftUI

extension UserAPI {
    struct Requester<Model> where Model: WebPostable,
                                 Model: EnvironmentFriendly {
        
        enum Status {
            case succeeded(data: Model.TypeToDecodeTo), failed
        }
        
        let model: Model
        var showAlerts: Bool
        var errorTexts: [Int: String]
        var manageProgressView: Bool
        
        init(_ model: Model,
             showAlerts: Bool = true,
             errorTexts: ([Int: String]) -> ([Int: String]) =  { _ in UserAPI.errorTexts },
             manageProgressView: Bool = true) {
            
            self.model = model
            self.showAlerts = showAlerts
            self.errorTexts = errorTexts(UserAPI.errorTexts)
            self.manageProgressView = manageProgressView
        }
    }
}

extension UserAPI.Requester {
    func request(completion: @escaping (Status) -> ()) {
        // doesnt show a second alert if there is not a delay here
        Funcs.after(seconds: 0.1) {
            showProgressView()
            
            guard let values = checkPreconditionsAndReturnValues(headerMode: Model.headerMode) else {
                return completion(.failed)
            }
            
            let urlString = values.urlString
            let url = values.url
            let authHeader = values.header
            let postableValue = model.postableValue()
            
            let request: DataRequest
            if postableValue != nil {
                request = AF.request(url, method: .post,
                                     parameters: postableValue,
                                     encoder: JSONParameterEncoder.default,
                                     headers: authHeader)
            }
            else {
                request = AF.request(url, method: .get, headers: authHeader)
            }
            
            request
                .responseJSON { response in
                    print(response)
                    
                    defer {
                        self.dismissProgressView()
                    }
                    
                    do {
                        if Model.TypeToDecodeTo.self != UserAPI.DontDecode.self &&
                            response.description != "success(<null>)" {
                            
                            if response.response?.statusCode == 401 {
                                UD.standardSet(nil, forKey: .SIWAAccessToken)
                            }
                            
                            guard let responseData = checkResponseAndReturnData(response: response,
                                                                                errorTexts: errorTexts) else {
                                return completion(.failed)
                            }
                            
                            let decoder = JSONDecoder()
                            let decodedData = try decoder.decode(Model.TypeToDecodeTo.self, from: responseData)
                            decodedData.actionsToBeTakenAfterCompletion(datas: self.model.datas, arg: urlString)
                            
                            return completion(.succeeded(data: decodedData))
                        }
                        else if let data = UserAPI.DontDecode() as? Model.TypeToDecodeTo {
                            if response.response?.statusCode == 401 {
                                UD.standardSet(nil, forKey: .SIWAAccessToken)
                            }
                            
                            guard let _ = checkResponseAndReturnData(response: response,
                                                                     errorTexts: errorTexts) else {
                                return completion(.failed)
                            }
                            
                            return completion(.succeeded(data: data))
                        }
                        else {
                            self.model.appearance.alert.set(to: .init(
                                                                title: "Internal failure",
                                                                message: "App failed to decode data.\nPlease report a bug."))
                            
                            return completion(.failed)
                        }
                    }
                    catch {
                        print(error.localizedDescription)
                        
                        self.model.appearance.alert.set(to: .init(
                                                            title: "Internal failure",
                                                            message: "App failed to decode data.\nPlease report a bug."))
                        
                        return completion(.failed)
                    }
                    
                }
        }
    }
}

extension UserAPI.Requester {
    func showProgressView() {
        if manageProgressView {
            model.appearance.progressViewPresentation.animation().set(to: true)
        }
    }
    
    func dismissProgressView() {
        if showAlerts && manageProgressView {
            model.appearance.progressViewPresentation.animation().set(to: false)
        }
    }
}

