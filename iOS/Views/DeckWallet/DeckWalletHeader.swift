import UIKit
import SwiftUI
import CoreData

struct DeckWalletHeader: View {
    
    @EnvironmentObject var appearance: EnvObjs.Appearance
    @Environment(\.managedObjectContext) var moc
    
    @Binding var categories: [DeckWalletCategory]
    @Binding var categoryIndex: Int
    @Binding var categoryNames: [String]
    
    var body: some View {
        VStack(spacing: 0) {
            makeCategories()
            makeDeckHeaderBar()
        }
        .onAppear {
            categoryNames = getUDCategoryNames(currentCategoryNames: categories.map{$0.name})
        }
    }
    
    func makeCategories() -> some View {
        HStack(spacing: 0) {
            Button(action: leftChevronAction) {
                Image(systemName: "chevron.left")
                    .resizable()
                    .scaledToFit()
                    .customFrame(height: 38)
                    .customPadding(.horizontal, 8)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .disabled(categoryNames.count < 2)
            
            ZStack {
                ForEach(categoryNames.indices, id: \.self) { idx in
                    Text(categoryNames[idx] == "" ? "<empty>" : categoryNames[idx])
                        .fixedSize(horizontal: true, vertical: false)
                        .customFont(size: 28)
                        .customPadding(.horizontal, 8)
                        .customFrame(height: 38, alignment: .bottom)
                        .foregroundColor(.custom(.black()))
                        .menu(menuItems: { categoryContextMenu(idx: categoryIndex) })
                        .offset(x: CGFloat(categoryIndex.distance(to: idx))*screen.width)
                }
            }
            
            Button(action: rightChevronAction) {
                Image(systemName: "chevron.right")
                    .resizable()
                    .scaledToFit()
                    .customFrame(height: 38)
                    .customPadding(.horizontal, 8)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .disabled(categoryNames.count < 2)
        }
    }
    
    @ViewBuilder
    private func makeDeckHeaderBar() -> some View {
        
        let categoryCount = CGFloat(categoryNames.count)
        let rectangleWidth: CGFloat = {
            if categoryCount != 0 {
                return (screen.width - (categoryCount * 4)) / categoryCount
            }
            else { return 0 }
        }()
        
        var padding: CGFloat = 0
        var cornerRadius: CGFloat = 0
        // a little bit mathematic to make sure the bar always looks nice.
        let _ = {
            if (screen.width / CGFloat.custom(20)) < categoryCount {
                padding = 0
                cornerRadius = 0
            }
            else if (screen.width / CGFloat.custom(43)) < categoryCount {
                padding = .custom(1)
                cornerRadius = .custom(2)
            }
            else {
                padding = .custom(2)
                cornerRadius = .custom(4)
            }
        }()
        
        ZStack(alignment: .leading) {
            HStack(spacing: 0) {
                ForEach(categoryNames.indices, id: \.self) { idx in
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .frame(width: rectangleWidth, height: .custom(8))
                        .foregroundColor(.custom(.gray(id: .c2)))
                        .padding(l: idx == 0 ? 0 : padding,
                                 b: padding,
                                 tr: idx == categoryNames.count-1 ? 0 : padding)
                }
            }
            
            let indexFloat = CGFloat(categoryIndex)
            let paddingOffsets = (padding*2*indexFloat)
            let rectangleOffset = paddingOffsets + (rectangleWidth*indexFloat)
            
            RoundedRectangle(cornerRadius: cornerRadius)
                .frame(width: rectangleWidth, height: .custom(8))
                .foregroundColor(.custom(.blue()))
                .padding(b: padding)
                .offset(x: rectangleOffset)
        }
        .customPadding(t: 3, b: -2)
    }
    
    private func rightChevronAction() {
        withAnimation {
            categoryIndex.addOrBounce(max: categoryNames.count-1)
            UD.standardSet(categoryIndex, forKey: .deckWalletCategoryIndex)
        }
    }
    
    private func leftChevronAction() {
        withAnimation {
            categoryIndex.addOrBounce(value: -1, max: categoryNames.count-1)
            UD.standardSet(categoryIndex, forKey: .deckWalletCategoryIndex)
        }
    }
    
    private func categoryContextMenu(idx: Int) -> some View {
        VStack(spacing: 0) {
            if idx != 0 {
                Button("Rename category", imageSystemName: "square.and.pencil") {
                    
                    let title = "Rename Category"
                    let message = "Enter a new name for category: \(categoryNames[idx])"
                    let placeholder = "New Name"
                    let buttonTitle = "Rename!"
                    let buttonAction: (UIAlertController) -> Void = { alertController in
                        
                        guard var newCatName = alertController.textFields?[0].text else {
                            appearance.alert = .init(title: "Fail",
                                                     message: "Could not find a valid input")
                            return
                        }
                        newCatName = newCatName.leadingAndTrailingSpacesRemover()
                        
                        guard newCatName != "" else {
                            appearance.alert = .init(title: "Fail",
                                                     message: "Please choose another name.")
                            return
                        }
                        
                        guard !categoryNames.contains(newCatName) else {
                            appearance.alert = .init(title: "Fail",
                                                     message: "A Category with name: `\(newCatName)` already exists.")
                            return
                        }
                        
                        let textSize = UIGraphics.textSizeOfString(string: newCatName, font: .custom(size: 28))
                        guard textSize.width < screen.width*3/5 else {
                            appearance.alert = .init(title: "Fail",
                                                     message: """
                                                                Category name is too long!
                                                                your input's width: \(Int(textSize.width))
                                                                max acceptable width: \(Int(screen.width*3/5))
                                                                """)
                            return
                        }
                        
                        renameCategory(oldCategoryName: categoryNames[idx],
                                       newCategoryName: newCatName,
                                       category: categories[idx],
                                       appearance: $appearance,
                                       moc: moc)
                        
                        categoryIndex.addOrBounce(value: 0, max: categoryNames.count-1)
                    }
                    
                    Present.alertWithTextField(title: title,
                                               message: message,
                                               placeholder: placeholder,
                                               buttonTitle: buttonTitle,
                                               buttonAction: buttonAction)
                }
                
                Button("Delete decks+category", imageSystemName: "trash") {
                    appearance.alert = .init(title: "Confirm?",
                                             message: nil,
                                             primaryButton: .cancel(),
                                             secondaryButton: .destructive(Text("Yes!")) {
                                                deleteDecksOfCategory(categoryName: categoryNames[idx],
                                                                      appearance: $appearance,
                                                                      moc: moc)
                                                categoryIndex.addOrBounce(value: 0, max: categoryNames.count-1)
                                                UD.standardSet(categoryIndex, forKey: .deckWalletCategoryIndex)
                                             })
                }
                
                Button("Only delete category", imageSystemName: "trash") {
                    appearance.alert = .init(title: "Confirm?",
                                             message: "Decks will be transferred to the `Default` category",
                                             primaryButton: .cancel(),
                                             secondaryButton: .destructive(Text("Yes!")) {
                                                renameCategory(oldCategoryName: categoryNames[idx],
                                                               newCategoryName: "Default",
                                                               category: categories[idx],
                                                               appearance: $appearance,
                                                               moc: moc)
                                                
                                                withAnimation {
                                                    categories = .getMOCCategories(moc: moc, appearance: $appearance)
                                                    categoryNames = getUDCategoryNames(currentCategoryNames: categories.map{$0.name})
                                                    categoryIndex.addOrBounce(value: 0, max: categoryNames.count-1)
                                                    UD.standardSet(categoryIndex, forKey: .deckWalletCategoryIndex)
                                                }
                                             })
                }
            }
            
            Button("Only delete decks", imageSystemName: "trash") {
                appearance.alert = .init(title: "Confirm?",
                                         message: nil,
                                         primaryButton: .cancel(),
                                         secondaryButton: .destructive(Text("Yes!")) {
                                            deleteDecksOfCategory(categoryName: categoryNames[idx],
                                                                  appearance: $appearance,
                                                                  moc: moc,
                                                                  deleteCategory: false)
                                         })
            }
        }
    }
    
}

private func getUDCategoryNames(currentCategoryNames: [String]) -> [String] {
    (UD.sharedValue(forKey: .deckWalletCategoryNames) as? [String] ?? ["Default"])
        .sorted {
            (currentCategoryNames.firstIndex(of: $0) ?? 1000) <
                (currentCategoryNames.firstIndex(of: $1) ?? 1000) }
}

private func deleteDecksOfCategory(categoryName: String,
                                   appearance: AppearanceEnvObj,
                                   moc: NSManagedObjectContext,
                                   deleteCategory: Bool = true) {
    
    var deckWallet = [DeckWallet?]()
    let deckWalletRequest: NSFetchRequest<DeckWallet> = DeckWallet.fetchRequest()
    deckWalletRequest.predicate = NSPredicate(format: "deckCategory == %@", categoryName)
    
    do {
        deckWallet = try moc.fetch(deckWalletRequest)
    }
    catch let error as NSError {
        appearance.alert.set(to: .init(title: "Could not find the deck in the phone's storage",
                                       message: "Error description: \(error.localizedDescription)"))
    }
    
    for deck in deckWallet {
        if let deck = deck {
            moc.delete(deck)
        }
    }
    moc.handeledSave(appearance: appearance)
    
    if deleteCategory {
        let newDeckWalletRequest1: NSFetchRequest<DeckWallet> = DeckWallet.fetchRequest()
        newDeckWalletRequest1.predicate = NSPredicate(format: "deckCategory == %@", categoryName)
        
        let oldDecksCount = ((try? moc.fetch(newDeckWalletRequest1)) ?? []).count
        
        if oldDecksCount == 0 {
            let oldCategoryNames = UD.sharedValue(forKey: .deckWalletCategoryNames) as? [String] ?? ["Default"]
            var newCategoryNames = oldCategoryNames
            newCategoryNames = newCategoryNames.filter { String($0) != categoryName }
            
            UD.sharedSet(newCategoryNames, forKey: .deckWalletCategoryNames)
        }
    }
}

/// removes decks in a category from CoreData, and re-adds them to CoreData with a new name.
// updates categoryNames in UserDefaults. for that, checks if the last category name is still used,
// and the new name should be added, because CoreData could have had
// some errors while renaming was happening
private func renameCategory(oldCategoryName: String,
                            newCategoryName: String,
                            category: DeckWalletCategory,
                            appearance: AppearanceEnvObj,
                            moc: NSManagedObjectContext) {
    
    var deckWallet = [DeckWallet?]()
    let deckWalletRequest: NSFetchRequest<DeckWallet> = DeckWallet.fetchRequest()
    deckWalletRequest.predicate = NSPredicate(format: "deckCategory == %@", oldCategoryName)
    
    do {
        deckWallet = try moc.fetch(deckWalletRequest)
    }
    catch let error as NSError {
        appearance.alert.set(to: .init(title: "Could not find the deck in the phone's storage",
                                       message: "Error description: \(error.localizedDescription)"))
    }
    
    var deletedDecks = [DeckWallet]()
    
    for deck in deckWallet {
        if let deck = deck {
            moc.delete(deck)
            deletedDecks.append(deck)
        }
    }
    
    deletedDecks = Array(deletedDecks.reversed())
    
    for deck in deletedDecks {
        let newDeck = DeckWallet(context: moc)
        newDeck.cardNames = deck.cardNames
        newDeck.deckTitle = deck.deckTitle
        newDeck.deckCategory = newCategoryName
    }
    
    moc.handeledSave(appearance: appearance)
    
    let newDeckWalletRequest1: NSFetchRequest<DeckWallet> = DeckWallet.fetchRequest()
    newDeckWalletRequest1.predicate = NSPredicate(format: "deckCategory == %@", oldCategoryName)
    
    let newDeckWalletRequest2: NSFetchRequest<DeckWallet> = DeckWallet.fetchRequest()
    newDeckWalletRequest2.predicate = NSPredicate(format: "deckCategory == %@", newCategoryName)
    
    let oldDecksCount = ((try? moc.fetch(newDeckWalletRequest1)) ?? []).count
    let newDecksCount = ((try? moc.fetch(newDeckWalletRequest2)) ?? []).count
    
    let oldCategoryNames = UD.sharedValue(forKey: .deckWalletCategoryNames) as? [String] ?? ["Default"]
    var newCategoryNames = oldCategoryNames
    if oldDecksCount == 0 {
        newCategoryNames = newCategoryNames.filter { String($0) != oldCategoryName }
    }
    if (newDecksCount != 0) || (category.decks.count == 0) {
        newCategoryNames.append(newCategoryName)
    }
    UD.sharedSet(newCategoryNames, forKey: .deckWalletCategoryNames)
}
