import SwiftUI

extension LeaderboardsBaseView {
    
    private var buttonDiameter: CGFloat { 52 }
    
    @ViewBuilder
    func makeScrollButton(scrollProxy: ScrollViewProxy) -> some View {
        
        let itemCount: Int = {
            switch leaderboardMode {
            case .players:
                return datas.playerLeaderbaord.items.count
            case .clans, .warClans:
                if datas.clanLeaderboard.mode.rawValue == leaderboardMode.id {
                    return datas.clanLeaderboard.items.count
                } else { return 0 }
            case .globalTourney:
                return datas.gtLeaderbord.items.count
            default:
                return datas.raLeaderboards.items.count
            }
        }()
        
        let playerTags: [String] = {
            switch leaderboardMode {
            case .players:
                return datas.playerLeaderbaord.items.map(\.tag)
            case .clans, .warClans:
                return []
            case .globalTourney:
                return datas.gtLeaderbord.items.map(\.tag)
            default:
                return datas.raLeaderboards.items.map(\.tag)
            }
        }()
        
        let shortcutNumbers: [Int] = {
            let max = Int(((Double(itemCount)/100).rounded(.up)))
            if max > 0 {
                return (0...max).map{$0*100}
            }
            else { return [] }
        }()
        
        if itemCount != 0 {
            Circle()
                .foregroundColor(.custom(.blue()))
                .customFrame(width: buttonDiameter, height: buttonDiameter)
                .customPadding(8)
//                .offset(x: scrollButtonTranslation.width,
//                        y: scrollButtonTranslation.height)
                .opacity(0.9)
                .menu {
                    if shortcutNumbers.count != 0 {
                        Button("Shortcuts", imageSystemName: "option") { }
                            .menu {
                                ForEach(shortcutNumbers, id: \.self) { number in
                                    Button("Go to \(number)", imageSystemName: "arrow.up.arrow.down") {
                                        withAnimation {
                                            scrollProxy.scrollTo(number-1 > 0 ? number-1 : 0, anchor: .bottom)
                                        }
                                    }
                                }
                            }
                    }
                    
                    
                    Button("Custom scroll", imageSystemName: "arrow.up.arrow.down") {
                        customScrollTo(proxy: scrollProxy, itemCount: itemCount)
                    }
                    
                    Button("Scroll to bottom", imageSystemName: "arrow.down") {
                        withAnimation {
                            scrollProxy.scrollTo(itemCount-1, anchor: .bottom)
                        }
                    }
                    
                    Button("Scroll to top", imageSystemName: "arrow.up") {
                        withAnimation {
                            scrollProxy.scrollTo(0, anchor: .center)
                        }
                    }
                    
                    if let playerTag = UD.sharedValue(forKey: .playerTag) as? String,
                       let indexInTheTags = playerTags.firstIndex(of: playerTag) {
                        Button("Scroll to YOU!", imageSystemName: "person.fill") {
                            withAnimation {
                                scrollProxy.scrollTo(indexInTheTags, anchor: .center)
                            }
                        }
                    }
                }
//                .gesture(dragGesture())
        }
    }
    
//    func dragGesture() -> some Gesture {
//        return DragGesture()
//            .onChanged { value in
////                guard let geo = scrollButtonGeo else {
////                    return
////                }
//                withAnimation {
//                    scrollButtonTranslation = value.translation
//                }
//            }
//            .onEnded { value in
//                withAnimation {
////                    guard let geo = scrollButtonGeo else {
////                        return
////                    }
////                    let translation = value.translation
//                    let diameter: CGFloat = .custom(buttonDiameter)
//                    scrollButtonTranslation.width.addOrBounce(value: 0,
//                                                              min: diameter,
//                                                              max: screen.width - diameter)
//                    scrollButtonTranslation.height.addOrBounce(value: 0,
//                                                               min: diameter,
//                                                               max: screen.height - diameter)
//                }
//            }
//    }
    
    private func customScrollTo(proxy: ScrollViewProxy, itemCount: Int) {
        Present.alertWithTextField(title: "Enter rank of item to scroll to",
                                   message: "Currently there are \(itemCount) items. Entries more than \(itemCount) will be ignored. Enter using the english number pad.",
                                   placeholder: "# of item",
                                   buttonTitle: "Scroll!",
                                   keyboardType: .numberPad) { controller in
            
            if let textFileds = controller.textFields,
               let textField = textFileds.first,
               let text = textField.text,
               let number = Int(text.spaceRemover()) {
                
                withAnimation {
                    proxy.scrollTo(number-1, anchor: .center)
                }
            }
        }
    }
}
