import SwiftUI

extension PlayerBaseView.StatsView {
    @ViewBuilder
    func makeStatsList(title: String,
                       pairs: [StringArrayOfStringPair],
                       dividerIndices: [Int] = [],
                       keysColorizedIndices: [(index: Int, color: Color)] = [],
                       keysFontWeightIndices: [(index: Int, weight: Font.Weight)] = [],
                       imageIndices: [(index: Int, image: Image)] = []) -> some View {
        
        VStack(spacing: 0) {
            Text(title)
                .foregroundColor(.custom(.green()))
                .customFont(size: 28, weight: .medium)
                .customPadding(t: 3, b: 5)
            
            ForEach(pairs.indices, id: \.self) { idx in
                
                let pair = pairs[idx]
                let colorOfKey = keysColorizedIndices.first{$0.index == idx}?.color ?? .custom(.black())
                let fontWeightOfKey = keysFontWeightIndices.first{$0.index == idx}?.weight ?? .medium
                let image = imageIndices.first{$0.index == idx}?.image
                let hasDivider = dividerIndices.contains(idx)
                
                HStack(spacing: 0) {
                    Text(pair.key)
                        .customFont(size: 22, weight: fontWeightOfKey)
                        .foregroundColor(colorOfKey)
                    
                    Spacer(minLength: 0)
                    
                    let hasSecondText = pair.values.count > 1
                    
                    Text(pair.values[0])
                        .customFont(size: 21, weight: .medium)
                        .foregroundColor(.custom(.black()))
                        .customPadding(.leading, 3)
                    
                    if hasSecondText {
                        Text("/")
                            .customFont(size: 21, weight: .medium)
                            .foregroundColor(.custom(.black()))
                            .customPadding(.horizontal, 3)
                        
                        Text(pair.values[1])
                            .customFont(size: 21, weight: .medium)
                            .foregroundColor(.custom(.red()))
                            .customPadding(.trailing, 3)
                    }
                    
                    if let image = image {
                        image
                            .resizable()
                            .scaledToFit()
                            .customFrame(height: 22)
                            .customPadding(.horizontal, 3)
                    }
                }
                .customPadding(t: 3, l: 3, b: 3, tr: 3)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
                
                if hasDivider {
                    Divider()
                        .customPadding(.horizontal, -4)
                }
            }
        }
    }
}
