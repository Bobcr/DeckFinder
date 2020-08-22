import Foundation

// for OverlayMenuStack's Z alignment
extension EnvObjs {
    class ZIndex: ObservableObject {
        
        @Published var first: Date? = nil
        @Published var second: Date? = nil
        @Published var third: Date? = nil
        @Published var fourth: Date? = nil
        @Published var fifth: Date? = nil
        
        @Published var none: Date? = nil
    }
}
