import Foundation
import CoreData
import SwiftUI

typealias Deck = Funcs.Deck

extension Funcs {
    class Deck { }
}

extension Deck {
    static func avgElixirCost(deckCards: [String]) -> String {
        
        let allKeys = DataSet.Cards.allValids.map{$0.info.key}
        let allElixirCosts = DataSet.Cards.allValids.map{$0.info.elixir}
        
        var deckElixirCost = 0.0
        var deckValidCardsCount = 0.0
        var deckAvgElixirCost = 0.0
        
        for card in deckCards {
            if card != "" && card != "mirror" {
                deckValidCardsCount = deckValidCardsCount + 1
            }
        }
        
        if deckValidCardsCount != 0 {
            for index in 0...7 {
                if let indi = allKeys.firstIndex(of: deckCards[index]) {
                    deckElixirCost = deckElixirCost + Double(allElixirCosts[indi])
                }
            }
            deckAvgElixirCost = deckElixirCost/deckValidCardsCount
        }
        
        return "Avg. Cost: \(NSString(format: "%.3g", deckAvgElixirCost))"
    }
}

extension Deck {
    static func findAndDeleteFromCoreData(deckCards: [String],
                                         appearance: AppearanceEnvObj,
                                         moc: NSManagedObjectContext) {
        
        var deckWallet = [DeckWallet?]()
        let deckWalletRequest: NSFetchRequest<DeckWallet> = DeckWallet.fetchRequest()
        deckWalletRequest.predicate = NSPredicate(format: "cardNames == %@", deckCards)
        
        do {
            deckWallet = try moc.fetch(deckWalletRequest)
        }
        catch let error as NSError {
            appearance.alert.set(to: .init(title: "Could not find the deck in the phone's storage",
                                           message: "Error description: \(error.localizedDescription)"))
        }
        
        guard let firstDeck = deckWallet.first,
              let unwrappedDeck = firstDeck else {
            appearance.alert.set(to: .init(title: "Fail",
                                           message: "Some errors happend and Royale Alchemist could not find the deck in the phone's storage to delete it from there."))
            return
        }
        
        moc.deleteAndSave(unwrappedDeck, appearance: appearance)
    }
}

extension Deck {
    enum DeckLinkMode {
        case safari, clashRoyale
    }
    
    static func makeDeckLink(deckCards: [String],
                             appearance: AppearanceEnvObj,
                             `for` mode: DeckLinkMode = .safari) -> String? {
        
        let safariDeckLinkLeadingPart = "https://link.clashroyale.com/deck/en?deck="
        let clshRoyaleDeckLinkLeadingPart = "clashroyale://copyDeck?deck="
        
        let cardIds = deckCards
            .map{DataSet.Cards.find(by: .key, value: $0)}
            .map{$0.info.id}
        
        guard !cardIds.contains(25000000) else {
            appearance.alert.set(to: .init(title: "Fail",
                                           message: "Failed to generate a deck link for the chosen deck."))
            return nil
        }
        
        var deckLinkTrailingPart = ""
        
        for (idx, id) in cardIds.enumerated() {
            deckLinkTrailingPart.append("\(id)")
            
            if idx != cardIds.count-1 {
                deckLinkTrailingPart.append(";")
            }
        }
        
        switch mode {
        case .safari:
        return safariDeckLinkLeadingPart.appending(deckLinkTrailingPart)
        case .clashRoyale:
            return clshRoyaleDeckLinkLeadingPart.appending(deckLinkTrailingPart)
        }
    }
}

