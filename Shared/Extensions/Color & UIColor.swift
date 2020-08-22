import Foundation
import SwiftUI
import UIKit

extension Color {
    static func custom(_ color: DynamicColors, opacity: Double = 1) -> Color {
        let newColor = color.color
        return newColor.opacity(opacity)
    }
}

enum ColorIds {
    case c1, c2, c3, c4, c5, c6
}

enum DynamicColors {
    case gray(id: ColorIds = .c1)
    case secondary(id: ColorIds = .c1)
    case black(id: ColorIds = .c1)
    case blackShadow(id: ColorIds = .c1)
    case blue(id: ColorIds = .c1)
    case green(id: ColorIds = .c1)
    case pink(id: ColorIds = .c1)
    case yellow(id: ColorIds = .c1)
    case orange(id: ColorIds = .c1)
    case purple(id: ColorIds = .c1)
    case red(id: ColorIds = .c1)
    case white(id: ColorIds = .c1)
    case indigo(id: ColorIds = .c1)
    case teal(id: ColorIds = .c1)
    case other(color: Color)
    
    var color: Color {
        switch self {
        case .gray(let id):
            switch id {
            case .c1: return .init("gray")
            case .c2: return .init("gray2")
            case .c3: return .init("gray3")
            case .c4: return .init("gray4")
            case .c5: return .init("gray5")
            case .c6: return .init("gray6")
            }
        case .secondary: return .init("gray")
        case .black(let id):
            switch id {
            case .c1: return .init("black")
            default: return .init("blackBlack")
            }
        case .blackShadow: return .init("blackShadow")
        case .blue: return .init("blue")
        case .green: return .init("green")
        case .pink: return .init("pink")
        case .yellow: return .init("yellow")
        case .orange: return .init("orange")
        case .purple: return .init("purple")
        case .red: return .init("red")
        case .white: return .init("white")
        case .indigo: return .init("indigo")
        case .teal: return .init("teal")
        case .other(let color): return color
        }
    }
}

