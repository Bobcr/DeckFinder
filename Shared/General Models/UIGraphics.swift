import Foundation
import UIKit

extension UIGraphics {
    // creates an UIFont 
    static func font(size: CGFloat,
                     weight: UIFont.Weight = .semibold,
                     design: UIFontDescriptor.SystemDesign = .rounded) -> UIFont {
        
        let systemFont = UIFont.systemFont(ofSize: size, weight: weight)
        let font: UIFont
        if let descriptor = systemFont.fontDescriptor.withDesign(design) {
            font = UIFont(descriptor: descriptor, size: size)
        }
        else {
            font = systemFont
        }
        
        return font
    }
}

extension UIGraphics {
    /// returns the real size of an string when used in UI, based on provided UIFont
    static func textSizeOfString(string: String, font: UIFont) -> CGSize {
        
        let nsString = string as NSString
        let attrs = [NSAttributedString.Key.font: font]
        let size = nsString.size(withAttributes: attrs)
        
        return size
    }
}
