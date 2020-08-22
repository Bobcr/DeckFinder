import Foundation
import UIKit

class Device {
    static let type = UIDevice.current.userInterfaceIdiom
    static let isPad = UIDevice.current.userInterfaceIdiom == .pad
    static let isPhone = UIDevice.current.userInterfaceIdiom == .phone
    static let id = UIDevice.current.identifierForVendor
}

