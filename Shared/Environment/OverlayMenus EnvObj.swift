import Foundation
import SwiftUI

struct OverlayMenuDatas {
    class CardsSettingsMenu: ObservableObject {
        @Published var menuIsVisible: Bool = .init()
        @Published var playerCardsSortPickerIndex = UD.standardValue(forKey: .playerCardsSortPickerIndex) as? Int ?? 0
        @Published var playerCardsOrderPickerIndex = UD.standardValue(forKey: .playerCardsOrderPickerIndex) as? Int ?? 0
        @Published var playerCardsColumnPickerIndex = UD.standardValue(forKey: .playerCardsColumnPickerIndex) as? Int ?? 0
        @Published var columns = convertColumnPickerIndexToColumnNumber()
        
        // for creating image out of the view using a columns number provided by me
        var fixedColumns: Int? = nil
        
        
        private static func convertColumnPickerIndexToColumnNumber() -> Int {
            let playerCardsColumnPickerIndex =
                UD.standardValue(forKey: .playerCardsColumnPickerIndex) as? Int ?? 0
            
            let minColumnsLimit = Device.isPhone ? 4 : 5
            let maxColumnsLimit = Device.isPhone ? 7 : 9
            let range = minColumnsLimit...maxColumnsLimit
            
            return range.map{$0}[playerCardsColumnPickerIndex]
        }
        
        
        init() { }
        init(fixedColumns: Int) {
            self.fixedColumns = fixedColumns
        }
    }
    
    class ClanSearchMenu: ObservableObject {
        @Published var menuIsVisible: Bool = false
        @Published var name: String = UD.standardValue(forKey: .clansNameSearchName) as? String ?? ""
        @Published var region: DataSet.Regions = .find(key: UD.standardValue(forKey: .clansNameSearchRegionKey) as? String)
        @Published var minMembers: Double = UD.standardValue(forKey: .clansNameSearchMinMembers) as? Double ?? 5
        @Published var maxMembers: Double = UD.standardValue(forKey: .clansNameSearchMaxMembers) as? Double ?? 50
        @Published var minScore: Double = UD.standardValue(forKey: .clansNameSearchMinScore) as? Double ?? 5000
        @Published var limit: Double = UD.standardValue(forKey: .clansNameSearchLimit) as? Double ?? 100
        
        required init() { }
        
        static var emptyVisibleMenu: Self {
            let selfi = self.init()
            selfi.menuIsVisible = true
            return selfi
        }
    }
    
    class ClanCurrentWarSortMenu: ObservableObject {
        @Published var menuIsVisible: Bool = false
        @Published var sortMode: ClanBaseView.CurrentWarView.SortMode = .find()
        @Published var orderMode: ClanBaseView.CurrentWarView.OrderMode = .find()
        @Published var sortModeIndex
            = UD.standardValue(forKey: .clanCurrentWarPlayersSortModeIndex) as? Int ?? 0
        @Published var orderModeIndex
            = UD.standardValue(forKey: .clanCurrentWarPlayersOrderModeIndex) as? Int ?? 0
    }
}
