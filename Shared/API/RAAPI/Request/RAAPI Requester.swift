import SwiftUI
import Alamofire

extension RAAPI {
    struct Requester<Model> where Model: WebGettable,
                                 Model: EnvironmentFriendly {
        
        let model: Model
        var showAlerts: Bool
        var manageProgressView: Bool
        
        init(_ model: Model,
             showAlerts: Bool = true,
             manageProgressView: Bool = true) {
            
            self.model = model
            self.showAlerts = showAlerts
            self.manageProgressView = manageProgressView
        }
    }
}

extension RAAPI.Requester {
    func request(completion: @escaping (RAAPI.Status) -> ()) {
        
        showProgressView()
        
        guard let values = checkPreconditionsAndReturnValues() else {
            return completion(.failed)
        }
        
        let urlString = values.urlString
        let url = values.url
        let authHeader = values.header
        
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: authHeader)
            .responseJSON { response in
                print(response)
                
                defer {
                    self.dismissProgressView()
                }
                
                guard let responseData = checkResponseAndReturnData(response: response) else {
                    return completion(.failed)
                }
                
                do {
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(Model.TypeToDecodeTo.self, from: responseData)
                    decodedData.actionsToBeTakenAfterCompletion(datas: self.model.datas, arg: urlString)
                    
                    return completion(.succeeded)
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

extension RAAPI.Requester {
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
