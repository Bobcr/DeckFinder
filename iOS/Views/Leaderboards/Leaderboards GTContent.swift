import SwiftUI

extension LeaderboardsBaseView.LeaderboardsContentView {
    @ViewBuilder
    func makeGTContent() -> some View {
        
        VStack(spacing: 0) {
            if datas.gtInfo.items.first?.startTime != "" &&
                datas.gtInfo.items.first?.startTime != nil {
                
                Button(action: {
                    withAnimation {
                        gtMode = gtMode == .leaderboard ? .rewardsComparison : .leaderboard
                    }
                }) {
                    HStack(spacing: 0) {
                        Spacer()
                        Text(gtMode == .leaderboard ? "Show Rewards Value" : "Show Leaderboard")
                        Spacer()
                    }
                }
                .customPadding(4)
                .background(Color.custom(.blue()))
                .foregroundColor(.custom(.white()))
                .customFont(size: 28)
                .customCornerRadius(8)
                .customPadding(t: 4, l: 10, b: 4, tr: 10)
            }
            
            switch gtMode {
            case .leaderboard: makeGTLeaderbaord()
            case .rewardsComparison: makeGTRewardsComparison()
            }
        }
    }
    
    @ViewBuilder
    private func makeGTLeaderbaord() -> some View {
        let items = datas.gtLeaderbord.items
        
        CustomGrid(allItemsCount: items.count, columns: 1) { idx in
            
            let item = items[idx]
            
            HStack(spacing: 0) {
                
                Text("#\(idx+1)")
                    .customFont(size: 18)
                    .customPadding(.leading, 2)
                    .foregroundColor(lossesColor(losses: item.losses))
                
                let rankDelta = item.previousRank-(idx+1)
                let rankDeltaInfo = rankDeltaTextAndColor(delta: rankDelta)
                
                Text(rankDeltaInfo.text)
                    .customFont(size: 14)
                    .customPadding(.horizontal, 2)
                    .foregroundColor(rankDeltaInfo.color)
                    .lineLimit(1)
                    .minimumScaleFactor(0.001)
                    .customFrame(width: 30)
                
                Image(item.clan.badgeName)
                    .resizable()
                    .scaledToFit()
                    .customPadding(.vertical, 2)
                
                VStack(alignment: .leading, spacing: 0) {
                    Text(item.name)
                        .customFont(size: 20)
                        .foregroundColor(.custom(.black()))
                    
                    Text(item.clan.name == "" ? "no clan" : item.clan.name)
                        .customFont(size: 18, weight: .medium)
                        .foregroundColor(.custom(.secondary()))
                }
                .customPadding(t: 2, l: 4, b: 2, tr: 4)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                
                Spacer(minLength: 0)
                
                Text("\(item.losses)")
                    .customFont(size: 18, weight: .medium)
                    .customPadding(.trailing, 1)
                    .foregroundColor(.custom(.black()))
                
                Image("lost-medal")
                    .resizable()
                    .scaledToFit()
                    .customFrame(height: 30)
                    .customPadding(.trailing, 4)
                
                Text("\(item.wins)")
                    .customFont(size: 18, weight: .medium)
                    .foregroundColor(.custom(.black()))
                    .customPadding(.trailing, 1)
                    .customFrame(width: 26, alignment: .trailing)
                    .lineLimit(1)
                    .minimumScaleFactor(0.1)
                
                Image("golden-medal")
                    .resizable()
                    .scaledToFit()
                    .customFrame(height: 30)
                    .customPadding(.trailing, 2)
                
            }
            .customFrame(height: 50)
            .customPadding(.horizontal, 4)
            .background(Color.custom(.white()))
            .customCornerRadius(8)
            .customPadding(t: 4, l: 10, b: 4, tr: 10)
            .shadow(color: .custom(.blackShadow(), opacity: 0.2), radius: 4, x: 0, y: 0)
            .frame(width: screen.width)
            .menu { makeContextMenu(idx: idx) }
        }
    }
    
    @ViewBuilder
    private func makeGTRewardsComparison() -> some View {
        
        if let data = datas.gtRewardsComparison,
           let _ = UD.sharedValue(forKey: .playerTag) as? String,
           let _ = UD.standardValue(forKey: .grandChallengeAverageWins) as? Int,
           let _ = UD.standardValue(forKey: .classicChallengeAverageWins) as? Int {
            
            let gemImage = Image("gem")
                .resizable()
                .scaledToFit()
                .customFrame(height: 35)
                .customPadding(l: 2, tr: 4)
            
            let titles = ["Free Rewards Vs Classic Challenge",
                          "Free Rewards Vs Grand Challenge",
                          "Free Rewards Vs Shop",
                          "Free Rewards Vs Special Offers",
                          "Paid Rewards Vs Classic Challenge",
                          "Paid Rewards Vs Grand Challenge",
                          "Paid Rewards Vs Shop",
                          "Paid Rewards Vs Special Offers"]
            
            let numbers = ["\(Int(data.freeVsCC))",
                           "\(Int(data.freeVsGC))",
                           "\(Int(data.freeVsShop))",
                           "\(Int(data.freeVsSpecialOffers))",
                           "\(Int(data.milestoneVsCC))",
                           "\(Int(data.milestoneVsGC))",
                           "\(Int(data.milestoneVsShop))",
                           "\(Int(data.milestoneVsSpecialOffers))"]
            
            VStack(spacing: 0) {
                
                VStack(spacing: 0) {
                    Text("These numbers are calculated based")
                    Text("on your own stats and capabilities")
                }
                .customPadding(t: 4, l: 6, b: 4, tr: 6)
                .background(Color.custom(.white()))
                .customCornerRadius(8)
                .customFont(size: 22, weight: .medium)
                .foregroundColor(.custom(.black()))
                .lineLimit(2)
                .customPadding(t: 8, l: 10, b: 4, tr: 10)
                .shadow(color: .custom(.blackShadow(), opacity: 0.2), radius: 4, x: 0, y: 0)
                .customFrame(width: screen.width)
                
                ForEach(titles.indices, id: \.self) { idx in
                    HStack(spacing: 0) {
                        Text(titles[idx])
                        Spacer()
                        Text(numbers[idx])
                        gemImage
                    }
                    .customFrame(height: 50)
                    .customPadding(.horizontal, 4)
                    .background(Color.custom(.white()))
                    .customCornerRadius(8)
                    .customFont(size: 18, weight: .medium)
                    .foregroundColor(.custom(idx < 4 ? .orange() : .purple()))
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .customPadding(t: 4, l: 10, b: 4, tr: 10)
                    .shadow(color: .custom(.blackShadow(), opacity: 0.2), radius: 4, x: 0, y: 0)
                    
                }
            }
        }
        else {
            Text("Set your information in in-app \nsettings to be able to see \nthe real value of GT prizes \nfor your own account!")
                .customPadding(t: 6, l: 4, b: 6, tr: 4)
                .background(Color.custom(.white()))
                .foregroundColor(.custom(.black()))
                .customCornerRadius(8)
                .customPadding(t: 18, l: 10, b: 4, tr: 10)
                .customFont(size: 22, weight: .semibold)
                .multilineTextAlignment(.center)
                .shadow(color: .custom(.blackShadow(), opacity: 0.2), radius: 4, x: 0, y: 0)
                .customFrame(width: screen.width)
        }
        
    }
    
    private func rankDeltaTextAndColor(delta: Int) -> (text: String, color: Color) {
        switch delta {
        case let x where x > 0: return ("+\(delta)", .custom(.green()))
        case let x where x < 0: return ("\(delta)", .custom(.red()))
        default: return ("–", .custom(.gray()))
        }
    }
    
    private func lossesColor(losses: Int) -> Color {
        switch losses {
        case 0: return .custom(.green())
        case 1, 2, 3, 4: return .custom(.yellow())
        default: return .custom(.red())
        }
    }
    
    @ViewBuilder
    private func makeContextMenu(idx: Int) -> some View {
        
        let tag = datas.gtLeaderbord.items[idx].tag
        
        Button("Player profile", imageSystemName: "arrowshape.turn.up.right") {
            Present.statsViewWithInstantSearch(appearance: $appearance,
                                               mode: .players,
                                               tag: tag)
        }
        
        if let playerURL = URL(string: Funcs.Player.linkStringForOpenningInGame(tag: tag)) {
            Button("Open player in game", imageSystemName: "square.and.arrow.up") {
                openURL.callAsFunction(playerURL)
            }
        }
        
        Button("Player: \(tag)", imageSystemName: "doc.on.doc") {
            UIPasteboard.general.string = tag
        }
        
        Divider()
        
        let clanTag = datas.gtLeaderbord.items[idx].clan.tag
        Button("Clan profile", imageSystemName: "arrowshape.turn.up.right") {
            Present.statsViewWithInstantSearch(appearance: $appearance,
                                               mode: .clans,
                                               tag: clanTag)
        }
        
        if clanTag != "" {
            if let clanURL = URL(string: Funcs.Clan.linkStringForOpenningInGame(tag: clanTag)) {
                Button("Open clan in game", imageSystemName: "square.and.arrow.up") {
                    openURL.callAsFunction(clanURL)
                }
            }
            
            Button("Clan: \(clanTag)", imageSystemName: "doc.on.doc") {
                UIPasteboard.general.string = clanTag
            }
        }
    }
}
