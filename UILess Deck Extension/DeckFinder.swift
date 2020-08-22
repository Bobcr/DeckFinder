import Foundation
import CoreData

class DeckFinder {
    
    struct CardsInfo {
        var key: String
        var id: Int
        var elixir: Int
        
        static func getFromUD() -> [Self]? {
            guard let cardIds = UD.sharedValue(forKey: .allCardIds) as? [Int],
                  let cardKeys = UD.sharedValue(forKey: .allCardKeys) as? [String],
                  let cardElixirs = UD.sharedValue(forKey: .allCardElixirs) as? [Int],
                  cardKeys.count == cardIds.count,
                  cardIds.count == cardElixirs.count else {
                
                return nil
            }
            
            return cardIds.enumerated().map { index, id in
                CardsInfo(key: cardKeys[index], id: id, elixir: cardElixirs[index])
            }
        }
    }
    
    func findDeckAndSaveToUD(extensionContext: NSExtensionContext?) {
        findLink(extensionContext: extensionContext) { link in
            guard let link = link else {
                return
            }
            guard let deckCards = Self.deckLinkToDeckCards(link: link) else {
                return
            }
            
            Self.saveDeckToUD(deckCards: deckCards)
        }
    }
    
    func findAndReturnDeck(extensionContext: NSExtensionContext?,
                           completion: @escaping ([String]?) -> Void) {
        findLink(extensionContext: extensionContext) { link in
            guard let link = link else {
                return
            }
            let deck = Self.deckLinkToDeckCards(link: link)
            
            completion(deck)
        }
    }
    
    func findLink(extensionContext: NSExtensionContext?,
                  completion: @escaping (String?) -> Void) {
        if let extensionContext = extensionContext {
            
            for idx in extensionContext.inputItems.indices {
                
                if let item = extensionContext.inputItems[idx] as? NSExtensionItem {
                    print("Item \(item)", "adsadsadf")
                    for ele in item.attachments! {
                        let itemProvider = ele
                        print("item provider is: ", itemProvider)
                        
                        if itemProvider.hasItemConformingToTypeIdentifier("public.plain-text") {
                            
                            itemProvider.loadItem(forTypeIdentifier: "public.plain-text",
                                                  options: nil) { item, error in
                                
                                guard let txtData = item as? String else {
                                    completion(nil)
                                    return
                                }
                                
                                if txtData.contains("deck=") {
                                    completion(txtData)
                                    return
                                }
                            }
                        }
                        else if itemProvider.hasItemConformingToTypeIdentifier("public.text") {
                            
                            itemProvider.loadItem(forTypeIdentifier: "public.text",
                                                  options: nil) { item, error in
                                
                                guard let txtData = item as? String else {
                                    completion(nil)
                                    return
                                }
                                
                                if txtData.contains("deck=") {
                                    completion(txtData)
                                    return
                                }
                            }
                        }
                        else if itemProvider.hasItemConformingToTypeIdentifier("public.url"){
                            
                            itemProvider.loadItem(forTypeIdentifier: "public.url",
                                                  options: nil) { item, error in
                                
                                guard let txtData = (item as? URL)?.absoluteString else {
                                    completion(nil)
                                    return
                                }
                                
                                if txtData.contains("deck=") {
                                    completion(txtData)
                                    return
                                }
                            }
                        }
                        
                    }
                    
                }
            }
        }
    }
    
    static func deckLinkToDeckCards(link: String) -> [String]? {
        
        guard let keyIds = CardsInfo.getFromUD() else {
            return nil
        }
        
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
            if let keyIdFromTheLink = (keyIds.first { $0.id == cardIdsFromTheLink[idx] }) {
                deckCardsFromTheLink.append(keyIdFromTheLink.key)
            }
            else {
                return nil
            }
        }
        
        return deckCardsFromTheLink
    }
    
    static func saveDeckToUD(deckCards: [String],
                             deckName: String = "",
                             categoryName: String = "Default") {
        var currentUDCardNames = UD.sharedValue(forKey: .extensionDecksCardNames) as? [[String]] ?? []
        var currentUDDeckNames = UD.sharedValue(forKey: .extensionDecksDeckNames) as? [String] ?? []
        var currentUDCategoryNames = UD.sharedValue(forKey: .extensionDecksCategoryNames) as? [String] ?? []
        
        currentUDCardNames.append(deckCards)
        currentUDDeckNames.append(deckName)
        currentUDCategoryNames.append(categoryName)
        
        UD.sharedSet(currentUDCardNames, forKey: .extensionDecksCardNames)
        UD.sharedSet(currentUDDeckNames, forKey: .extensionDecksDeckNames)
        UD.sharedSet(currentUDCategoryNames, forKey: .extensionDecksCategoryNames)
    }
}

private extension String {
    func firstTrailingIndexOfSubString(subString: String) -> Optional<Int> {
        let subStringArray = subString.uppercased().map{$0}
        let subStringLength = subString.count
        let stringArray = self.uppercased().map{$0}
        
        if stringArray.count-subStringLength+1 > 0 {
            for idx in 0..<(stringArray.count - subStringLength + 1) {
                
                var alpha = ""
                
                for indi in subStringArray.indices {
                    alpha.append(stringArray[indi+idx])
                }
                
                if alpha == subString.uppercased() {
                    return (idx + subStringLength - 1)
                }
                
            }
        }
        
        return nil
    }
}
