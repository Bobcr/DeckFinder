import SwiftUI

extension ClanBaseView {
    struct CurrentWarView: View {
        
        @State var participantsAreVisible = Array(repeating: false, count: 10)
        
        @EnvironmentObject var sortMenuValues: OverlayMenuDatas.ClanCurrentWarSortMenu
        @EnvironmentObject var appearance: EnvObjs.Appearance
        @EnvironmentObject var datas: EnvObjs.Datas
        @Environment(\.openURL) var openURL
        
        var body: some View {
            BGStack {
                makeStandings()
                    .onChange(of: datas.clanProfile.tag) { _ in
                        participantsAreVisible = Array(repeating: false, count: 10)
                    }
            }
        }
    }
}
