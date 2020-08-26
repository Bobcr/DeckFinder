import Foundation
import UIKit
import SwiftUI

class Device {
    static let type = UIDevice.current.userInterfaceIdiom
    static let isPad = UIDevice.current.userInterfaceIdiom == .pad
    static let isPhone = UIDevice.current.userInterfaceIdiom == .phone
    static let orientation = UIDevice.current.orientation
    static let isPortraitOrientation = orientation == .landscapeLeft || orientation == .landscapeRight
    static let navigationBarItemSpacing = Device.isPhone ? 0 : (screen.height - screen.width)/2
    static let navigationBarImageFont: Font = Device.isPhone ? .title : .system(size: .custom(22))
    static let navigationBarTextFont: Font = Device.isPhone ? .title2 : .system(size: .custom(22))
    static var id: UUID {
        if let string = UD.sharedValue(forKey: .deviceId) as? String,
           let uuid = UUID(uuidString: string) {
            return uuid
        }
        else {
            let uuid = UUID()
            UD.sharedSet(uuid.uuidString, forKey: .deviceId)
            return uuid
        }
    }
}

