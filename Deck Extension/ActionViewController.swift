import UIKit
import MobileCoreServices
import SwiftUI

class DeckTransferObject: ObservableObject {
    @Published var deckCards = [String]()
}

class ActionViewController: UIViewController {
    
    @IBOutlet var baseView: UIView!
    @ObservedObject var deckObject = DeckTransferObject()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let deckFinder = DeckFinder()
        deckFinder.findAndReturnDeck(extensionContext: self.extensionContext) { deck in
            if let deck = deck {
                DispatchQueue.main.async {
                    self.deckObject.deckCards = deck
                }
            }
        }
        
        let swiftUIView = AddDeckView(deckCards: $deckObject.deckCards)
        let widgetView = UIHostingController(rootView: swiftUIView)
        let childView = widgetView
        addChild(childView)
        childView.view.frame = baseView.frame
        view.addSubview(childView.view)
        childView.didMove(toParent: self)
    }
}
