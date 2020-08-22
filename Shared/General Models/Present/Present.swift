import Foundation
import UIKit
import SwiftUI

extension Present {
    static func alertWithTextField(title: String,
                                          message: String,
                                          placeholder: String,
                                          buttonTitle: String,
                                          keyboardType: UIKeyboardType = .default,
                                          buttonAction: @escaping (_ alert: UIAlertController) -> ()) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addTextField() { textField in
            textField.placeholder = placeholder
            textField.autocapitalizationType = .words
            textField.keyboardType = keyboardType
        }
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) { _ in })
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default) { alertAction in
            buttonAction(alert)
        })
        
        makeAlertWithTextField(alert: alert)
    }
}

extension Present {
    static func notificationMessage(appearance: AppearanceEnvObj,
                                    message: String,
                                    bgColor: Color = .custom(.yellow()),
                                    MessageDuration: Double = 3.5,
                                    presentAnimationDuration: Double = 0.6,
                                    dismissAnimationDuration: Double = 0.4) {
        
        withAnimation(.easeIn(duration: presentAnimationDuration)) {
            if !appearance.notificationMessage.wrappedValue.isPresented {
                appearance.notificationMessage.set(to: .init(message: message, bgColor: bgColor))
            }
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + MessageDuration) {
            
            withAnimation(.linear(duration: dismissAnimationDuration)) {
                appearance.notificationMessage.isPresented.set(to: false)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + dismissAnimationDuration) {
                    appearance.notificationMessage.message.set(to: "")
                }
            }
        }
    }
    
    static func statsViewWithInstantSearch(appearance: AppearanceEnvObj,
                                            mode: StatsBaseView.Mode,
                                            tag: String) {
        withAnimation {
            appearance.statsInstantSearch.set(to: (mode, tag.asTag()))
            appearance.tabBarSelection.set(to: "Stats")
        }
    }
}
