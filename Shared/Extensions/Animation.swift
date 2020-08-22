import Foundation
import SwiftUI
import UIKit

extension Animation {
    static func customSpring(translation: CGSize,
                             dampingFraction: Double = 0.2,
                             relativeValue: Double = 70) -> Self {
        
        let totalDistance = translation.totalDistance()
        let ln = log(Double(totalDistance))
        let responseTime = ln/dampingFraction/relativeValue
        
        return .spring(response: responseTime,
                       dampingFraction: dampingFraction,
                       blendDuration: 0)
    }
}

extension Animation {
    static func customSpring(translation: CGSize,
                             responseTime: Double,
                             relativeValue: Double) -> Self {
        
        let totalDistance = translation.totalDistance()
        let ln = log(Double(totalDistance))
        let dampingFraction = ln/responseTime/relativeValue
        
        return .spring(response: responseTime,
                       dampingFraction: dampingFraction,
                       blendDuration: 0)
    }
}
