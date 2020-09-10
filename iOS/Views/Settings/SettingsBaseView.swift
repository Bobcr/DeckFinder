import SwiftUI

struct SettingsBaseView: View {
    
    @EnvironmentObject var appearance: EnvObjs.Appearance
    @EnvironmentObject var datas: EnvObjs.Datas
    @Environment(\.openURL) var openURL
    
    @State var user: UserAPI.PublicUser? = .getFromUD()
    
    // Player Info
    @State var textFieldPlayerTag = ""
    @State var gcSlider = UD.standardValue(forKey: .grandChallengeAverageWins) as? Double ?? -999
    @State var ccSlider = UD.standardValue(forKey: .classicChallengeAverageWins) as? Double ?? -999
    
    var body: some View {
        NavigationView {
            BGStack {
                CustomScrollView(showsIndicators: false) {
                    VStack(spacing: 0) {
                        
                        makeUser()
                        makePlayerInfo()
                        makeWidgetController()
                        makeTwitter()
                        makeDisclaimerAndAll()
                        makePrivacyPolicyAndToS()
                        
                        if let id = Device.id {
                            makeAppId(id: id)
                        }
                    }
                    .customPadding(.top, 12)
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: onAppearAction)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private func onAppearAction() {
        textFieldPlayerTag = UD.sharedValue(forKey: .playerTag) as? String ?? ""
        gcSlider = UD.standardValue(forKey: .grandChallengeAverageWins) as? Double ?? -999
        ccSlider = UD.standardValue(forKey: .classicChallengeAverageWins) as? Double ?? -999
    }
}

struct SettingsBaseView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsBaseView()
    }
}

