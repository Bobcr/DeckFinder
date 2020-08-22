import SwiftUI

class OverlayMenuItem { }

extension OverlayMenuItem {
    static func text(title: String,
                     image: Image? = nil,
                     bgColor: Color = .custom(.pink())) -> some View {
        
        HStack(spacing: 0) {
            if let image = image {
                Text(title)
                
                Spacer()
                
                image
                    .resizable()
                    .scaledToFit()
                    .sameHeightAs(text: title, withFont: .custom(size: 25))
                    .padding(.trailing, 3)
            }
            else {
                Spacer()
                Text(title)
                Spacer()
            }
        }
        .customPadding(t: 4, l: 4, b: 4, tr: 4)
        .foregroundColor(.custom(.white()))
        .background(bgColor)
        .customCornerRadius(8)
        .customFont(size: 25, weight: .semibold) // if this changed, change the uiFont above too
        .customPadding(t: 3, l: 6, b: 3, tr: 6)
    }
}

extension OverlayMenuItem {
    static func button(title: String,
                       image: Image? = nil,
                       bgColor: Color = .custom(.orange()),
                       action: @escaping () -> (Void)) -> some View {
        
        Button(action: action) {
            HStack(spacing: 0) {
                if let image = image {
                    
                    Text(title)
                    
                    Spacer()
                    
                    image
                        .resizable()
                        .scaledToFit()
                        .sameHeightAs(text: title, withFont: .custom(size: 25))
                        .padding(.trailing, 3)
                }
                else {
                    Spacer()
                    Text(title)
                    Spacer()
                }
            }
        }
        .multilineTextAlignment(.center)
        .customPadding(t: 4, l: 4, b: 4, tr: 4)
        .foregroundColor(.custom(.white()))
        .background(bgColor)
        .customCornerRadius(8)
        .customFont(size: 25, weight: .semibold) // if this changed, change the uiFont above too
        .customPadding(t: 3, l: 6, b: 3, tr: 6)
    }
}

extension OverlayMenuItem {
    /// a dismiss button to fill the background space when OverlayMenuStack is visible
    @ViewBuilder
    static func coverButton(isPresented: Bool, action: @escaping () -> Void) -> some View {
        if isPresented {
                Button(action: action) {
                    Color.black.opacity(0.2)
                }
                .buttonStyle(SimpleButtonStyle())
        }
        else {
            EmptyView()
        }
    }
}

extension OverlayMenuItem {
    static func dismissButton(isPresented: Binding<Bool>) -> some View {
        self.button(title: "Dismiss",
                    bgColor: .custom(.red())) {
            withAnimation { isPresented.set(to: false) }
        }
    }
}

extension OverlayMenuItem {
    static func textField(textFieldInput: Binding<String>,
                          placeholder: String,
                          bgColor: Color = .custom(.yellow())) -> some View {
        
        TextField(placeholder, text: textFieldInput)
            .foregroundColor(.custom(.black(id: .c2)))
            .customPadding(t: 4, l: 4, b: 4, tr: 4)
            .background(bgColor)
            .customCornerRadius(8)
            .customPadding(t: 3, l: 6, b: 3, tr: 6)
            .multilineTextAlignment(.center)
            .customFont(size: 25, weight: .medium)
    }
}

extension OverlayMenuItem {
    static func slider<V>(title: String,
                          sliderValue: Binding<V>,
                          in bounds: ClosedRange<V>,
                          step: V.Stride,
                          bgColor: Color = .custom(.gray(id: .c3)),
                          onEditingChanged: @escaping (Bool) -> Void) -> some View
    where V: BinaryFloatingPoint, V.Stride: BinaryFloatingPoint {
        
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Spacer()
                Text(title)
                Spacer()
            }
            
            Slider.init(value: sliderValue,
                        in: bounds,
                        step: step,
                        onEditingChanged: onEditingChanged)
                .customPadding(t: 2, l: 6, b: 4, tr: 6)
        }
        .customPadding(t: 4, l: 4, b: 4, tr: 4)
        .foregroundColor(.custom(.white()))
        .background(bgColor)
        .customCornerRadius(8)
        .customFont(size: 25, weight: .semibold)
        .customPadding(t: 3, l: 6, b: 3, tr: 6)
    }
}

extension OverlayMenuItem {
    static func picker(items: [String],
                       pickerItemIndex: Binding<Int>,
                       animatableArrangment: Bool = true,
                       actionAfterPressingChevron action: @escaping () -> Void = { }) -> some View {
        
        let itemsArray = Array(items)
        
        if !(pickerItemIndex.wrappedValue < itemsArray.count) {
            DispatchQueue.main.async {
                pickerItemIndex.wrappedValue = 0
            }
        }
        
        let rightChevronAction = {
            withAnimation {
                pickerItemIndex.wrappedValue.addOrBounce(max: itemsArray.count-1)
                action()
            }
        }
        let leftChevronAction = {
            withAnimation {
                pickerItemIndex.wrappedValue.addOrBounce(value: -1, max: itemsArray.count-1)
                action()
            }
        }
        var forEachRange: Range<Int> {
            if animatableArrangment {
                return itemsArray.indices
            }
            else {
                return pickerItemIndex.wrappedValue..<pickerItemIndex.wrappedValue+1
            }
        }
        
        return HStack(spacing: 0) {
            Button(action: leftChevronAction) {
                Image(systemName: "chevron.left")
                    .resizable()
                    .scaledToFit()
                    .customFrame(height: 38)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .disabled(itemsArray.count < 2)
            
            ZStack {
                ForEach(forEachRange, id: \.self) { idx in
                    Text("\(itemsArray[idx])")
                        .fixedSize(horizontal: true, vertical: false)
                        .customFont(size: 28)
                        .customPadding(.horizontal, 6)
                        .customFrame(height: 38, alignment: .bottom)
                        .offset(x: CGFloat(pickerItemIndex.wrappedValue.distance(to: idx))*screen.width)
                }
            }
            
            Button(action: rightChevronAction) {
                Image(systemName: "chevron.right")
                    .resizable()
                    .scaledToFit()
                    .customFrame(height: 38)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .disabled(itemsArray.count < 2)
        }
        .customPadding(t: 4, l: 6, b: 4, tr: 6)
        
    }
}
