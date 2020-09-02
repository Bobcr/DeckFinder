import SwiftUI

extension ClanBaseView {
    struct ProfileView: View {
        
        @EnvironmentObject var appearance: EnvObjs.Appearance
        @EnvironmentObject var datas: EnvObjs.Datas
        @Environment(\.openURL) var openURL
        
        var body: some View {
            BGStack {
                let profile = datas.clanProfile
                let members = profile.memberList
                
                if profile.tag != "" {
                    CustomScrollView {
                        makeClanHeader()
                        
                        CustomGrid.init(allItemsCount: members.count,
                                        rows: members.count) { idx in
                            
                            makePlayerCell(idx: idx)
                        }
                    }
                }
            }
        }
        
    }
}
