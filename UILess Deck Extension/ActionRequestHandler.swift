import UIKit
import MobileCoreServices

class ActionRequestHandler: NSObject, NSExtensionRequestHandling {
    var extensionContext: NSExtensionContext?
    
    func beginRequest(with context: NSExtensionContext) {
        let deckFinder = DeckFinder()
        deckFinder.findDeckAndSaveToUD(extensionContext: extensionContext)
    }
}

