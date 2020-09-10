import Foundation
import Alamofire

enum Status {
    case failed
    case succeeded(data: PlayerChests)
}

func request(urlString: String, completion: @escaping (Status) -> ()) {
    guard let url = URL(string: urlString) else {
        return completion(.failed)
    }
    guard let authHeader = BCryptModel().createCredentialsForBasicAuth() else {
        return completion(.failed)
    }
    guard Reachability.isConnectedToNetwork() else {
        return completion(.failed)
    }
    
    AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: authHeader)
        .responseJSON { response in
            guard let statusCode = response.response?.statusCode,
                  statusCode == 200 else {
                
                return completion(.failed)
            }
            if let error = response.error {
                print(error.localizedDescription)
                return completion(.failed)
            }
            guard let responseData = response.data else {
                return completion(.failed)
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(PlayerChests.self, from: responseData)
                
                return completion(.succeeded(data: decodedData))
            }
            catch {
                print(error.localizedDescription)
                return completion(.failed)
            }
            
        }
}
