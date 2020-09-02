import SwiftUI

struct ClanBaseView: View {
    
    @ObservedObject var nameSearchMenuValues: OverlayMenuDatas.ClanSearchMenu
    @ObservedObject var currentWarSortMenuValues: OverlayMenuDatas.ClanCurrentWarSortMenu
    
    @State var segmentedPickerIndex = UD.standardValue(forKey: .clanSegmentedPickerIndex) as? Int ?? 0
    @State var savedClansSheetPresentation = false
    
    @EnvironmentObject var appearance: EnvObjs.Appearance
    @EnvironmentObject var datas: EnvObjs.Datas
    @Environment(\.openURL) var openURL
    
    var body: some View {
        VStack(spacing: 0) {
            CustomSegmentedPicker(items: ["Profile", "Current War", "War Log"],
                                  pickerItemIndex: $segmentedPickerIndex,
                                  onChangeAction: {
                                    UD.standardSet(segmentedPickerIndex, forKey: .clanSegmentedPickerIndex)
                                  })
                .customPadding(t: 2, l: 6, b: 4, tr: 6)
            
            Divider()
                .background(Color.custom(.gray(id: .c3)))
            
            Spacer(minLength: 0)
            
            switch segmentedPickerIndex {
            case 2:
                WarLogView()
            case 1:
                CurrentWarView(sortMenuValues: currentWarSortMenuValues)
            default:
                ProfileView()
            }
            
        }
        .navigationBarItems(leading: makeLeadingButton(), trailing: makeTrailingButton())
    }
    
    private func makeLeadingButton() -> some View {
        HStack(spacing: 0) {
            Spacer(minLength: Device.navigationBarItemSpacing)
            
            Button(action: {
                withAnimation {
                    currentWarSortMenuValues.menuIsVisible.toggle()
                }
            })
            {
                Image(systemName: "gear")
                    .font(.navigationBarImage)
            }
            .disabled(!(segmentedPickerIndex == 1))
            .foregroundColor(!(segmentedPickerIndex == 1) ? .custom(.gray()) : .custom(.blue()))
        }
    }
    
    private func makeTrailingButton() -> some View {
        HStack(spacing: 0) {
            Button(action: {
                savedClansSheetPresentation.toggle()
            })
            {
                Image(systemName: "a.book.closed")
                    .font(.navigationBarImage)
            }
            
            Spacer(minLength: Device.navigationBarItemSpacing)
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
