
import SwiftUI

struct OverlayMenuStack<Content: View>: View {
    
    @Binding var isPresented: Bool
    @State var dragTranslation = CGSize.zero
    let hasDragGesture: Bool
    var content: () -> (Content)
    
    // for declaring zIndex when there are multiple OvelayMenuStacks in a view
    @EnvironmentObject var zIndex: EnvObjs.ZIndex
    let activationDatePath: ReferenceWritableKeyPath<EnvObjs.ZIndex, Date?>?
    
    init(isPresented: Binding<Bool>,
         activationDatePath: ReferenceWritableKeyPath<EnvObjs.ZIndex, Date?>? = nil,
         hasDragGesture: Bool = true,
         @ViewBuilder content: @escaping () -> (Content)) {
        
        self._isPresented = isPresented
        self.activationDatePath = activationDatePath
        self.hasDragGesture = hasDragGesture
        self.content = content
    }
    
    var body: some View {
        takeCareOfActivationDate()
        
        return ZStack {
            OverlayMenuItem
                .coverButton(isPresented: isPresented,
                             action: { withAnimation { isPresented = false } })
            
            VStack(spacing: 0) {
                content()
            }
            .frame(minWidth: screen.width/2, maxWidth: screen.width*7/9)
            .customPadding(.vertical, 5)
            .background(Color.custom(.gray(id: .c4)))
            .customCornerRadius(16)
            .conditionalGesture(gesture: swipeGesture(), condition: hasDragGesture)
            .offset(x: dragTranslation.width, y: dragTranslation.height)
            .offset(y: isPresented ? 0 : screen.height)
        }
    }
    
    private func swipeGesture() -> some Gesture {
        return DragGesture()
            .onChanged { value in
                let totalDragDistance = value.translation.totalDistance()
                
                withAnimation(.linear(duration: Double(totalDragDistance)/250)) {
                    dragTranslation = value.translation
                }
            }
            .onEnded { value in
                withAnimation(.customSpring(translation: value.predictedEndTranslation,
                                            dampingFraction: 0.23,
                                            relativeValue: 60)) {
                    dragTranslation = .zero
                }
            }
    }
    
    private func takeCareOfActivationDate() {
        if let path = activationDatePath {
            
            if zIndex[keyPath: path] == nil && isPresented {
                let date: Date? = Date()
                withAnimation {
                    zIndex[keyPath: path] = date
                }
            }
            else if zIndex[keyPath: path] != nil && !isPresented {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    withAnimation {
                        zIndex[keyPath: path] = nil
                    }
                }
            }
        }
    }
}


private extension View {
    @ViewBuilder
    func conditionalGesture<V>(gesture: V, condition: Bool) -> some View where V: Gesture {
        if condition {
            self.gesture(gesture)
        }
        else {
            self
        }
    }
}
