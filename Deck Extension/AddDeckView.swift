import SwiftUI

struct AddDeckView: View {
    
    @Binding var deckCards: [String]
    @State var deckName: String = ""
    
    @State var categoryIndex: Int = 0
    @State var categoryNames =
        UD.sharedValue(forKey: .deckWalletCategoryNames) as? [String] ?? ["Default"]
    
    @Environment(\.presentationMode) var presentationMode
    
    var capsule: some View = Capsule()
        .customFrame(width: 32, height: 9)
        .customPadding(t: 12, b: 2)
        .foregroundColor(.custom(.gray()))
    
    var body: some View {
        BGStack {
            VStack(spacing:0 ){
                capsule
                
                Divider()
                    .customPadding(.top, 3)
                
                ScrollView {
                    if deckCards != [] {
                        VStack(spacing: 0) {
                            makeDeck(cards: deckCards)
                            makeDeckFooter()
                        }
                        .background(Color.custom(.white()))
                        .customCornerRadius(12)
                        .customPadding(.horizontal, 8)
                        .customPadding(.top, 6)
                    }
                    else {
                        Text("Failed To Find a Deck From the Link/Text")
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                    }
                }
            }
        }
        .onAppear {
            categoryNames = UD.sharedValue(forKey: .deckWalletCategoryNames) as? [String] ?? ["Default"]
        }
    }
    
    private func makeDeck(cards: [String]) -> some View {
        VStack(spacing: 0) {
            ForEach(0...1, id: \.self) { idx in
                HStack(spacing: 0) {
                    ForEach(0...3, id: \.self) { ind in
                        let card = cards[idx*4+ind]
                        
                        if card != "" {
                            Image(card)
                                .resizable()
                                .scaledToFit()
                        }
                        else {
                            Image("unknown-card")
                                .resizable()
                                .scaledToFit()
                                .opacity(0)
                        }
                    }
                }
            }
        }
        .customCornerRadius(12)
    }
    
    private func makeDeckFooter() -> some View {
        VStack(spacing: 0) {
            
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
                            .fixedSize(.horizontal)
                            .customFont(size: 28)
                            .customPadding(.horizontal, 8)
                            .customFrame(height: 32, alignment: .bottom)
                            .foregroundColor(.custom(.black()))
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
            .customPadding(t: 6, b: 2)
            
            HStack(spacing: 0) {
                TextField.init("optional deck name", text: $deckName)
                    .customPadding(t: 4, l: 6, b: 4, tr: 6)
                    .background(Color.custom(.yellow()))
                    .customCornerRadius(8)
                    .customFont(size: 24, weight: .medium)
            }
            .customPadding(t: 6, l: 6, b: 2, tr: 6)
            
            HStack(spacing: 0) {
                Text(avgElixirCost(deckCards: deckCards))
                    .foregroundColor(.custom(.orange()))
                
                Spacer()
                
                Button(action: {
                    DeckFinder.saveDeckToUD(deckCards: deckCards,
                                            deckName: deckName,
                                            categoryName: categoryNames[categoryIndex])
                    
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Save!")
                        .foregroundColor(.custom(.blue()))
                }
            }
            .customFont(size: 26)
            .customPadding(t: 2, l: 6, b: 2, tr: 6)
        }
    }
    
    private func rightChevronAction() {
        withAnimation {
            categoryIndex.addOrBounce(max: categoryNames.count-1)
        }
    }
    
    private func leftChevronAction() {
        withAnimation {
            categoryIndex.addOrBounce(value: -1, max: categoryNames.count-1)
        }
    }
}

private func avgElixirCost(deckCards: [String]) -> String {
    
    guard let cardsInfo = DeckFinder.CardsInfo.getFromUD() else {
        return "Avg. Cost: 0"
    }
    
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
            if let idx = (cardsInfo.firstIndex { $0.key == deckCards[index] }) {
                deckElixirCost = deckElixirCost + Double(cardsInfo[idx].elixir)
            }
        }
        deckAvgElixirCost = deckElixirCost/deckValidCardsCount
    }
    
    return "Avg. Cost: \(NSString(format: "%.3g", deckAvgElixirCost))"
}
