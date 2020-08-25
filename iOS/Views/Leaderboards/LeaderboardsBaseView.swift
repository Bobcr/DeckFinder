import SwiftUI

struct LeaderboardsBaseView: View {
    
    @State var overlayPresentation = false
    @State var leaderboardMode = getUDLeaderboardMode()
    @State var region = getUDLeaderboardRegion()
    
//    @State var scrollButtonGeo: GeometryProxy?
//    @State var scrollButtonTranslation: CGSize = .zero
    
    @EnvironmentObject var datas: EnvObjs.Datas
    @EnvironmentObject var appearance: EnvObjs.Appearance
    
    var body: some View {
        NavigationView {
            BGStack {
                ScrollViewReader { scrollProxy in
                    ZStack(alignment: .bottomTrailing) {
                        CustomScrollView {
                            makeHeader()
                            
                            Divider()
                                .customPadding(.top, 6)
                            
                            LeaderboardsContentView(leaderboardMode: $leaderboardMode,
                                                    region: $region)
                        }
                        
                        makeScrollButton(scrollProxy: scrollProxy)
                    }
                }
            }
            .navigationTitle(leaderboardMode.userReadable)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: leadingButton(), trailing: trailingButton())
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
    
    private func leadingButton() -> some View {
        HStack(spacing: 0) {
            Spacer(minLength: Device.navigationBarItemSpacing)
            
            Button(action: {
                withAnimation { searchButtonAction() }
            }) {
                Image(systemName: "arrow.triangle.2.circlepath")
                    .font(.navigationBarImage)
            }
        }
    }
    
    private func trailingButton() -> some View {
        HStack(spacing: 0) {
            if !overlayPresentation {
                NavigationLink(destination: ChooseRegionView(region: $region)) {
                    Image(systemName: "network")
                        .font(.navigationBarImage)
                }
            }
            else {
                Button(action: {
                    withAnimation { overlayPresentation = false }
                }) {
                    Text("Dismiss")
                        .font(.navigationBarText)
                }
            }
            
            Spacer(minLength: Device.navigationBarItemSpacing)
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
