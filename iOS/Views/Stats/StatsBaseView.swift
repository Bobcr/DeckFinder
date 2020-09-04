import SwiftUI

struct StatsBaseView: View {
    
    @State var actionMenuIsVisible = false
    @State var playerNameSearchSheetPresentation = false
    
    @State var addDeckMenuIsVisible = false
    @State var addDeckMenuDeckCards = [String]()
    
    @ObservedObject var cardsSettingsMenuValues = OverlayMenuDatas.CardsSettingsMenu()
    @ObservedObject var clanNameSearchMenuValues = OverlayMenuDatas.ClanSearchMenu()
    @ObservedObject var clanCurrentWarMenuValues = OverlayMenuDatas.ClanCurrentWarSortMenu()
    
    @State var tagOrNamePickerIndex = UD.standardValue(forKey: .statsTagOrNamePickerIndex) as? Int ?? 0
    @State var textFieldString = ""
    @State var playersOrClans: Mode = .find()
    
    @EnvironmentObject var datas: EnvObjs.Datas
    @EnvironmentObject var appearance: EnvObjs.Appearance
    @ObservedObject var zIndex = EnvObjs.ZIndex()
    
    var body: some View {
        NavigationView {
            BGStack {
                CustomScrollView {
                    StatsSearchBar(textFieldString: $textFieldString,
                                   actionMenuIsVisible: $actionMenuIsVisible,
                                   playersOrClans: $playersOrClans)
                    
                    switch playersOrClans {
                    case .players:
                        PlayerBaseView(cardsSettingsMenuValues: cardsSettingsMenuValues,
                                       addDeckMenuIsVisible: $addDeckMenuIsVisible,
                                       addDeckMenuDeckCards: $addDeckMenuDeckCards)
                    case .clans:
                        ClanBaseView(nameSearchMenuValues: clanNameSearchMenuValues,
                                     currentWarSortMenuValues: clanCurrentWarMenuValues)
                    }
                }
                .overlay ( ZStack {
                    makeActionMenu(activationDatePath: \.first)
                        .sheet(isPresented: $playerNameSearchSheetPresentation) {
                            PlayerBaseView.NameSearchView()
                                .environmentObject(datas)
                                .environmentObject(appearance)
                        }
                        .zIndex(Double(zIndex.first?.timeIntervalSince1970 ?? 0))
                    
                    DeckWalletBaseView.CreateDeckView
                        .ActionMenuView(selfIsVisible: $addDeckMenuIsVisible,
                                        deckCards: $addDeckMenuDeckCards,
                                        activationDatePath: \.second)
                        .zIndex(Double(zIndex.second?.timeIntervalSince1970 ?? 0))
                    
                    PlayerBaseView.CardsView
                        .CardsSettingsMenuView(menuValues: cardsSettingsMenuValues,
                                               activationDatePath: \.third)
                        .zIndex(Double(zIndex.third?.timeIntervalSince1970 ?? 0))
                    
                    ClanBaseView.NameSearchMenu(menuValues: clanNameSearchMenuValues,
                                                textFieldString: $textFieldString,
                                                actionMenuIsVisible: $actionMenuIsVisible,
                                                activationDatePath: \.fourth)
                        .zIndex(Double(zIndex.fourth?.timeIntervalSince1970 ?? 0))
                    
                    ClanBaseView.CurrentWarView.SortMenu(menuValues: clanCurrentWarMenuValues,
                                                         activationDatePath: \.fifth)
                        .zIndex(Double(zIndex.fifth?.timeIntervalSince1970 ?? 0))
                })
            }
            .environmentObject(zIndex)
            .navigationTitle(navigationTitle())
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: onAppearAction)
            .onReceive(appearance.$statsInstantSearch) { output in
                if let output = output {
                    instantSearch(for: output)
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private func onAppearAction() {
        tagOrNamePickerIndex = UD.standardValue(forKey: .statsTagOrNamePickerIndex) as? Int ?? 0
    }
    
    private func instantSearch(for searchInput: (mode: Mode, tag: String)) {
        Funcs.after(seconds: 0.25) {
            playersOrClans = searchInput.mode
            playersOrClans.saveToUD()
            tagOrNamePickerIndex = 0
            textFieldString = searchInput.tag
            
            appearance.statsInstantSearch = nil
            searchForStatsAction()
        }
    }
    
    private func navigationTitle() -> String {
        if playersOrClans == .players {
            let playerName = datas.playerProfile.name
            return playerName == "" ? "Player Stats" : playerName
        }
        else {
            let clanName = datas.clanProfile.name
            return clanName == "" ? "Clan Stats" : clanName
        }
    }
    
}

extension StatsBaseView {
    enum Mode: String {
        case players = "Players"
        case clans = "Clans"
        
        static func find(by string: String
                            = (UD.standardValue(forKey: .statsPlayersOrClansSearch)
                                as? String ?? "Players")) -> Self {
            switch string {
            case "Players": return .players
            default: return .clans
            }
        }
        
        func saveToUD() {
            UD.standardSet(self.rawValue, forKey: .statsPlayersOrClansSearch)
        }
        
        func toggled() -> Self {
            switch self {
            case .players: return .clans
            case .clans: return .players
            }
        }
    }
}

//struct PlayerBaseView_Previews: PreviewProvider {
//    static var previews: some View {
//        StatsBaseView()
//    }
//}

