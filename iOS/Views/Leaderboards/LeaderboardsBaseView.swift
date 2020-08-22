import SwiftUI

struct LeaderboardsBaseView: View {
    
    @State var overlayPresentation = false
    @State var leaderboardMode = getUDLeaderboardMode()
    @State var region = getUDLeaderboardRegion()
    
    @EnvironmentObject var datas: EnvObjs.Datas
    @EnvironmentObject var appearance: EnvObjs.Appearance
    
    var body: some View {
        NavigationView {
            BGStack {
                ScrollViewReader { proxy in
                    ZStack(alignment: .bottomTrailing) {
                        CustomScrollView {
                            makeHeader()
                            
                            Divider()
                                .customPadding(.top, 6)
                            
                            LeaderboardsContentView(leaderboardMode: $leaderboardMode,
                                                    region: $region)
                        }
                        
                        makeScrollButton(proxy: proxy)
                    }
                }
            }
            .navigationTitle(leaderboardMode.userReadable)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: trailingButton())
            .onAppear(perform: onAppearAction)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    func changeModeButtonAction(`for` mode: Mode) {
        leaderboardMode = mode
        UD.standardSet(mode.userReadable, forKey: .leaderboardsLeaderboardMode)
        withAnimation {
            overlayPresentation = false
        }
    }
    
    @ViewBuilder
    private func trailingButton() -> some View {
        if !overlayPresentation {
            NavigationLink(destination: ChooseRegionView(region: $region)) {
                Image(systemName: "network")
                    .font(.title)
            }
        }
        else {
            Button(action: {
                withAnimation { overlayPresentation = false }
            }) {
                Text("Dismiss")
                    .font(.title2)
            }
        }
    }
    
    @ViewBuilder
    private func makeScrollButton(proxy: ScrollViewProxy) -> some View {
        
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
        
        if itemCount != 0 {
            Circle()
                .foregroundColor(.custom(.blue()))
                .customFrame(width: 45, height: 45)
                .customPadding(6)
                .opacity(0.9)
                .menu {
                    Button("Custom scroll", imageSystemName: "arrow.up.arrow.down") {
                        customScrollTo(proxy: proxy, itemCount: itemCount)
                    }
                    
                    Button("Scroll to bottom", imageSystemName: "arrow.down") {
                        withAnimation {
                            proxy.scrollTo(itemCount-1, anchor: .bottom)
                        }
                    }
                    
                    Button("Scroll to top", imageSystemName: "arrow.up") {
                        withAnimation {
                            proxy.scrollTo(0, anchor: .center)
                        }
                    }
                    
                    if let playerTag = UD.sharedValue(forKey: .playerTag) as? String,
                       let indexInTheTags = playerTags.firstIndex(of: playerTag) {
                        Button("Scroll to YOU!", imageSystemName: "person.fill") {
                            withAnimation {
                                proxy.scrollTo(indexInTheTags, anchor: .center)
                            }
                        }
                    }
                }
        }
    }
    
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
    
    private func onAppearAction() {
        leaderboardMode = getUDLeaderboardMode()
        region = getUDLeaderboardRegion()
    }
    
}

struct LeaderboardsBaseView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardsBaseView()
    }
}

private func getUDLeaderboardMode() -> LeaderboardsBaseView.Mode {
    if let udLeaderboardModeUserReadable = UD.standardValue(forKey: .leaderboardsLeaderboardMode) as? String {
        return LeaderboardsBaseView.Mode.find(by: udLeaderboardModeUserReadable)
    }
    else {
        return .starpoints
    }
}

private func getUDLeaderboardRegion() -> DataSet.Regions {
    if let udRegionKey = UD.standardValue(forKey: .leaderboardsLastSearchedLeaderboardRegions) as? [String],
       let lastRegionKey = udRegionKey.last {
        
        return .find(key: lastRegionKey)
    }
    else {
        return .All
    }
}
