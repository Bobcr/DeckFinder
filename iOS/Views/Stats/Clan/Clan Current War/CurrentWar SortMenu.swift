import SwiftUI

extension ClanBaseView.CurrentWarView {
    struct SortMenu: View {
        
        @EnvironmentObject var datas: EnvObjs.Datas
        
        @ObservedObject var menuValues: OverlayMenuDatas.ClanCurrentWarSortMenu
        let activationDatePath: ReferenceWritableKeyPath<EnvObjs.ZIndex, Date?>?
        
        var body: some View {
            OverlayMenuStack.init(isPresented: $menuValues.menuIsVisible,
                                  activationDatePath: activationDatePath)
            {
                OverlayMenuItem.text(title: "Sort by:")
                OverlayMenuItem.picker(items: SortMode.allCases.map{$0.uiString},
                                       pickerItemIndex: $menuValues.sortModeIndex) {
                    UD.standardSet(menuValues.sortModeIndex,
                                   forKey: .clanCurrentWarPlayersSortModeIndex)
                    menuValues.sortMode = .find()
                    
                    sortAndOrderPlayers()
                }
                
                OverlayMenuItem.text(title: "Order:")
                OverlayMenuItem.picker(items: OrderMode.allCases.map{$0.uiString},
                                       pickerItemIndex: $menuValues.orderModeIndex) {
                    UD.standardSet(menuValues.orderModeIndex,
                                   forKey: .clanCurrentWarPlayersOrderModeIndex)
                    menuValues.orderMode = .find()
                    
                    sortAndOrderPlayers()
                }
            }
        }
        
        private func sortAndOrderPlayers() {
            let orderFunction = menuValues.orderMode.getOrderFunction()
            
            for idx in datas.clanCurrentWar.clans.indices {
                datas.clanCurrentWar.clans[idx].participants.sort {
                    let sortKeyPath = menuValues.sortMode.keyPathForSorting
                    return orderFunction($0[keyPath: sortKeyPath], $1[keyPath: sortKeyPath])
                }
            }
        }
    }
}
