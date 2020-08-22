import SwiftUI

struct NotificationMessage<Content: View>: View {
    
    @EnvironmentObject var appearance: EnvObjs.Appearance
    var content: () -> (Content)
    
    init(@ViewBuilder content: @escaping () -> (Content)) {
        self.content = content
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            content()
            
            makeMessage()
                .edgesIgnoringSafeArea(.all)
                .offset(y: appearance.notificationMessage.isPresented ? 15 : -screen.height/4)
                .animation(.linear)
        }
    }
    
    private func makeMessage() -> some View {
        HStack(spacing: 0) {
            Text(appearance.notificationMessage.message)
                .foregroundColor(.custom(.white()))
                .customFont(size: 25, weight: .semibold)
                .customPadding(t: 6, l: 6, b: 6, tr: 6)
                .multilineTextAlignment(.center)
        }
        .customFrame(width: screen.width*4/5)
        .background(Capsule()
                        .foregroundColor(appearance.notificationMessage.bgColor))
        
    }
    
}

extension View {
    func notificationMessage() -> some View {
        NotificationMessage() {
            self
        }
    }
}
