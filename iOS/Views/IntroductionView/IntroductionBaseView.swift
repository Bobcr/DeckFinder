import SwiftUI

struct IntroductionBaseView: View {
    
    @EnvironmentObject var appearance: EnvObjs.Appearance
    @State var pageIndex = 0
    @State var dragX: CGFloat = 0
    @State var bigPics = false
    
    var body: some View {
        BGStack {
            VStack(spacing: 0) {
                makeButtons()
                makeImages()
                makeDots()
            }
        }
        .gesture(swipeGesture())
        .onReceive(appearance.$introductionViewPresentation) { value in
            if !value {
                UD.standardSet(false, forKey: .firstTimeUserOpenedTheAppEver)
            }
        }
    }
    
    private func makeButtons() -> some View {
        HStack(spacing: 0) {
            
            let isLast = pageIndex == 3
            
            Button("Skip") {
                withAnimation {
                    appearance.introductionViewPresentation = false
                }
            }
            .opacity(isLast ? 0 : 1)
            
            Spacer()
            
            Button(isLast ? "Done!" : "Next") {
                if isLast {
                    withAnimation {
                        appearance.introductionViewPresentation = false
                    }
                }
                else {
                    withAnimation(.easeOut) {
                        pageIndex += 1
                    }
                }
            }
        }
        .customPadding(.horizontal, 20)
        .customPadding(.bottom, 30)
        .customFont(size: 22)
    }
    
    @ViewBuilder
    private func makeImages() -> some View {
        let introImageNames: [String] = {
            let prefix = Device.isPhone ? "iPhone-intro" : "iPad-intro"
            return ["\(prefix)1", "\(prefix)2", "\(prefix)3", "\(prefix)4"]
        }()
        let introImageDescriptions = [
            "Save Your Decks\nAnd Pick Them Back Up\n Whenever You Want",
            "See Detailed Stats About\nYour Clash Royale Progress",
            "Find If You Are\nOne Of The Bests\nIn The World",
            "Set Your Player Tag\nTo Get Exclusive Info\nAbout Your Own Account!"]
            
        ZStack {
            ForEach(0...3, id: \.self) { idx in
                VStack(spacing: 0) {
                    
                    Text(introImageDescriptions[idx])
                        .multilineTextAlignment(.center)
                        .customFont(size: 26)
                        .customPadding(.bottom, 12)
                        .foregroundColor(.custom(.orange()))
                    
                    ZStack {
                        Image(introImageNames[idx])
                            .resizable()
                            .scaledToFit()
                            .frame(width: screen.width*13/24)
                            .opacity(0)
                            .overlay(Color.white.customCornerRadius(40))
                        
                        Image(introImageNames[idx])
                            .resizable()
                            .scaledToFit()
                            .frame(width: screen.width*1/2)
                    }
                    .onTapGesture(count: 2) {
                        withAnimation {
                            bigPics.toggle()
                        }
                    }
                    .onTapGesture {
                        withAnimation {
                            bigPics = false
                        }
                    }
                    .scaleEffect(bigPics ? 47/30 : 1)
                    
                }
                .offset(x: UIScreen.main.bounds.size.width
                            * (CGFloat(idx-pageIndex)))
                .offset(x: dragX)
                .onChange(of: pageIndex) { _ in
                    withAnimation {
                        bigPics = false
                    }
                }
            }
        }
    }
    
    private func makeDots() -> some View {
        HStack(spacing: 0) {
            ForEach(0...3, id: \.self) { idx in
                Circle()
                    .customFrame(width: 8, height: 8)
                    .foregroundColor(idx == pageIndex ? .yellow : .gray)
                    .customPadding(t: 12, l: 2, b: 2, tr: 2)
            }
        }
    }
    
    private func swipeGesture() -> some Gesture {
        DragGesture()
            .onChanged { value in
                withAnimation {
                    dragX = value.translation.width
                }
            }
            .onEnded { value in
                withAnimation(.easeOut) {
                    if dragX > 45 {
                        dragX = 0
                        pageIndex -= pageIndex == 0 ? 0 : 1
                    }
                    else if dragX < -45 {
                        dragX = 0
                        pageIndex += pageIndex == 3 ? 0 : 1
                    }
                    else {
                        dragX = 0
                    }
                }
            }
    }
    
}

struct IntrodutionBaseView_Previews: PreviewProvider {
    static var previews: some View {
        IntroductionBaseView()
            .previewDevice(.init(stringLiteral: "iPhone 7 Plus"))
    }
}
