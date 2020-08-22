import Foundation

typealias OAPI = OfficialAPI

class OfficialAPI { }

extension OAPI {
    static let baseUrl = "https://www.royalealchemist.com/api/v1/officialapi/"
    
    enum Status: Equatable {
        case succeeded,
             failed
    }
}
