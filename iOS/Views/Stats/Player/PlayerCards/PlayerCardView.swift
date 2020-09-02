import SwiftUI

extension PlayerBaseView {
    struct CardsView: View {
        
        @ObservedObject var settingsMenuValues: OverlayMenuDatas.CardsSettingsMenu
        
        @EnvironmentObject var datas: EnvObjs.Datas
        @EnvironmentObject var appearance: EnvObjs.Appearance
        @Environment(\.presentationMode) var presentationMode
        
        var body: some View {
            BGStack {
                CustomScrollView(showsIndicators: false) {
                    UnlockedCardsView(columns: settingsMenuValues.fixedColumns == nil ?
                                        $settingsMenuValues.columns
                                        : .constant(settingsMenuValues.fixedColumns!))
                    LockedCardsView(columns: settingsMenuValues.fixedColumns == nil ?
                                        $settingsMenuValues.columns
                                        : .constant(settingsMenuValues.fixedColumns!))
                }
            }
            .onAppear(perform: onAppearAction)
        }
        
        private func onAppearAction() {
            settingsMenuValues.playerCardsColumnPickerIndex
                = UD.standardValue(forKey: .playerCardsColumnPickerIndex) as? Int ?? 0
            settingsMenuValues.playerCardsSortPickerIndex
                = UD.standardValue(forKey: .playerCardsSortPickerIndex) as? Int ?? 0
            settingsMenuValues.playerCardsOrderPickerIndex
                = UD.standardValue(forKey: .playerCardsOrderPickerIndex) as? Int ?? 0
            settingsMenuValues.columns
                = convertColumnPickerIndexToColumnNumber()
            let sortMode = Self.getSortMode()
            let orderMode = Self.getOrderMode()
            datas.playerProfile.cards = Self.sortPlayerCards(cards: datas.playerProfile.cards,
                                                             sort: sortMode, order: orderMode)
        }
        
    }
}

extension PlayerBaseView.CardsView {
    enum SortMode { case level, upgradeability, elixir, rarity }
    enum OrderMode { case ascending, descending }
    
    static func sortPlayerCards(cards: [OAPI.Models.PlayerProfile.ProfileCard],
                                sort: PlayerBaseView.CardsView.SortMode, order: PlayerBaseView.CardsView.OrderMode)
    -> [OAPI.Models.PlayerProfile.ProfileCard] {
        
        let progressInt: (String) -> (Int) = {
            Int(String($0.dropLast())) ?? 0
        }
        
        var cards = cards
        
        switch sort {
        case .level:
            cards.sort{ $0.enumValue.info.elixir < $1.enumValue.info.elixir }
            cards.sort{ progressInt($0.progressText) < progressInt($1.progressText) }
            cards.sort{ $0.upgradeableToLevel < $1.upgradeableToLevel }
            cards.sort{ $0.enumValue.info.starLevels < $1.enumValue.info.starLevels }
            cards.sort{ $0.starLevel < $1.starLevel }
            cards.sort{ $0.enumValue.info.rarity.int < $1.enumValue.info.rarity.int }
            cards.sort{ $0.level < $1.level }
        case .upgradeability:
            cards.sort{ $0.level < $1.level }
            cards.sort{ $0.enumValue.info.starLevels < $1.enumValue.info.starLevels }
            cards.sort{ $0.enumValue.info.elixir < $1.enumValue.info.elixir }
            cards.sort{ $0.enumValue.info.rarity.int < $1.enumValue.info.rarity.int }
            cards.sort{ $0.starLevel < $1.starLevel }
            cards.sort{ progressInt($0.progressText) < progressInt($1.progressText) }
            cards.sort{ $0.upgradeableToLevel < $1.upgradeableToLevel }
        case .elixir:
            cards.sort{ $0.enumValue.info.starLevels < $1.enumValue.info.starLevels }
            cards.sort{ progressInt($0.progressText) < progressInt($1.progressText) }
            cards.sort{ $0.upgradeableToLevel < $1.upgradeableToLevel }
            cards.sort{ $0.starLevel < $1.starLevel }
            cards.sort{ $0.level < $1.level }
            cards.sort{ $0.enumValue.info.rarity.int < $1.enumValue.info.rarity.int }
            cards.sort{ $0.enumValue.info.elixir < $1.enumValue.info.elixir }
        case .rarity:
            cards.sort{ $0.enumValue.info.starLevels < $1.enumValue.info.starLevels }
            cards.sort{ progressInt($0.progressText) < progressInt($1.progressText) }
            cards.sort{ $0.upgradeableToLevel < $1.upgradeableToLevel }
            cards.sort{ $0.starLevel < $1.starLevel }
            cards.sort{ $0.level < $1.level }
            cards.sort{ $0.enumValue.info.elixir < $1.enumValue.info.elixir }
            cards.sort{ $0.enumValue.info.rarity.int < $1.enumValue.info.rarity.int }
        }
        
        switch order {
        case .ascending: {}()
        case .descending: cards = Array(cards.reversed())
        }
        
        return cards
    }
    
    static func getSortMode() -> PlayerBaseView.CardsView.SortMode {
        let udSortInt = UD.standardValue(forKey: .playerCardsSortPickerIndex) as? Int ?? 0
        
        switch udSortInt {
        case 0: return .level
        case 1: return .upgradeability
        case 2: return .elixir
        default: return .rarity
        }
    }
    
    static func getOrderMode() -> PlayerBaseView.CardsView.OrderMode {
        let udOrderInt = UD.standardValue(forKey: .playerCardsOrderPickerIndex) as? Int ?? 0
        
        if udOrderInt == 0 { return .ascending }
        else { return .descending }
    }
}

private func convertColumnPickerIndexToColumnNumber() -> Int {
    let playerCardsColumnPickerIndex =
        UD.standardValue(forKey: .playerCardsColumnPickerIndex) as? Int ?? 0
    
    let minColumnsLimit = Device.isPhone ? 4 : 5
    let maxColumnsLimit = Device.isPhone ? 7 : 9
    let range = minColumnsLimit...maxColumnsLimit
    
    return range.map{$0}[playerCardsColumnPickerIndex]
}
