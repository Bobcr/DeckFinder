import SwiftUI

extension StatsBaseView {
    struct StatsSearchBar: View {
        
        @Binding var textFieldString: String
        @Binding var actionMenuIsVisible: Bool
        @Binding var playersOrClans: Mode
        
        @EnvironmentObject var datas: EnvObjs.Datas
        @EnvironmentObject var appearance: EnvObjs.Appearance
        
        var body: some View {
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    TextField("enter tag or name", text: $textFieldString)
                        .foregroundColor(.custom(.black(id: .c2)))
                        .customPadding(t: 3, l: 6, b: 3, tr: 6)
                        .customFont(size: 24, weight: .medium)
                        .background(Color.custom(.yellow()))
                        .customCornerRadius(8)
                        .customPadding(t: 6, l: 6, b: 2, tr: 2)
                        .lineLimit(1)
                        .minimumScaleFactor(0.7)
                    
                    Button(action: {
                        withAnimation {
                            playersOrClans = playersOrClans.toggled()
                            playersOrClans.saveToUD()
                        }
                    })
                    {
                        Image(playersOrClans == .players ? "sword" : "clan-war-tight")
                            .resizable()
                            .scaledToFit()
                            .customFrame(height: 30)
                            .customPadding(t: 3, l: 6, b: 3, tr: 6)
                            .background(Color.custom(.green()))
                            .foregroundColor(.custom(.white()))
                            .customFont(size: 24)
                            .customCornerRadius(8)
                            .customPadding(t: 6, l: 2, b: 2, tr: 2)
                    }
                    .buttonStyle(SpringButtonStyle())
                    
                    Button(action: {
                        withAnimation {
                            self.hideKeyboard()
                            actionMenuIsVisible = true
                        }
                    })
                    {
                        Text("Action!")
                            .customPadding(t: 3, l: 6, b: 3, tr: 6)
                            .background(Color.custom(.orange()))
                            .foregroundColor(.custom(.gray(id: .c6)))
                            .customFont(size: 24)
                            .customCornerRadius(8)
                            .customPadding(t: 6, l: 2, b: 2, tr: 6)
                    }
                    .buttonStyle(SpringButtonStyle())
                }
                
            }
            .onAppear {
                playersOrClans = .find()
            }
        }
    }
}

//struct StatsSearchBar_Previews: PreviewProvider {
//    static var previews: some View {
//        StatsSearchBar()
//    }
//}

extension StatsBaseView {
    func searchForStatsAction() {
        if playersOrClans == .players {
            if tagOrNamePickerIndex == 0 {
                searchForPlayerByTag()
            }
            else {
                searchForPlayerByName()
            }
        }
        else {
            if tagOrNamePickerIndex == 0 {
                searchForClanByTag()
            }
            else {
                searchForClanByName()
            }
        }
    }
    
    private func searchForPlayerByTag() {
        let dispatchGroup = DispatchGroup()
        withAnimation {
            actionMenuIsVisible = false
            appearance.progressViewPresentation = true
            datas.playerCardsStats = .init()
            datas.playerBattles = .init()
            datas.playerProfile = .init()
            datas.playerChests = .init()
        }
        
        dispatchGroup.enter()
        Requests.PlayerBattles(datas: $datas,
                               appearance: $appearance,
                               tag: textFieldString)
            .request(showsAlerts: false, managesProgressView: false) { _ in
                dispatchGroup.leave()
            }
        
        dispatchGroup.enter()
        Requests.PlayerProfile(datas: $datas,
                               appearance: $appearance,
                               tag: textFieldString)
            .request(showsAlerts: true, managesProgressView: false) { _ in
                dispatchGroup.leave()
            }
        
        dispatchGroup.enter()
        Requests.PlayerChests(datas: $datas,
                              appearance: $appearance,
                              tag: textFieldString)
            .request(showsAlerts: false, managesProgressView: false) { _ in
                dispatchGroup.leave()
            }
        
        dispatchGroup.notify(queue: .main) {
            withAnimation {
                datas.playerCardsStats = Funcs.Player
                    .calculatePlayerCardsStats(datas: datas)
                appearance.progressViewPresentation = false
            }
        }
    }
    
    private func searchForPlayerByName() {
        withAnimation {
            actionMenuIsVisible = false
            datas.playerNameSearch = .init()
        }
        
        guard textFieldString.leadingAndTrailingSpacesRemover()
                .count > 2 else {
            appearance.alert = .init(title: "Too short",
                                     message: "Enter at least 3 letters")
            return
        }
        
        Requests.PlayerNameSearch(datas: $datas,
                                  appearance: $appearance,
                                  name: textFieldString)
            .request { status in
                if status == .succeeded {
                    if datas.playerNameSearch.count != 0 {
                        playerNameSearchSheetPresentation = true
                    }
                }
            }

    }
    
    private func searchForClanByTag() {
        let dispatchGroup = DispatchGroup()
        withAnimation {
            actionMenuIsVisible = false
            appearance.progressViewPresentation = true
            datas.clanProfile = .init()
            datas.clanCurrentWar = .init()
            datas.clanWarLog = .init()
        }
        
        dispatchGroup.enter()
        Requests.ClanProfile.init(datas: $datas,
                                  appearance: $appearance,
                                  tag: textFieldString)
            .request(showsAlerts: true, managesProgressView: false) { _ in
                dispatchGroup.leave()
            }
        
        dispatchGroup.enter()
        Requests.ClanCurrentWar.init(datas: $datas,
                                  appearance: $appearance,
                                  tag: textFieldString)
            .request(showsAlerts: false, managesProgressView: false) { _ in
                dispatchGroup.leave()
            }
        
        dispatchGroup.enter()
        Requests.ClanWarLog.init(datas: $datas,
                                  appearance: $appearance,
                                  tag: textFieldString)
            .request(showsAlerts: false, managesProgressView: false) { _ in
                dispatchGroup.leave()
            }
        
        dispatchGroup.notify(queue: .main) {
            withAnimation {
                sortClanCurrentWarValues()
                sortWarLogValues()
                appearance.progressViewPresentation = false
            }
        }

    }
    
    private func searchForClanByName() {
        withAnimation {
            clanNameSearchMenuValues.menuIsVisible = true
        }
    }
    
    private func searchForStatsUsingClipboardAction() {
        let clipboard = UIPasteboard.general.string ?? ""
        if textFieldString.spaceRemover() == "" {
            Present.notificationMessage(
                appearance: $appearance,
                message: "Could not find a valid input from clipboard")
        }
        else {
            textFieldString = clipboard
            searchForStatsAction()
        }
    }
    
    private func sortClanCurrentWarValues() {
        datas.clanCurrentWar.clans.sort { $0.repairPoints > $1.repairPoints }
        datas.clanCurrentWar.clans.sort { $0.fame > $1.fame }
        datas.clanCurrentWar.clans.sort {
            let now = Date()
            return (Funcs.convertAPITimeToDate(dateString: $0.finishTime) ?? now)
             < (Funcs.convertAPITimeToDate(dateString: $1.finishTime) ?? now)
        }
        
        let orderFunction = clanCurrentWarMenuValues.orderMode.getOrderFunction()
        
        for idx in datas.clanCurrentWar.clans.indices {
            datas.clanCurrentWar.clans[idx].participants.sort {
                let sortKeyPath = clanCurrentWarMenuValues.sortMode.currentWarSortingPath
                return orderFunction($0[keyPath: sortKeyPath], $1[keyPath: sortKeyPath])
            }
        }
    }
    
    private func sortWarLogValues() {
        let orderFunction = clanCurrentWarMenuValues.orderMode.getOrderFunction()
        
        for index in datas.clanWarLog.items.indices {
            for idx in datas.clanWarLog.items[index].standings.indices {
                datas.clanWarLog.items[index].standings[idx].clan.participants
                    .sort {
                        let sortKeyPath = clanCurrentWarMenuValues.sortMode.warLogSortingPath
                        return orderFunction($0[keyPath: sortKeyPath],
                                             $1[keyPath: sortKeyPath])
                    }
            }
        }
    }
    
    func makeActionMenu(
        activationDatePath: ReferenceWritableKeyPath<EnvObjs.ZIndex, Date?>?)
    -> some View {
        OverlayMenuStack.init(isPresented: $actionMenuIsVisible,
                              activationDatePath: activationDatePath) {
            OverlayMenuItem.picker(items: ["tag search", "name search"],
                                   pickerItemIndex: $tagOrNamePickerIndex) {
                UD.standardSet(tagOrNamePickerIndex, forKey: .statsTagOrNamePickerIndex)
            }
            OverlayMenuItem.button(title: "Search using clipboard",
                                   action: searchForStatsUsingClipboardAction)
            OverlayMenuItem.button(title: "Search",
                                   action: searchForStatsAction)
        }
        .onChange(of: actionMenuIsVisible) { value in
            tagOrNamePickerIndex = UD.standardValue(forKey: .statsTagOrNamePickerIndex) as? Int ?? 0
        }
    }
    
}
