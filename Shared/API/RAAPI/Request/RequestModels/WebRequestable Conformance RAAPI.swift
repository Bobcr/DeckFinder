import Foundation

extension Requests.PlayerNameSearch: WebGettable {
    typealias TypeToDecodeTo = [RAAPI.Models.PlayerNameSearch.DecodeModel]
    
    func urlString() -> String? {
        return RAAPI.baseUrl + "database/get/players/searchbyname/\(name.unsafeUrlHostEncode())"
    }
}

extension Requests.RALeaderboards: WebGettable {
    typealias TypeToDecodeTo = [RAAPI.Models.Leaderboards.DecodeItem]
    
    func urlString() -> String? {
        return RAAPI.baseUrl + "database/get/players/rankings/\(mode.apiEndpointValue)/all"
    }
}
