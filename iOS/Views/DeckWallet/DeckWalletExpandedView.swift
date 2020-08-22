import SwiftUI

struct DeckWalletExpandedView: View {
    
    @EnvironmentObject var appearance: EnvObjs.Appearance
    @Environment(\.openURL) var openURL
    @Environment(\.managedObjectContext) var moc
    
    @Binding var deckCategories: [DeckWalletCategory]
    var category: DeckWalletCategory
    var categoryIndex: Int
    var columns: Int
    var columnsFloat: CGFloat {
        let float = CGFloat(columns)
        return pow(float, 3/4)
    }
    
    @Binding var updateDeckMenuIsVisible: Bool
    @Binding var updateDeckMenuDeckCards: [String]
    
    var body: some View {
        ZStack {
            CustomGrid(allItemsCount: category.decks.count,
                       columns: columns) { idx in
                
                VStack(spacing: 0) {
                    let cards = category.decks[idx].cards
                    
                    makeDeckHeader(idx: idx)
                    makeDeck(cards: cards)
                }
                .id(category.decks[idx].cards.joined())
                .background(Color.custom(.gray(id: .c6)))
                .customCornerRadius(12/columnsFloat)
                .customPadding(t: 5/columnsFloat, l: 5/columnsFloat, b: 5/columnsFloat, tr: 5/columnsFloat)
                .contextMenu(menuItems: { deckContextMenu(idx: idx) })
                
            }
            .customPadding(t: -8/columnsFloat, l: 2, b: 0, tr: 2)
            
        }
    }
    
    func makeDeck(cards: [String]) -> some View {
        return VStack(spacing: 0) {
            ForEach(0...1, id: \.self) { idx in
                HStack(spacing: 0) {
                    ForEach(0...3, id: \.self) { ind in
                        Image(cards[idx*4+ind])
                            .resizable()
                            .scaledToFit()
                    }
                }
            }
        }
        .customPadding(.vertical, -2/columnsFloat)
        .customCornerRadius(12/columnsFloat)
    }
    
    func makeDeckHeader(idx: Int) -> some View {
        let deck = category.decks[idx]
        let showDeckName = rowHasDeckWithDeckName(
            categoryDecks: category.decks,
            columns: columns,
            idx: idx)
        let deckCount = category.decks.count
        
        return VStack(spacing: 0) {
            
            if showDeckName {
                Text(deck.name == "" ? " " : deck.name)
                    .customFont(size: 24/columnsFloat)
                    .customPadding(.horizontal, 6/columnsFloat)
                    .lineLimit(1)
                    .foregroundColor(.custom(.black()))
            }
            
            HStack(spacing: 0) {
                Text(deck.avgElixirCost)
                    .customFont(size: 24/columnsFloat, weight: .semibold)
                    .customPadding(.leading, 6/columnsFloat)
                
                Spacer()
                
                Text("#\(deckCount-(idx))")
                    .customFont(size: 24/columnsFloat, weight: .semibold)
                    .customPadding(.trailing, 6/columnsFloat)
            }
            .foregroundColor(.custom(.orange()))
        }
        .customPadding(.top, 3/columnsFloat)
    }
    
    func deckContextMenu(idx: Int) -> some View {
        
        let deckCards = category.decks[idx].cards
        let safariDeckLink = Funcs.Deck
            .makeDeckLink(deckCards: deckCards,
                          appearance: $appearance)
        
        return VStack(spacing: 0) {
            
            if let link = safariDeckLink,
               let linkURL = URL(string: link) {
                
                Button("Copy deck in game", imageSystemName: "square.and.arrow.up") {
                    openURL.callAsFunction(linkURL)
                }
                
                Button("Share deck link", imageSystemName: "square.and.arrow.up") {
                    appearance.shareSheetItems = [.init(name: "Deck link", url: linkURL)]
                    appearance.shareSheetPresentation = true
                }
            }
            
            Button("Update deck", imageSystemName: "arrow.triangle.2.circlepath") {
                withAnimation {
                    updateDeckMenuDeckCards = deckCards
                    updateDeckMenuIsVisible = true
                }
            }
            
            Button("Delete deck", imageSystemName: "trash") {
                let cardNamesJoined = deckCards.map{DataSet.Cards.find(by: .key, value: $0).info.name}
                    .joined(separator: ", ")
                appearance.alert = .init(title: "Delete Deck?",
                                         message: cardNamesJoined,
                                         primaryButton: .cancel(),
                                         secondaryButton: .destructive(Text("Delete")) {
                                            withAnimation {
                                                Funcs.Deck.findAndDeleteFromCoreData(deckCards: deckCards,
                                                                                     appearance: $appearance,
                                                                                     moc: moc)
                                                deckCategories = .getMOCCategories(moc: moc,
                                                                              appearance: $appearance)
                                            }
                                         })
            }
            
        }
    }
    
}

//struct DeckWalletExpandedView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            DeckWalletBaseView(deckWalletMode: .expanded(columns: 2))
//                .previewDevice("iPhone 7 Plus")
//        }
//    }
//}

/// if true, a row has one or more decks that have an non-empty deck name,
/// therefore, the space for the deck name should be preserved for all of the row's members
/// so it doesnt look awful
private func rowHasDeckWithDeckName(categoryDecks: [DeckWalletCategory.Deck], columns: Int, idx: Int) -> Bool {
    
    let deckCount = categoryDecks.count
    let indexOfFirstItemInTheCurrentRow = idx - (idx % columns)
    var indicesToBeChecked = [Int]()
    
    for index in 0...columns-1 {
        let indexToBeChecked = indexOfFirstItemInTheCurrentRow + index
        
        if deckCount > indexToBeChecked {
            indicesToBeChecked.append(indexToBeChecked)
        }
    }
    
    for index in indicesToBeChecked {
        if categoryDecks[index].name != "" {
            return true
        }
    }
    
    return false
}

