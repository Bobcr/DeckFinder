import SwiftUI
import UIKit

// this file includes those methods which are NOT used in deck extension,
// only in the main iOS app

extension View {
    func sameSizeAs(text: String,
                    withFont font: UIFont,
                    add: CGSize = .zero,
                    alignment: Alignment? = nil) -> some View {
        
        let size = UIGraphics.textSizeOfString(string: text, font: font)
        return self.customFrame(width: size.width+add.width, height: size.height+add.height, alignment: alignment)
    }
    
    @ViewBuilder
    func sameWidthAs(text: String?,
                     withFont font: UIFont,
                     minWidth: CGFloat = 0,
                     add: CGFloat = 0,
                     alignment: Alignment? = nil) -> some View {
        
        if let text = text {
            let size = UIGraphics.textSizeOfString(string: text, font: font)
            let width = max(minWidth, size.width) + add
            self.customFrame(width: width, alignment: alignment)
        }
        else {
            self
        }
    }
    
    func sameHeightAs(text: String,
                      withFont font: UIFont,
                      add: CGFloat = 0,
                      alignment: Alignment? = nil,
                      id: SizingsId = .s1) -> some View {
        
        let size = UIGraphics.textSizeOfString(string: text, font: font)
        return self.customFrame(height: size.height+add, alignment: alignment, id: id)
    }
}

extension View {
    func progressView() -> some View {
        ProgressViewStack {
            self
        }
    }
}

extension Text {
    init(_ integer: Int) {
        self.init("\(integer)")
    }
    
    init(_ double: Double,
         toDecimalPlaces decimalPlaces: Int = 0) {
        let string = double.toDecimalPlaces(count: decimalPlaces)
        self.init(decimalPlaces == 0 ? "\(Int(double))" :string)
    }
}

extension View {
    func hideKeyboard() {
        UIApplication
            .shared
            .sendAction(#selector(UIResponder.resignFirstResponder),
                        to: nil, from: nil, for: nil)
    }
}

// from ACHelper open source project which is avilable on github

extension View {
    public func asImage() -> UIImage {
        let controller = UIHostingController(rootView: self)
        
        controller.view.frame = CGRect(x: 0, y: CGFloat(Int.max), width: 1, height: 1)
        UIApplication.shared.windows.first!.rootViewController?.view.addSubview(controller.view)
        
        let size = controller.sizeThatFits(in: UIScreen.main.bounds.size)
        controller.view.bounds = CGRect(origin: .zero, size: size)
        controller.view.sizeToFit()
        
        let image = controller.view.asImage()
        controller.view.removeFromSuperview()
        return image
    }
}

extension UIView {
    public func asImage() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(bounds.size, true, UIScreen.main.scale)
        drawHierarchy(in: bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image ?? UIImage()
    }
}
