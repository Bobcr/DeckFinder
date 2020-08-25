import SwiftUI

struct PlayerBaseView: View {
    
    @ObservedObject var cardsSettingsMenuValues: OverlayMenuDatas.CardsSettingsMenu
    @State var segmentedPickerIndex = UD.standardValue(forKey: .playerSegmentedPickerIndex) as? Int ?? 0
    @State var savedPlayersSheetPresentation = false
    
    @Binding var addDeckMenuIsVisible: Bool
    @Binding var addDeckMenuDeckCards: [String]
    
    @EnvironmentObject var appearance: EnvObjs.Appearance
    
    var body: some View {
        VStack(spacing: 0) {
            CustomSegmentedPicker(items: ["Stats", "Battles", "Cards"],
                                  pickerItemIndex: $segmentedPickerIndex,
                                  onChangeAction: {
                                    UD.standardSet(segmentedPickerIndex, forKey: .playerSegmentedPickerIndex)
                                  })
                .customPadding(t: 2, l: 6, b: 4, tr: 6)
            
            Divider()
                .background(Color.custom(.gray(id: .c3)))
            
            Spacer(minLength: 0)
            
            switch segmentedPickerIndex {
            case 2:
                CardsView(settingsMenuValues: cardsSettingsMenuValues)
            case 1:
                BattlesView(addDeckMenuIsVisible: $addDeckMenuIsVisible,
                            addDeckMenuDeckCards: $addDeckMenuDeckCards)
            default:
                StatsView(addDeckMenuIsVisible: $addDeckMenuIsVisible,
                          addDeckMenuDeckCards: $addDeckMenuDeckCards)
            }
            
        }
        .navigationBarItems(leading: leadingButton(), trailing: trailingButton())
        .onAppear(perform: onAppearAction)
        .sheet(isPresented: $savedPlayersSheetPresentation) {
            SavedPlayersView()
                .environmentObject(appearance)
        }
    }
    
    @ViewBuilder
    private func trailingButton() -> some View {
        HStack(spacing: 0) {
            Button(action: {
                withAnimation {
                    savedPlayersSheetPresentation.toggle()
                }
            })
            {
                Image(systemName: "text.book.closed")
                    .font(.navigationBarImage)
            }
            
            Spacer(minLength: Device.navigationBarItemSpacing)
        }
    }
    
    private func leadingButton() -> some View {
        HStack(spacing: 0) {
            Spacer(minLength: Device.navigationBarItemSpacing)
            
            Button(action: {
                withAnimation {
                    cardsSettingsMenuValues.menuIsVisible.toggle()
                }
            })
            {
                Image(systemName: "gear")
                    .font(.navigationBarImage)
            }
            .disabled(!(segmentedPickerIndex == 2))
            .foregroundColor(!(segmentedPickerIndex == 2) ? .custom(.gray()) : .custom(.blue()))
        }
    }
    
    private func onAppearAction() {
        segmentedPickerIndex = UD.standardValue(forKey: .playerSegmentedPickerIndex) as? Int ?? 0
    }
    
}

//struct PlayerBaseView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlayerBaseView()
//    }
//}
