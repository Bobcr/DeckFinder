import Foundation
import SwiftUI

protocol EnvironmentFriendly {
    var datas: DatasEnvObj { get set }
    var appearance: AppearanceEnvObj { get set }
}
