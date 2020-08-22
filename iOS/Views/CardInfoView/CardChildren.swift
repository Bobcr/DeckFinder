import SwiftUI

extension CardInfoView {
    func makeChildren() -> some View {
        VStack(spacing: 0) {
            Text("Sub Troops")
                .customFont(size: 30, weight: .medium)
                .customPadding(t: 2)
                .foregroundColor(.custom(.green()))
            
            ForEach(children.indices, id: \.self) { idx in
                let child = children[idx]
                let variableStats = child.variableStats
                let name = child.name
                let key = child.key
                
                Button(action: {
                    withAnimation {
                        subTroopsStatsState[idx].toggle()
                    }
                })
                {
                    HStack(spacing: 0) {
                        Image(key)
                            .resizable()
                            .scaledToFit()
                            .customFrame(height: 50)
                            .fixedSize()
                        
                        Spacer()
                        
                        Text(name)
                            .customFont(size: 20)
                            .lineLimit(1)
                            .minimumScaleFactor(0.1)
                            .customPadding(.trailing, 6)
                        
                        Image(systemName: "chevron.right.square.fill")
                            .resizable()
                            .scaledToFit()
                            .customFrame(width: 25)
                            .customCornerRadius(4)
                            .foregroundColor(.custom(.blue()))
                            .rotationEffect(.degrees(subTroopsStatsState[idx] ? 90 : 0))
                    }
                    .customPadding(t: 2, l: 6, b: 2, tr: 6)
                }
                .buttonStyle(SimpleButtonStyle())
                
                if subTroopsStatsState[idx] {
                    makeVariableStatsGrid(variableStats: variableStats.convertToKeyValuePairs(),
                                          variableImageNames: variableStats.imageIconNames())
                }
                
            }
        }
        .customFrame(maxWidth: .infinity)
        .customPadding(6)
        .background(Color.custom(.white()))
        .customCornerRadius(8)
        .customPadding(t: 6, l: 10, b: 6, tr: 10)
        .shadow(color: .custom(.blackShadow(), opacity: 0.2), radius: 4, x: 0, y: 0)
    }
}
