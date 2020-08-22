import UIKit
import SwiftUI
import LinkPresentation

// from ACHelper open source project which is avilable on github

public struct ActivityViewController: UIViewControllerRepresentable {
    
    public let activityItems: [Any]
    public let applicationActivities: [UIActivity]? = []
    
    public init(activityItems: [Any]) {
        self.activityItems = activityItems
    }
    
    public func makeUIViewController(context: UIViewControllerRepresentableContext<ActivityViewController>)
    -> UIActivityViewController {
        UIActivityViewController(activityItems: activityItems,
                                 applicationActivities: applicationActivities)
    }
    
    public func updateUIViewController(_ uiViewController: UIActivityViewController,
                                       context: UIViewControllerRepresentableContext<ActivityViewController>) {
        
    }
}

class ItemDetailSource: NSObject, UIActivityItemSource {
    let name: String
    let image: UIImage?
    let url: URL?
    let iconImage = UIImage(imageLiteralResourceName: "icon")
    
    init(name: String,
         image: UIImage? = nil,
         url: URL? = nil) {
        
        self.name = name
        self.image = image
        self.url = url
    }
    
    
    func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
        image ?? iconImage
    }
    
    func activityViewController(_ activityViewController: UIActivityViewController,
                                itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
        image ?? url
    }
    
    func activityViewControllerLinkMetadata(_ activityViewController: UIActivityViewController) -> LPLinkMetadata? {
        let metadata = LPLinkMetadata()
        
        metadata.title = name
        metadata.imageProvider = NSItemProvider.init(object: image ?? iconImage)
        
        return metadata
    }
}
