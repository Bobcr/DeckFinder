import Foundation
import CoreData
import SwiftUI

extension NSManagedObjectContext {
    /// saves to ManagedObjectContext, while kinda handling erros
    func handeledSave(appearance: AppearanceEnvObj) {
        if self.hasChanges {
            do {
                try self.save()
            }
            catch let error as NSError {
                if !appearance.alert.wrappedValue.presentation {
                    appearance.alert
                        .set(to: .init(title: "Failed while saving changes to your phone's storage",
                                       message: "error description: \"\(error.localizedDescription)\""))
                }
            }
        }
    }
}

extension NSManagedObjectContext {
    func deleteAndSave(_ object: NSManagedObject, appearance: AppearanceEnvObj) {
        self.delete(object)
        self.handeledSave(appearance: appearance)
    }
}

extension NSManagedObject {
    func save(appearance: AppearanceEnvObj) {
        if let context = self.managedObjectContext {
            context.handeledSave(appearance: appearance)
        }
        else {
            appearance.alert.set(to: .init(title: "Fail",
                                           message: "Could not save new data to your phone's storage"))
        }
    }
}

extension DeckWallet {
    static func getAll(moc: NSManagedObjectContext, appearance: AppearanceEnvObj? = nil) -> [DeckWallet] {
        
        var container = [DeckWallet?]()
        
        let request: NSFetchRequest<DeckWallet> = DeckWallet.fetchRequest()
        
        do {
            container = try moc.fetch(request)
        } catch let error as NSError {
            if let appearance = appearance {
                appearance.alert.set(to: .init(title: "Failed to fetch decks from phone's storage",
                                               message: "error description: \(error.localizedDescription)"))
            }
        }
        
        container.removeAll { $0 == nil }
        
        return container.map { $0! }
    }
}

private func getUDDeckWalletCategoryNames() -> [String] {
    
        let udValue = UD.sharedValue(forKey: .deckWalletCategoryNames)
        var categoryNames = udValue as? [String] ?? ["Default"]
        if let _ = categoryNames.firstIndex(of: "Default") {} else {
            categoryNames = categoryNames.addAtIndex(value: "Default", index: 0)
        }
    
    return categoryNames
}

extension Array where Element == DeckWallet {
    func convertToCategorizedDecks() -> [DeckWalletCategory] {
        
        var returni = [DeckWalletCategory]()
        let fetchedDecks = Array(self.reversed())
        
        let categoryNames = getUDDeckWalletCategoryNames()
        for catName in categoryNames {
            returni.append(.init(name: catName,
                                 decks: []))
        }
        
        if !(returni.contains { $0.name == "Default" }) {
            returni = returni.addAtIndex(value: .init(name: "Default",
                                                      decks: []), index: 0)
        }
        
        for deck in fetchedDecks {
            if let deckCards = deck.cardNames {
                
                let categoryIndex: Int
                let deckName = deck.deckTitle ?? ""
                var deckCategory: String {
                    if let category = deck.deckCategory,
                       category.spaceRemover() != "" {
                        
                        return category
                    }
                    else { return "Default" }
                }
                
                if let firstIndex = (returni.firstIndex { $0.name == deckCategory }) {
                    categoryIndex = firstIndex
                }
                else {
                    returni.append(.init(name: deckCategory,
                                         decks: []))
                    
                    categoryIndex = returni.count - 1
                }
                
                let newDeck = DeckWalletCategory.Deck
                    .init(name: deckName,
                          avgElixirCost: Funcs.Deck.avgElixirCost(deckCards: deckCards),
                          cards: deckCards)
                
                returni[categoryIndex].decks.append(newDeck)
            }
        }
        
        if (returni.filter { $0.name == "Default" }.count) > 1 {
            if var udValues = UD.sharedValue(forKey: .deckWalletCategoryNames) as? [String] {
                
                let reversedUDValues: [String] = udValues.reversed()
                
                if let reverseFirstIndex = (reversedUDValues.firstIndex { $0 == "Default" }) {
                    let index = udValues.count-reverseFirstIndex-1
                    udValues.remove(at: index)
                    UD.sharedSet(udValues, forKey: .deckWalletCategoryNames)
                    
                }
            }
            returni = returni.filter { !($0.name == "Default" && $0.decks.isEmpty) }
        }
        
        return returni
    }
}
