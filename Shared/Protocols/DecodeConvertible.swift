import Foundation
import SwiftUI

protocol DecodeConvertible {
    func actionsToBeTakenAfterCompletion(datas: DatasEnvObj, arg: String)
}
