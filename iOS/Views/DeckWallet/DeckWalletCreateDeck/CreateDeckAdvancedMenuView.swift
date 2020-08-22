import SwiftUI

extension DeckWalletBaseView.CreateDeckView {
    struct AdvancedMenuView: View {
        
        @Binding var selfIsVisible: Bool
        @Binding var deckCards: [String]
        @EnvironmentObject var appearance: EnvObjs.Appearance
        
        var body: some View {
            OverlayMenuStack(isPresented: $selfIsVisible,
                             activationDatePath: \.second) {
                OverlayMenuItem.button(title: "Identify deck from clipboard", action: deckFromClipboardAction)
                OverlayMenuItem.dismissButton(isPresented: $selfIsVisible)
            }
        }
        
        private func deckFromClipboardAction() {
            
            var clipboardString = ""
            for clipboardStr in UIPasteboard.general.strings ?? [] {
                clipboardString.append(clipboardStr)
            }
            
            if let detetedDeck = deckLinkToDeckCards(link: clipboardString) {
                withAnimation {
                    deckCards = detetedDeck
                    selfIsVisible = false
                }
            }
            else {
                Present.notificationMessage(appearance: $appearance,
                                            message: "Could not find a valid deck link from clipboard")
            }
        }
        
    }
}

private func deckLinkToDeckCards(link: String) -> [String]? {
    
    let allCards = DataSet.Cards.allValids
    
    var cardIdsFromTheLink: [Int] = []
    var stringCardIdsFromTheLink: [String] = []
    
    var deckCardsFromTheLink: [String] = []
    let linkWOSemiColons = link.replacingOccurrences(of: ";", with: "")
    let linkArray = linkWOSemiColons.map{$0}
    
    guard let number = linkWOSemiColons.firstTrailingIndexOfSubString(subString: "deck=") else {
        return nil
    }
    
    if number == 0 || linkArray.count < number + 64 {
        return nil
    }
    
    for idx in 0...7 {
        var cardId = ""
        
        for indi in 0...7 {
            cardId.append(linkArray[number+indi+1+idx*8])
        }
        
        stringCardIdsFromTheLink.append(cardId)
    }
    
    for idx in 0...7 {
        if let inti = Int(stringCardIdsFromTheLink[idx]) {
            cardIdsFromTheLink.append(inti)
        }
    }
    
    for idx in 0...7 {
        if let cardFromTheLink = (allCards.first { $0.info.id == cardIdsFromTheLink[idx] }) {
            deckCardsFromTheLink.append(cardFromTheLink.info.key)
        }
        else {
            return nil
        }
    }
    
    return deckCardsFromTheLink
}
