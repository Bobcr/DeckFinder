import SwiftUI

struct CustomSegmentedPicker: View {
    
    var items: [String]
    @Binding var pickerItemIndex: Int
    var onChangeAction: () -> Void = { }
    var backgroundColor = Color.custom(.gray(id: .c3))
    @State var frame = CGSize.zero
    @State var rectangleWidth = screen.width
    
    var body: some View {
        GeometryReader { geo in
            VStack(spacing: 0) {
                ZStack {
                    
                    RoundedRectangle(cornerRadius: .custom(8))
                        .foregroundColor(.custom(.gray(id: .c5)))
                        .frame(width: rectangleWidth)
                        .customPadding(.vertical, 2.5)
                        .offset(x: rectangleOffset(pickerIndex: pickerItemIndex))
                    
                    HStack(spacing: 0) {
                        ForEach(items.indices, id: \.self) { idx in
                            Button(action: { itemAction(idx: idx) })
                            {
                                HStack(spacing: 0) {
                                    Spacer(minLength: 0)
                                    
                                    Text(items[idx])
                                        .customFont(size: 20, weight: .medium)
                                        .foregroundColor(.custom(.black()))
                                    
                                    Spacer(minLength: 0)
                                }
                            }
                        }
                    }
                    
                }
            }
            .background(backgroundColor)
            .customCornerRadius(8)
            .onAppear {
                frame = geo.size
                rectangleWidth = (frame.width/CGFloat(items.count)) - 2
            }
        }
        .customFrame(height: 30)
    }
    
    private func rectangleOffset(pickerIndex: Int) -> CGFloat {
        let itemCount = items.count
        let average = (itemCount + 1)/2
        let middleOfIndices = average - 1
        let difference = pickerIndex - middleOfIndices
        
        return CGFloat(difference)*rectangleWidth
    }
    
    private func itemAction(idx: Int) {
        var offsetDifference =
            rectangleOffset(pickerIndex: idx) - rectangleOffset(pickerIndex: pickerItemIndex)
        offsetDifference = offsetDifference.absoluteDistance(to: 0)
        
        let duration = Double(offsetDifference/400)
        
        withAnimation(.customSpring(translation: .init(width: offsetDifference, height: 0),
                                    responseTime: duration,
                                    relativeValue: 25)) {
            
            if pickerItemIndex != idx {
                pickerItemIndex = idx
                onChangeAction()
            }
        }
    }
    
}
