import SwiftUI

struct CardInfoView: View {
    
    @State var subTroopsStatsState = Array.init(repeating: false, count: 10)
    
    let card: DataSet.Cards
    
    var constantStats: [StringStringPair] {
        card.constantStats.convertToKeyValuePairs()
    }
    var constantsImageNames: [String] {
        card.constantStats.imageIconNames()
    }
    var variableStats: [StringArrayOfStringPair] {
        card.variableStats.convertToKeyValuePairs()
    }
    var history: [String] {
        card.balanceChangesHistory
    }
    var subTroops: [DataSet.Cards] {
        card.subTroops
    }
    var children: [DataSet.Cards.Children] {
        card.children
    }
    
    var body: some View {
        BGStack {
            ScrollView {
                VStack(spacing: 0) {
                    Image(card.info.key)
                        .resizable()
                        .scaledToFit()
                        .customFrame(width: 200)
                        .customPadding(t: 12)
                    
                    Text(card.info.name)
                        .customFont(size: 30)
                        .customPadding(t: -4, b: 12)
                    
                    if card.info.description != "" {
                        makeDescription()
                    }
                    
                    if subTroops.count != 0 {
                        makeSubTroops()
                    }
                    
                    if children.count != 0 {
                        makeChildren()
                    }
                    
                    if constantStats.count != 0 {
                        makeConstantStats()
                    }
                    
                    if variableStats.count > 1 {
                        makeVariableStatsForSelf()
                    }
                    
                    if history.count != 0 {
                        makeBalanceHistory()
                    }
                }
            }
        }
        .navigationTitle(card.info.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CardsView_Previews: PreviewProvider {
    static var previews: some View {
        CardInfoView(card: .elixirGolem)
    }
}
