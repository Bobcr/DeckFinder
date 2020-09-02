import SwiftUI

extension PlayerBaseView.CardsView {
    struct CardsSettingsMenuView: View {
        
        @ObservedObject var menuValues: OverlayMenuDatas.CardsSettingsMenu
        @State var activationDatePath: ReferenceWritableKeyPath<EnvObjs.ZIndex, Date?>? = nil
        @EnvironmentObject var datas: EnvObjs.Datas
        
        var body: some View {
            OverlayMenuStack.init(isPresented: $menuValues.menuIsVisible,
                                  activationDatePath: activationDatePath) {
                
                OverlayMenuItem.text(title: "Sort by:")
                OverlayMenuItem.picker(items: ["Level", "Upgradeability",
                                               "Elixir", "Rarity"],
                                       pickerItemIndex: $menuValues.playerCardsSortPickerIndex) {
                    UD.standardSet(menuValues.playerCardsSortPickerIndex, forKey: .playerCardsSortPickerIndex)
                    let sortMode = Self.getSortMode()
                    let orderMode = Self.getOrderMode()
                    datas.playerProfile.cards = PlayerBaseView.CardsView
                        .sortPlayerCards(cards: datas.playerProfile.cards,
                                         sort: sortMode, order: orderMode)
                }
                
                OverlayMenuItem.text(title: "Order:")
                OverlayMenuItem.picker(items: ["Ascending", "Descending"],
                                       pickerItemIndex: $menuValues.playerCardsOrderPickerIndex) {
                    UD.standardSet(menuValues.playerCardsOrderPickerIndex, forKey: .playerCardsOrderPickerIndex)
                    let sortMode = Self.getSortMode()
                    let orderMode = Self.getOrderMode()
                    datas.playerProfile.cards = PlayerBaseView.CardsView
                        .sortPlayerCards(cards: datas.playerProfile.cards,
                                         sort: sortMode, order: orderMode)
                }
                
                OverlayMenuItem.text(title: "Columns:")
                OverlayMenuItem.picker(items: columnPickerItems(),
                                       pickerItemIndex: $menuValues.playerCardsColumnPickerIndex) {
                    UD.standardSet(menuValues.playerCardsColumnPickerIndex, forKey: .playerCardsColumnPickerIndex)
                    menuValues.columns = convertColumnPickerIndexToColumnNumber()
                }
            }
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
    
}

private func columnPickerItems() -> [String] {
    let minColumnsLimit = Device.isPhone ? 4 : 5
    let maxColumnsLimit = Device.isPhone ? 7 : 9
    let range = minColumnsLimit...maxColumnsLimit
    
    return range.map{"\($0)"}
}

private func convertColumnPickerIndexToColumnNumber() -> Int {
    let playerCardsColumnPickerIndex =
        UD.standardValue(forKey: .playerCardsColumnPickerIndex) as? Int ?? 0
    
    let minColumnsLimit = Device.isPhone ? 4 : 5
    let maxColumnsLimit = Device.isPhone ? 7 : 9
    let range = minColumnsLimit...maxColumnsLimit
    
    return range.map{$0}[playerCardsColumnPickerIndex]
}
