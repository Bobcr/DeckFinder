import SwiftUI

extension ClanBaseView {
    struct CurrentWarView: View {
        
        @ObservedObject var sortMenuValues: OverlayMenuDatas.ClanCurrentWarSortMenu
        @State var participantsAreVisible = Array(repeating: false, count: 10)
        
        @EnvironmentObject var appearance: EnvObjs.Appearance
        @EnvironmentObject var datas: EnvObjs.Datas
        @Environment(\.openURL) var openURL
        
        var body: some View {
            makeStandings()
                .onChange(of: datas.clanProfile.tag) { _ in
                    participantsAreVisible = Array(repeating: false, count: 10)
                }
        }
        
        enum SortMode: CaseIterable {
            case fame, repairPoints
            
            var uiString: String {
                switch self {
                case .fame: return "Fame"
                case .repairPoints: return "Repair Points"
                }
            }
            
            var keyPathForSorting: KeyPath<OAPI.Models.ClanCurrentWar.Participant, Int> {
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
        
        enum OrderMode: CaseIterable {
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
}
