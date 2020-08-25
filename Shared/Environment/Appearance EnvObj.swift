import Foundation
import SwiftUI

typealias AppearanceEnvObj = EnvironmentObject<EnvObjs.Appearance>.Wrapper

extension EnvObjs {
    class Appearance: ObservableObject {
        
        @Published var tabBarSelection = UD.standardValue(forKey: .tabBarSelection) as? String ?? "DeckWallet"
        @Published var progressViewPresentation: Bool = .init()
        @Published var introductionViewPresentation
            = UD.standardValue(forKey: .firstTimeUserOpenedTheAppEver) as? Bool ?? true
        @Published var alert: Alert = .init()
        @Published var notificationMessage: NotificationMessage = .init()
        @Published var statsInstantSearch: (mode: StatsBaseView.Mode, tag: String)? = nil
        @Published var shareSheetItems = [ItemDetailSource]()
        @Published var shareSheetPresentation = false
        
    }
}

extension EnvObjs.Appearance {
    class NotificationMessage {
        var message: String
        var bgColor: Color
        var isPresented: Bool
        
        init() {
            self.message = ""
            self.bgColor = .custom(.yellow())
            self.isPresented = false
        }
        
        required init(message: String,
                      bgColor: Color = .custom(.yellow()),
                      isPresented: Bool = true) {
            
            self.message = message
            self.bgColor = bgColor
            self.isPresented = isPresented
        }
        
        func present(message: String,
                            bgColor: Color = .custom(.yellow()),
                            MessageDuration: Double = 3.5,
                            presentAnimationDuration: Double = 0.6,
                            dismissAnimationDuration: Double = 0.4) {
            
            withAnimation(.easeIn(duration: presentAnimationDuration)) {
                self.message = message
                self.bgColor = bgColor
                self.isPresented = true
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + MessageDuration) {
                
                withAnimation(.linear(duration: dismissAnimationDuration)) {
                    self.isPresented = false
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + dismissAnimationDuration) {
                        self.message = ""
                    }
                }
            }
        }
        
        static func dismiss() -> Self {
            self.init(message: "", isPresented: false)
        }
        
        func dismiss() {
            self.isPresented = false
        }
    }
}

extension EnvObjs.Appearance {
    class Alert {
        var title: Text = Text("")
        var message: Text? = nil
        var presentation: Bool = false
        var primaryButton: SwiftUI.Alert.Button = .cancel(Text("OK"))
        var secondaryButton: SwiftUI.Alert.Button? = nil
        
        init() { }
        
        init(title: String,
             message: String?,
             primaryButton: SwiftUI.Alert.Button = .cancel(Text("OK")),
             secondaryButton: SwiftUI.Alert.Button? = nil
        ) {
            self.title = Text(title)
            self.message = message != nil ? Text(message!) : nil
            self.presentation = true
            self.primaryButton = primaryButton
            self.secondaryButton = secondaryButton
        }
        
        init(title: Text,
             message: Text?,
             primaryButton: SwiftUI.Alert.Button = .cancel(Text("OK")),
             secondaryButton: SwiftUI.Alert.Button? = nil
        ) {
            self.title = title
            self.message = message
            self.presentation = true
            self.primaryButton = primaryButton
            self.secondaryButton = secondaryButton
        }
        
    }
}
