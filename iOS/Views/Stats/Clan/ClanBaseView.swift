import SwiftUI

struct ClanBaseView: View {
    
    @ObservedObject var nameSearchMenuValues: OverlayMenuDatas.ClanSearchMenu
    @State var savedClansSheetPresentation = false
    
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
        .navigationBarItems(trailing: makeTrailingButton())
    }
    
    private func makeTrailingButton() -> some View {
        HStack(spacing: 0) {
            Button(action: {
                savedClansSheetPresentation.toggle()
            })
            {
                Image(systemName: "a.book.closed")
                    .font(.title)
            }
        }
        .sheet(isPresented: $savedClansSheetPresentation) {
            SavedClansView()
                .environmentObject(appearance)
        }
    }
}


//struct PlayerClansBaseView_Previews: PreviewProvider {
//    static var previews: some View {
//        ClanBaseView(clanNameSearchMenuValues: .constant(.init()))
//            .environmentObject(EnvObjs.Datas.testData)
//            .environmentObject(EnvObjs.Appearance.init())
//    }
//}
