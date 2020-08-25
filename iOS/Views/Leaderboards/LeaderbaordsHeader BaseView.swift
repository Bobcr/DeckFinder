import SwiftUI

extension LeaderboardsBaseView {
    @ViewBuilder
    func makeHeader() -> some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Spacer(minLength: 0)
                
                Text("\(leaderboardModeTitleMaker()) ⚙︎")
                    //                .sameHeightAs(text: "Players", withFont: .custom(size: 34))
                    .customFont(size: 32)
                    .customPadding(t: 4, l: 6, b: 4, tr: 6)
                    .foregroundColor(.custom(.white()))
                    .lineLimit(1)
                    .minimumScaleFactor(0.1)
                    .frame(width: screen.width)
                
                Spacer(minLength: 0)
            }
            .background(Color.custom(.gray()))
            .frame(width: screen.width)
            .menu {
                let leaderboardModes = Mode.allCases
                
                ForEach(leaderboardModes, id: \.self) { mode in
                    Button(action: { changeModeButtonAction(for: mode) }) {
                        Text(mode.userReadable)
                        Spacer()
                        Image(mode.representativeImage)
                    }
                }
            }
            
            Button("Search!", action: searchButtonAction)
                .customFont(size: 28, design: .monospaced)
                .customPadding(t: 3, l: 6, b: 3, tr: 6)
                .background(Color.custom(.gray(id: .c6)))
                .foregroundColor(.custom(.blue()))
                .customCornerRadius(8)
                .customPadding(t: 5, b: 1)
                .shadow(color: .custom(.blackShadow(), opacity: 0.2), radius: 4, x: 0, y: 0)
                .customPadding(.top, 3)
        }
    }
    
    
    private func leaderboardModeTitleMaker() -> String {
        switch leaderboardMode {
        case .players, .clans, .warClans:
            return "\(leaderboardMode.userReadable): \(region.value.name)"
        default:
            return leaderboardMode.userReadable
        }
    }
    
    
    func searchButtonAction() {
        switch leaderboardMode {
        case .players:
            Requests.PlayerLeaderboard(datas: $datas,
                                       appearance: $appearance,
                                       region: region)
                .request{_ in print(datas.playerLeaderbaord) }
        case .clans, .warClans:
            Requests.ClanLeaderboard(datas: $datas,
                                     appearance: $appearance,
                                     region: region,
                                     for: leaderboardMode == .clans ? .clans : .warClans)
                .request{_ in print(datas.clanLeaderboard) }
        case .globalTourney:
            Requests.GTInfo(datas: $datas, appearance: $appearance)
                .request(showsAlerts: false) { _ in
                    searchForGTLeaderboard()
                }
            
        default:
            Requests.RALeaderboards(datas: $datas,
                                    appearance: $appearance,
                                    mode: leaderboardMode)
                .request{_ in }
        }
    }
    
    private func searchForGTLeaderboard() {
        
        guard let tag = datas.gtInfo.items.first?.tag else {
            appearance.alert = .init(title: "Fail",
                                     message: "Failed to get the global tournament leaderboard. There should be a global tournament in progress in game so it can be shown here.")
            
            appearance.progressViewPresentation = false
            return
        }
        
        if datas.gtInfo.items.first?.startTime != "",
           let startTime = datas.gtInfo.items.first?.startTime,
           let startDate = Funcs.convertAPITimeToDate(dateString: startTime) {
            
            let playerTag = UD.sharedValue(forKey: .playerTag) as? String
            let gcWins = UD.standardValue(forKey: .grandChallengeAverageWins) as? Int
            let ccWins = UD.standardValue(forKey: .classicChallengeAverageWins) as? Int
            
            let allUDValuesAreValid = assertNoNil(playerTag, gcWins, ccWins)
            
            if startDate < Date() {
                Requests.GTLeaderboard(datas: $datas, appearance: $appearance, tag: tag)
                    .request(showsAlerts: allUDValuesAreValid) { _ in
                        if allUDValuesAreValid {
                            calcGTRewardsComaprison(playerTag: playerTag!)
                        }
                        appearance.progressViewPresentation = false
                    }
            }
            else {
                let timeDifferenceString = Funcs.timeDifferenceUsingAPIDate(to: startTime, emitAgo: true)
                
                appearance.progressViewPresentation = false
                appearance.alert = .init(title: "Global Tournment will start soon",
                                         message: "Global Tournament will begin in \(timeDifferenceString).")
            }
            
            if allUDValuesAreValid {
                calcGTRewardsComaprison(playerTag: playerTag!)
            }
            
        }
    }
    
    private func calcGTRewardsComaprison(playerTag: String) {
        Requests
            .PlayerProfile.init(datas: $datas, appearance: $appearance, tag: playerTag)
            .request(showsAlerts: false) { status in
                if status == .succeeded {
                    for idx in datas.gtInfo.items.indices {
                        let gtRewardsComparison = GeneralModels.GTRewardsComparer
                            .init(gtInfoData: datas.gtInfo.items[idx],
                                  player: datas.playerProfile)
                            .getResultsOfTheComparison()
                        
                        datas.gtRewardsComparison = gtRewardsComparison
                    }
                    
                    datas.playerProfile = .init()
                    datas.playerBattles = .init()
                    datas.playerChests = .init()
                }
            }
    }
    
}
