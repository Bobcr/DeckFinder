import SwiftUI
import Alamofire


extension OAPI {
    struct Requester<Model> where Model: WebGettable,
                                  Model: EnvironmentFriendly {
        
        let model: Model
        var showsAlerts: Bool
        var managesProgressView: Bool
        
        init(_ model: Model,
             showsAlerts: Bool = true,
             managesProgressView: Bool = true) {
            
            self.model = model
            self.showsAlerts = showsAlerts
            self.managesProgressView = managesProgressView
        }
    }
}

extension OAPI.Requester {
    func request(completion: @escaping (OAPI.Status) -> ()) {
        
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
                    
                    withAnimation {
                        decodedData.actionsToBeTakenAfterCompletion(datas: self.model.datas, arg: urlString)
                    }
                    
                    return completion(.succeeded)
                }
                catch {
                    print(error.localizedDescription)
                    
                    if showsAlerts {
                        self.model.appearance.alert.set(to: .init(
                                                            title: "Internal failure",
                                                            message: "App failed to decode data.\nPlease report a bug."))
                    }
                    
                    return completion(.failed)
                }
                
            }
    }
}

extension OAPI.Requester {
    func showProgressView() {
        if managesProgressView {
            model.appearance.progressViewPresentation.animation().set(to: true)
        }
    }
    
    func dismissProgressView() {
        if showsAlerts && managesProgressView {
            model.appearance.progressViewPresentation.animation().set(to: false)
        }
    }
}

