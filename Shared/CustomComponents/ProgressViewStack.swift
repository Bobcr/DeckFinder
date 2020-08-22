import Foundation
import SwiftUI

struct ProgressViewStack<Content>: View where Content: View {
    
    let content: () -> Content
    @EnvironmentObject var appearance: EnvObjs.Appearance
    
    var body: some View {
        ZStack {
            content()
                .disabled(appearance.progressViewPresentation)
            
            if appearance.progressViewPresentation {
                ProgressView()
                    .customFrame(width: 414/5.5, height: 414/5.5, id: .s3)
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(8)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black.opacity(0.3))
                    .progressViewStyle(CircularProgressViewStyle(tint: .white))
                    .edgesIgnoringSafeArea(.all)
            }
        }
    }
}
