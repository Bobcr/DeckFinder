import SwiftUI

struct ClanBaseView: View {
    
    @ObservedObject var nameSearchMenuValues: OverlayMenuDatas.ClanSearchMenu
    
    @State var segmentedPickerIndex = UD.standardValue(forKey: .clanSegmentedPickerIndex) as? Int ?? 0
    @State var savedClansSheetPresentation = false
    
    @EnvironmentObject var warSortMenuValues:
        OverlayMenuDatas.ClanCurrentWarSortMenu
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
                    .customPadding(.top, 4)
            case 1:
                CurrentWarView()
                    .customPadding(.top, 4)
            default:
                ProfileView()
                    .customPadding(.top, 4)
            }
            
        }
        .navigationBarItems(leading: makeLeadingButton(),
                            trailing: makeTrailingButton())
    }
    
    private func makeLeadingButton() -> some View {
        HStack(spacing: 0) {
            Spacer(minLength: Device.navigationBarItemSpacing)
            
            Button(action: {
                withAnimation {
                    warSortMenuValues.menuIsVisible.toggle()
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


extension ClanBaseView {
    enum WarSortMode: CaseIterable {
        case fame, repairPoints
        
        var uiString: String {
            switch self {
            case .fame: return "Fame"
            case .repairPoints: return "Repair Points"
            }
        }
        
        var currentWarSortingPath:
            KeyPath<OAPI.Models.ClanCurrentWar.Participant, Int> {
            switch self {
            case .fame: return \.fame
            case .repairPoints: return \.repairPoints
            }
        }
        
        var warLogSortingPath:
            KeyPath<OAPI.Models.ClanWarLog.Participant, Int> {
            switch self {
            case .fame: return \.fame
            case .repairPoints: return \.repairPoints
            }
        }
        
        static func find() -> Self {
            let udValue = UD.standardValue(forKey: .clanCurrentWarPlayersSortModeIndex)
            let udInt = udValue as? Int ?? 0
            
            switch udInt {
            case 1: return .repairPoints
            default: return .fame
            }
        }
    }
    
    enum WarOrderMode: CaseIterable {
        case descending, ascending
        
        var uiString: String {
            switch self {
            case .ascending: return "Ascending"
            case .descending: return "Descending"
            }
        }
        
        func getOrderFunction() -> ((Int, Int) -> Bool) {
            switch self {
            case .ascending: return { $0 < $1 }
            case .descending: return { $0 > $1 }
            }
        }
        
        static func find() -> Self {
            let udValue = UD.standardValue(forKey: .clanCurrentWarPlayersOrderModeIndex)
            let udInt = udValue as? Int ?? 0
            
            switch udInt {
            case 1: return .ascending
            default: return .descending
            }
        }
    }
}
