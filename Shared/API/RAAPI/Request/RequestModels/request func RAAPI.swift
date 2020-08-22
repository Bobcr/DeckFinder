import Foundation
import SwiftUI

extension Requests.PlayerNameSearch {
    func request(completion: @escaping (RAAPI.Status) -> Void) {
        RAAPI.Requester.init(self).request(completion: completion)
    }
}

extension Requests.RALeaderboards {
    func request(completion: @escaping (RAAPI.Status) -> Void) {
        RAAPI.Requester.init(self).request(completion: completion)
    }
}
