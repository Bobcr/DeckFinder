import Foundation
import SwiftUI

struct BGStack<Content>: View where Content: View {
    
    var frameWidth: CGFloat?
    var color: Color
    let content: () -> Content
    
    init(frameWidth: CGFloat? = screen.width,
         color: Color = .custom(.gray(id: .c5)),
         @ViewBuilder content: @escaping () -> Content) {
        
        self.color = color
        self.content = content
        self.frameWidth = frameWidth
    }
    
    var body: some View {
        ZStack {
            color
                .edgesIgnoringSafeArea(.all)
            
            content()
                .frame(width: frameWidth)
        }
    }
}

