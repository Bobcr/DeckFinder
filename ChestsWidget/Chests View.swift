import SwiftUI


struct ChestsView: View {
    
    let entry: ChestsEntry
    var playerTag: String? {
        let tag = entry.playerTag?.asTag()
        
        if let tag = tag {
            return "#".appending(tag)
        }
        return nil
    }
    var titleFontSize: CGFloat {
        switch true {
        case playerTag != nil && entry.chests.items.count > 11:
            return 18
        default:
            return 12
        }
    }
    var chests: PlayerChests {
        switch true {
        case playerTag != nil:
            return entry.chests
        default:
            return testChestsEntry.chests
        }
    }
    var titleText: String {
        switch true {
        case entry.widgetName != nil:
            return entry.widgetName!
        case playerTag != nil && entry.chests.items.count > 11:
            return "Player Tag \(playerTag!)"
        default:
            return "This is a placeholder.\nEdit the widget and enter a valid player tag."
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            Text(titleText)
                .foregroundColor(.custom(.green()))
                .font(.system(size: titleFontSize, weight: .medium, design: .rounded))
                .multilineTextAlignment(.center)
                .padding(t: 2)
            
            HStack(spacing: 0) {
                Spacer(minLength: 0)
                
                makeNormalChests(chests: chests)
                    .padding(t: 2, l: 3, b: 2, tr: 3)
                
                Spacer(minLength: 0)
            }
            
            makeValuableChests(chests: chests)
                .padding(l: 3, b: 2, tr: 3)
        }
    }
    
    @ViewBuilder
    private func makeNormalChests(chests: PlayerChests) -> some View {
        
        HStack(alignment: .bottom, spacing: 0){
            ForEach(0...8, id: \.self) { idx in
                VStack(spacing: 0) {
                    chests.items[idx].name
                        .chestNameToChestImage()
                        .resizable()
                        .scaledToFit()
                        .frame(width: 33)
                        .padding(l: 1, b: 1.5, tr: 1)
                    
                    Text("\(idx+1)")
                        .fixedSize(horizontal: true, vertical: false)
                        .font(.system(size: 13, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .background(Circle()
                                        .foregroundColor(.orange)
                                        .frame(width: 15, height: 15))
                }
            }
        }
    }
    
    @ViewBuilder
    private func makeValuableChests(chests: PlayerChests) -> some View {
        
        HStack(alignment: .bottom, spacing: 0) {
            ForEach(0...(chests.items.count - 10), id: \.self) { idx in
                VStack(spacing: 0) {
                    chests.items[idx+9].name
                        .chestNameToChestImage()
                        .resizable()
                        .scaledToFit()
                        .frame(width: 48)
                        .padding(l: 2, b: 1.5, tr: 2)
                    
                    Text("\(chests.items[idx+9].index+1)")
                        .fixedSize(horizontal: true, vertical: false)
                        .font(.system(size: 13, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.horizontal, 2)
                        .background(Capsule()
                                        .foregroundColor(.orange)
                                        .frame(height: 15))
                }
            }
        }
    }
}

extension String {
    func asTag() -> String {
        self.uppercased()
            .replacingOccurrences(of: "#", with: "")
            .replacingOccurrences(of: " ", with: "")
    }
}
