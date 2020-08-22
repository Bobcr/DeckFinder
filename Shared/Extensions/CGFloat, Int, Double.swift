import Foundation
import UIKit

enum SizingsId {
    case s1
    case s2
    case s3
    case s4
}

enum Sizings {
    case reduced
    case lessReduced
    case moreReduced
    case notReduced
    
    static func fromId(_ id: SizingsId) -> Self {
        switch id {
        case .s1: return .reduced
        case .s2: return .lessReduced
        case .s3: return .moreReduced
        case .s4: return .notReduced
        }
    }
}

extension Optional where Wrapped == CGFloat {
    func customize(_ sizing: Sizings) -> Self {
        if let unwrapped = self {
            return unwrapped.customize(sizing)
        }
        return nil
    }
}

extension CGFloat {
    func customize(_ sizing: Sizings) -> Self {
        let normalMultiplier = screen.width/414
        let multiplier: CGFloat
        guard self != .infinity else {
            return .infinity
        }
        
        switch Device.type {
        case .pad:
        switch sizing {
        case .reduced: multiplier = pow(normalMultiplier, 1/2)
        case .lessReduced: multiplier = pow(normalMultiplier, 2/3)
        case .moreReduced: multiplier = pow(normalMultiplier, 1/3)
        case .notReduced: multiplier = normalMultiplier
        }
        case .phone: return self * normalMultiplier
        default: return self
        }
        
        return self * multiplier
    }
}

extension CGFloat {
    static func custom(_ value: CGFloat, id: SizingsId = .s1) -> CGFloat {
        return value.customize(.fromId(id))
    }
}

extension CGFloat {
    func absoluteDistance(to other: CGFloat) -> CGFloat {
        let distance = self.distance(to: other)
        return distance > 0 ? distance : -distance
    }
}

extension Int {
    func absoluteDistance(to other: Int) -> Int {
        let distance = self.distance(to: other)
        return distance > 0 ? distance : -distance
    }
}

extension Int {
    /// tries to add the `value` to `self`,
    /// if `value + self` exeeds min/max, it bounces to max/min
    mutating func addOrBounce(value: Int = 1, min: Int = 0, max: Int) {
        switch self {
        case let x where x+value >= min && x+value <= max: self += value
        case let x where x+value < min: self = max
        case let x where x+value > max: self = min
        default: break // should not ever happen
        }
    }
}

extension Int {
    func removeGroupingSeparator() -> String {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ""
        let stringi = formatter.string(from: NSNumber(value: self))
        return stringi ?? ""
    }
    
    func addGroupingSeparator(seperator: String = ",") -> String {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = seperator
        formatter.numberStyle = .decimal
        let formattedNumber = formatter.string(from: NSNumber(value: self))
        return formattedNumber ?? ""
    }
}

extension Double {
    func toDecimalPlaces(count: Int) -> String {
        "\(NSString(format: ("%.\(count)f" as NSString), self))"
    }
    
    func maxDigitCount(_ count: Int) -> String {
        "\(NSString(format: ("%.\(count)g" as NSString), self))"
    }
}
