import SwiftUI

extension DeckWalletBaseView.CreateDeckView {
    struct SettingsMenuView: View {
        
        @Binding var selfIsVisible: Bool
        @Binding var allCardKeys: [String]
        @Binding var columns: Int
        @State var columnPickerIndex = 1
        
        var body: some View {
            OverlayMenuStack(isPresented: $selfIsVisible,
                             activationDatePath: \.third) {
                ForEach(SortBy.allCases) { mode in
                    OverlayMenuItem.button(title: mode.buttonText, action: {sortButtonAction(for: mode)})
                }
                
                OverlayMenuItem.picker(items: columnPickerItems(), pickerItemIndex: $columnPickerIndex) {
                    columns = convertColumnPickerIndexToColumnNumber()
                    UD.standardSet(columnPickerIndex, forKey: .deckWalletCreateDeckCardsViewColumns)
                }
                
                OverlayMenuItem.dismissButton(isPresented: $selfIsVisible)
            }
            .onAppear {
                columnPickerIndex =
                    UD.standardValue(forKey: .deckWalletCreateDeckCardsViewColumns) as? Int ?? 6
            }
        }
        
        private func columnPickerItems() -> [String] {
            let minColumnsLimit = Device.isPhone ? 4 : 5
            let maxColumnsLimit = Device.isPhone ? 7 : 9
            let range = minColumnsLimit...maxColumnsLimit
            
            return range.map{"Columns: \($0)"}
        }
        
        private func convertColumnPickerIndexToColumnNumber() -> Int {
            let minColumnsLimit = Device.isPhone ? 4 : 5
            let maxColumnsLimit = Device.isPhone ? 7 : 9
            let range = minColumnsLimit...maxColumnsLimit
            
            return range.map{$0}[columnPickerIndex]
        }
        
        private func sortButtonAction(`for` mode: SortBy) {
            withAnimation {
                allCardKeys = mode.saveAndReturnSortedCards()
            }
        }
        
    }
}

extension DeckWalletBaseView.CreateDeckView.SettingsMenuView {
    enum SortBy: CaseIterable, Identifiable {
        case elixirAscending
        case elixirDescending
        case rarityAscending
        case rarityDescending
        
        var id: String {
            switch self {
            case .elixirAscending: return "ElixirAscending"
            case .elixirDescending: return "ElixirDescending"
            case .rarityAscending: return "RarityAscending"
            case .rarityDescending: return "RarityDescending"
            }
        }
        
        var buttonText: String {
            switch self {
            case .elixirAscending: return "Sort by elixir ascending"
            case .elixirDescending: return "Sort by elixir descending"
            case .rarityAscending: return "Sort by rarity ascending"
            case .rarityDescending: return "Sort by rarity descending"
            }
        }
        
        func sortedCards() -> [String] {
            let all = DataSet.Cards.allValids
            
            switch self {
            case .elixirAscending:
                return all.sortByElixirAscending().map{$0.info.key}
            case .elixirDescending:
                return all.sortByElixirDescending().map{$0.info.key}
            case .rarityAscending:
                return all.sortByRarityAscending().map{$0.info.key}
            case .rarityDescending:
                return all.sortByRarityDescending().map{$0.info.key}
            }
        }
        
        func saveAndReturnSortedCards() -> [String] {
            var sortMode = ""
            var orderMode = ""
            
            switch self {
            case .elixirAscending:
                sortMode = "Elixir"
                orderMode = "Ascending"
            case .elixirDescending:
                sortMode = "Elixir"
                orderMode = "Descending"
            case .rarityAscending:
                sortMode = "Rarity"
                orderMode = "Ascending"
            case .rarityDescending:
                sortMode = "Rarity"
                orderMode = "Descending"
            }
            
            UD.standardSet(sortMode, forKey: .deckWalletCreateDeckSettingsSortMode)
            UD.standardSet(orderMode, forKey: .deckWalletCreateDeckSettingsOrderMode)
            return self.sortedCards()
        }
    }
}
