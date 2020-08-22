import Foundation

typealias RAAPI = RoyaleAlchemistAPI

class RoyaleAlchemistAPI { }

extension RAAPI {
    static let baseUrl = "https://www.royalealchemist.com/api/v1/officialapi/"
    
    enum Status {
        case succeeded, failed
    }
}
