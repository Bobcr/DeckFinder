//
//  Requester.swift
//  iOS
//
//  Created by Mohammad on 7/7/20.
//

import Foundation
import Alamofire
import SwiftUI

protocol DecodeConvertible {
    associatedtype TypeToConvertToAfterDecode
    func convertAfterDecode() -> TypeToConvertToAfterDecode
}

protocol WebRequestable {
    associatedtype TypeToDecodeTo
    where TypeToDecodeTo: DecodeConvertible,
          TypeToDecodeTo: Codable
    func urlString() -> String
}

extension OAPI {
    class Requester<Model> where Model: WebRequestable {
        let model: Model
        let datas: EnvironmentObject<EnvObjs.Datas>.Wrapper
        let appearance: EnvironmentObject<EnvObjs.Appearance>.Wrapper
        
        init(model: Model,
             datas: EnvironmentObject<EnvObjs.Datas>.Wrapper,
             appearance: EnvironmentObject<EnvObjs.Appearance>.Wrapper) {
            
            self.model = model
            self.datas = datas
            self.appearance = appearance
        }
    }
}

extension OAPI.Requester {
    
    func request(completion: @escaping (Model.TypeToDecodeTo.TypeToConvertToAfterDecode?) -> ()) {
        
        guard let url = URL(string: model.urlString()) else {
            let alert: EnvObjs.Appearance.Alert = .init()
            
            alert.title = Text("Internal failure")
            alert.message = Text("App failed to process the URL.\nPlease report a bug.")
            alert.presentation = true
            
            appearance.alert.wrappedValue = alert
            
            return completion(nil)
        }
        
        //        let apiToken = API.apiToken
        let authHeader: HTTPHeaders = [ "Authorization" : "Bearer " ]
        
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: authHeader)
            .responseJSON { response in
                print(response)
                
                guard let statusCode = response.response?.statusCode else {
                    let alert: EnvObjs.Appearance.Alert = .init()
                    
                    alert.title = Text("Internal failure")
                    alert.message = Text("App failed to infer a status-code.\nPlease report a bug.")
                    alert.presentation = true
                    
                    self.appearance.alert.wrappedValue = alert
                    
                    return completion(nil)
                }
                guard statusCode == 200 else {
                    let alert: EnvObjs.Appearance.Alert = .init()
                    
                    alert.title = Text("Fail")
                    alert.message = Text(errorText(errorCode: statusCode))
                    alert.presentation = true
                    
                    self.appearance.alert.wrappedValue = alert
                    
                    return completion(nil)
                }
                if let error = response.error {
                    print(error.localizedDescription)
                    
                    let alert: EnvObjs.Appearance.Alert = .init()
                    
                    alert.title = Text("Fail")
                    alert.message = Text("Some errors happend in the server-side of the app.\nReport a bug if the problem continues.")
                    alert.presentation = true
                    
                    self.appearance.alert.wrappedValue = alert
                    
                    return completion(nil)
                }
                guard let responseData = response.data else {
                    let alert: EnvObjs.Appearance.Alert = .init()
                    
                    alert.title = Text("Fail")
                    alert.message = Text("No data could be infered from web request.\nReport a bug if the problem continues.")
                    alert.presentation = true
                    
                    self.appearance.alert.wrappedValue = alert
                    
                    return completion(nil)
                }
                
                do {
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode(Model.TypeToDecodeTo.self, from: responseData)
                    let convertedDecodedData = decodedData.convertAfterDecode()
                    
                    return completion(convertedDecodedData)
                }
                catch {
                    debugPrint(error)
                    
                    let alert: EnvObjs.Appearance.Alert = .init()
                    
                    alert.title = Text("Internal failure")
                    alert.message = Text("App failed to decode data.\nPlease report a bug.")
                    alert.presentation = true
                    
                    self.appearance.alert.wrappedValue = alert
                    
                    return completion(nil)
                }
                
            }
    }
}

private func errorText(errorCode: Int) -> String {
    
    if errorCode == 400 {
        return "Bad request, please contact us with the error code if the problem continues."
    }
    else if errorCode == 401 {
        return "Unauthorized, please contact us with the error code."
    }
    else if errorCode == 403 {
        return "Forbidden, please contact us with the error code."
    }
    else if errorCode == 404 {
        return "Nothing could be found"
    }
    else if errorCode == 417 {
        return "Expectation failed, please contact us with the error code if the problem continues."
    }
    else if errorCode == 420 {
        return "Too many unsuccessful requests from your device. You'll need to reinstall the app. Contact Royale Alchemist's support if you think this is a mistake."
    }
    else if errorCode == 429 {
        return "Servers are busy, please try again later, and contact us with the error code if the problem continues."
    }
    else if errorCode == 500 {
        return "Internal server error, please try again later, and contact us with the error code if the problem continues."
    }
    else if errorCode == 501 {
        return "Endpoint not implemented yet, please contact us with the error code."
    }
    else if errorCode == 503 {
        return "API is currently under maintenance, please come back later."
    }
    else if errorCode == 522 {
        return "Service unavailable. We're offline."
    }
    else {
        return "Unknown error, please contact us with the error code if the problem continues."
    }
    
}
