import SwiftUI

extension PlayerBaseView.StatsView {
    func makeChests() -> some View {
        VStack(spacing: 0) {
            if datas.playerChests.items.count > 0 {
                
                Text("Chests")
                    .foregroundColor(.custom(.green()))
                    .customFont(size: 28, weight: .medium)
                    .customPadding(t: 3, b: 3)
                
                HStack(spacing: 0) {
                    Spacer(minLength: 0)
                    
                    makeNormalChests()
                        .customPadding(t: 5, l: 3, b: 5, tr: 3, id: .s2)
                    
                    Spacer(minLength: 0)
                }
                
                makeValuableChests()
                    .customPadding(t: 5, l: 3, b: 5, tr: 3, id: .s2)
            }
        }
        .customPadding(t: 4, l: 3, b: 4, tr: 3)
        .background(Color.custom(.white()))
        .customCornerRadius(8)
        .customPadding(t: 5, l: 8, b: 5, tr: 8)
        .shadow(color: .custom(.blackShadow(), opacity: 0.2), radius: 2)
    }
    
    @ViewBuilder
    private func makeNormalChests() -> some View {
        let chests = datas.playerChests
        
        HStack(alignment: .bottom, spacing: 0){
            ForEach(0...8, id: \.self) { idx in
                VStack(spacing: 0) {
                    chests.items[idx].name
                        .chestNameToChestImage()
                        .resizable()
                        .scaledToFit()
                        .customFrame(width: 41, id: .s2)
                        .customPadding(.bottom, 2, id: .s2)
                    
                    Text("\(idx+1)")
                        .fixedSize(.horizontal)
                        .customFont(size: 15.5, weight: .bold, id: .s2)
                        .foregroundColor(.white)
                        .background(Circle()
                                        .foregroundColor(.orange)
                                        .customFrame(width: 19, height: 19, id: .s2))
                }
            }
        }
    }
    
    @ViewBuilder
    private func makeValuableChests() -> some View {
        let chests = datas.playerChests
        
        HStack(alignment: .bottom, spacing: 0) {
            ForEach(0...(chests.items.count - 10), id: \.self) { idx in
                VStack(spacing: 0) {
                    chests.items[idx+9].name
                        .chestNameToChestImage()
                        .resizable()
                        .scaledToFit()
                        .customFrame(width: 69, id: .s2)
                        .customPadding(.bottom, 3, id: .s2)
                    
                    Text("\(chests.items[idx+9].index+1)")
                        .fixedSize(.horizontal)
                        .customFont(size: 16.5, weight: .bold, id: .s2)
                        .foregroundColor(.white)
                        .customPadding(.horizontal, 4, id: .s2)
                        .background(Capsule()
                                        .foregroundColor(.orange)
                                        .customFrame(height: 22, id: .s2))
                }
            }
        }
    }
}

private extension String {
    func chestNameToChestImage() -> Image {
        switch self {
        case "Silver Chest": return Image("chest-silver")
        case "Golden Chest": return Image("chest-gold")
        case "Magical Chest": return Image("chest-magical")
        case "Epic Chest": return Image("chest-epic")
        case "Giant Chest": return Image("chest-giant")
        case "Mega Lightning Chest": return Image("chest-megalightning")
        case "Legendary Chest": return Image("chest-legendary")
        default: return Image("chest-wooden")
        }
    }
}
