import SwiftUI
import CoreData

extension DeckWalletBaseView.CreateDeckView {
    struct ActionMenuView: View {
        
        @Binding var selfIsVisible: Bool
        @Binding var deckCards: [String]
        var activationDatePath: ReferenceWritableKeyPath<EnvObjs.ZIndex, Date?>? = nil
        
        @State private var textFieldDeckName = ""
        @State private var categoryNames = getUDDeckWalletCategoryNames()
        @State private var deckIsAlreadyInDeckWallet = false
        @State private var fetchedDecks = [DeckWallet]()
        @State private var categoryIndex = UD.standardValue(forKey: .deckWalletCreateDeckCategoryIndex) as? Int ?? 0
        
        @Environment(\.managedObjectContext) var moc
        @EnvironmentObject var appearance: EnvObjs.Appearance
        
        var body: some View {
            OverlayMenuStack(isPresented: $selfIsVisible,
                             activationDatePath: activationDatePath) {
                OverlayMenuItem.textField(textFieldInput: $textFieldDeckName,
                                          placeholder: "Optional Deck Name")
                    .autocapitalization(.words)
                OverlayMenuItem.picker(items: categoryNames, pickerItemIndex: $categoryIndex) {
                    UD.standardSet(categoryIndex, forKey: .deckWalletCreateDeckCategoryIndex)
                }
                OverlayMenuItem.button(title: "New Category", action: addCategoryAction)
                OverlayMenuItem.button(title: deckIsAlreadyInDeckWallet ? "Update Deck" : "Add Deck",
                                       bgColor: .custom(.green()), action: addToDeckWalletAction)
                OverlayMenuItem.dismissButton(isPresented: $selfIsVisible)
            }
            .onAppear(perform: onAppearAction)
            .onChange(of: deckCards) { _ in
                textFieldDeckName = ""
            }
            .onChange(of: selfIsVisible) { newValue in
                if newValue {
                    doStuffIfDeckAlreadyExists()
                }
                categoryNames = getUDDeckWalletCategoryNames()
                self.hideKeyboard()
            }
            .onReceive(moc.publisher(for: \.hasChanges)) { value in
                if value == true {
                    fetchedDecks = DeckWallet.getAll(moc: moc, appearance: $appearance)
                }
            }
        }
        
        /// adds the new deck to CoreData, deleting any object with the same cards
        private func addToDeckWalletAction() {
            for deck in fetchedDecks {
                if (deck.cardNames ?? []).sorted() == deckCards.sorted() {
                    moc.delete(deck)
                }
            }
            
            let newDeck = DeckWallet(context: moc)
            newDeck.cardNames = deckCards
            newDeck.deckTitle = textFieldDeckName.leadingAndTrailingSpacesRemover()
            newDeck.deckCategory = categoryNames[categoryIndex]
            
            newDeck.save(appearance: $appearance)
            withAnimation {
                selfIsVisible = false
                textFieldDeckName = ""
            }
        }
        
        private func onAppearAction() {
            categoryIndex = UD.standardValue(forKey: .deckWalletCreateDeckCategoryIndex) as? Int ?? 0
            categoryNames = getUDDeckWalletCategoryNames()
            categoryIndex.addOrBounce(value: 0, max: categoryNames.count)
            fetchedDecks = DeckWallet.getAll(moc: moc, appearance: $appearance)
        }
        
        private func addCategoryAction() {
            
            let title = "New Category"
            let message = "Enter a new Category name"
            let placeholder = "Category name"
            let buttonTitle = "Add!"
            let buttonAction: (UIAlertController) -> Void = { alertController in
                
                guard var newCatName = alertController.textFields?[0].text else {
                    appearance.alert = .init(title: "Fail",
                                             message: "Could not find a valid input for category name.")
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
                                             message: "A Category with name: '\(newCatName)' already exists.")
                    return
                }
                
                let uiFont = UIGraphics.font(size: 28)
                let textSize = UIGraphics.textSizeOfString(string: newCatName, font: uiFont)
                guard textSize.width < screen.width*3/5 else {
                    appearance.alert = .init(title: "Fail",
                                             message: """
                                                        Category name is too long!
                                                        your input's width: \(Int(textSize.width))
                                                        max acceptable width: \(Int(screen.width*3/5))
                                                        """)
                    return
                }
                
                var newCatNames = categoryNames
                newCatNames.append(newCatName)
                UD.sharedSet(newCatNames, forKey: .deckWalletCategoryNames)
                withAnimation {
                    categoryNames = newCatNames
                    categoryIndex = categoryNames.count-1
                }
            }
            
            Present.alertWithTextField(title: title,
                                       message: message,
                                       placeholder: placeholder,
                                       buttonTitle: buttonTitle,
                                       buttonAction: buttonAction)
        }
        
        private func doStuffIfDeckAlreadyExists() {
            if let deckWalletDeck = (fetchedDecks.first { $0.cardNames == deckCards }),
               deckCards.count == 8,
               !deckCards.contains("") {
                
                if let indexInCategories = (categoryNames.firstIndex { $0 == deckWalletDeck.deckCategory }) {
                    categoryIndex = indexInCategories
                }
                
                textFieldDeckName = deckWalletDeck.deckTitle ?? ""
                deckIsAlreadyInDeckWallet = true
            }
            else {
                deckIsAlreadyInDeckWallet = false
            }
        }
        
    }
}

private func getUDDeckWalletCategoryNames() -> [String] {
    
    let udValue = UD.sharedValue(forKey: .deckWalletCategoryNames)
    var categoryNames = udValue as? [String] ?? ["Default"]
    if categoryNames.firstIndex(of: "Default") == nil {
        categoryNames = categoryNames.addAtIndex(value: "Default", index: 0)
    }
    
    return categoryNames
}

