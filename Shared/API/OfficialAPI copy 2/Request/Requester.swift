//
//  Requester.swift
//  iOS
//
//  Created by Mohammad on 7/7/20.
//

import Foundation
import Alamofire
import SwiftUI


extension OAPI {
    struct Requester<Model> where Model: WebRequestable,
                                 Model: EnvironmentFriendly {
        
        let model: Model
        
        init(_ model: Model) {
            self.model = model
        }
    }
}

extension OAPI.Requester {
    func request(completion: @escaping (OAPI.Status) -> ()) {
        model.appearance.progressViewPresentation.set(to: true)
        
        guard let urlString = model.urlString() else {
            model.appearance.alert.set(to: .init(
                title: "Fail",
                message: "Input is invalid."))
            
            model.appearance.progressViewPresentation.set(to: false)
            return completion(.failed)
        }
        guard let url = URL(string: urlString) else {
            model.appearance.alert.set(to: .init(
                title: "Internal failure",
                message: "App failed to process the URL.\nPlease report a bug."))
            
            model.appearance.progressViewPresentation.set(to: false)
            return completion(.failed)
        }
        guard let authHeader = BCryptModel().createCredentialsForBasicAuth() else {
            model.appearance.alert.set(to: .init(
                title: "Internal failure",
                message: "App failed to create authentication headers\nPlease report a bug if the problem continues."))
            
            model.appearance.progressViewPresentation.set(to: false)
            return completion(.failed)
        }
        guard Reachability.isConnectedToNetwork() else {
            model.appearance.alert.set(to: .init(
                title: "Fail",
                message: "Make sure your device is connected to network."))
            
            model.appearance.progressViewPresentation.set(to: false)
            return completion(.failed)
        }
        
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: authHeader)
            .responseJSON { response in
                print(response)
                defer {
                    self.model.appearance.progressViewPresentation.set(to: false)
                }
                
                guard let statusCode = response.response?.statusCode else {
                    self.model.appearance.alert.set(to: .init(
                        title: "Internal failure",
                        message: "App failed to create authentication headers\nPlease report a bug if the problem continues."))
                    
                    return completion(.failed)
                }
                guard statusCode == 200 else {
                    self.model.appearance.alert.set(to: .init(
                        title: "Fail",
                        message: errorText(errorCode: statusCode)))
                    
                    return completion(.failed)
                }
                if let error = response.error {
                    print(error.localizedDescription)
                    
                    self.model.appearance.alert.set(to: .init(
                        title: "Fail",
                        message: "Some errors happend in the server-side of the app.\nReport a bug if the problem continues."))
                    
                    return completion(.failed)
                }
                guard let responseData = response.data else {
                    self.model.appearance.alert.set(to: .init(
                        title: "Fail",
                        message: "No data could be infered from web request.\nReport a bug if the problem continues."))
                    
                    return completion(.failed)
                }
                
                do {
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(Model.TypeToDecodeTo.self, from: responseData)
                    decodedData.convertAndSave(datas: self.model.datas)
                    
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
    case 522: return "Service unavailable. We're offline."
    default: return "Unknown error, please contact us with the error code if the problem continues."
    }
}
