import SwiftUI

extension ClanBaseView {
    struct WarSortMenu: View {
        
        @EnvironmentObject var datas: EnvObjs.Datas
        @EnvironmentObject var menuValues: OverlayMenuDatas.ClanCurrentWarSortMenu
        
        var activationDatePath: ReferenceWritableKeyPath<EnvObjs.ZIndex, Date?>? = nil
        
        var body: some View {
            OverlayMenuStack.init(isPresented: $menuValues.menuIsVisible,
                                  activationDatePath: activationDatePath)
            {
                OverlayMenuItem.text(title: "Sort by:")
                OverlayMenuItem.picker(items: WarSortMode.allCases.map{$0.uiString},
                                       pickerItemIndex: $menuValues.sortModeIndex) {
                    UD.standardSet(menuValues.sortModeIndex,
                                   forKey: .clanCurrentWarPlayersSortModeIndex)
                    menuValues.sortMode = .find()
                    
                    sortAndOrderPlayers()
                }
                
                OverlayMenuItem.text(title: "Order:")
                OverlayMenuItem.picker(items: WarOrderMode.allCases.map{$0.uiString},
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
                    let sortKeyPath = menuValues.sortMode.currentWarSortingPath
                    return orderFunction($0[keyPath: sortKeyPath], $1[keyPath: sortKeyPath])
                }
            }
            
            for index in datas.clanWarLog.items.indices {
                for idx in datas.clanWarLog.items[index].standings.indices {
                    datas.clanWarLog.items[index].standings[idx].clan.participants
                        .sort {
                            let sortKeyPath = menuValues.sortMode.warLogSortingPath
                            return orderFunction($0[keyPath: sortKeyPath],
                                                 $1[keyPath: sortKeyPath])
                        }
                }
            }
        }
        
    }
}
