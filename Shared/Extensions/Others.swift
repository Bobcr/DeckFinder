import Foundation
import SwiftUI
import CoreData

extension Binding {
    func set(to value: Value) {
        self.wrappedValue = value
    }
}

extension CGSize {
    func totalDistance() -> CGFloat {
        let height = self.height
        let width = self.width
        
        return pow(pow(height, 2)+pow(width, 2), 1/2)
    }
}

extension CGSize {
    static let screenWidth = CGSize.init(width: screen.width, height: 0)
    static let screenHeight = CGSize.init(width: 0, height: screen.height)
    static let fullScreenSize = CGSize.init(width: screen.width, height: screen.height)
}

extension UIFont {
    static func custom(size: CGFloat,
                       weight: Weight = .semibold,
                       design: UIFontDescriptor.SystemDesign = .rounded) -> UIFont {
        
        return UIGraphics.font(size: size, weight: weight, design: design)
    }
}

extension Array where Element == DeckWalletCategory {
    static func getMOCCategories(moc: NSManagedObjectContext,
                            appearance: AppearanceEnvObj) -> [DeckWalletCategory] {
        
        let fetchedDecks = DeckWallet.getAll(moc: moc, appearance: appearance)
        let categories = fetchedDecks.convertToCategorizedDecks()
        
        return categories
    }
}

