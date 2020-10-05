import SwiftUI

extension LeaderboardsBaseView.LeaderboardsContentView {
    @ViewBuilder
    func makeClansContent() -> some View {
        let items = datas.clanLeaderboard.items
        let hasMultipleLocations = Set(items.map{$0.location.name}).count > 1
        let datasClanMode: LeaderboardsBaseView.Mode =
            datas.clanLeaderboard.mode == .warClans ? .warClans : .clans
        
        if leaderboardMode == datasClanMode {
            CustomGrid(allItemsCount: items.count, columns: 1) { idx in
                
                let item = items[idx]
                
                HStack(spacing: 0) {
                    
                    Text("#\(idx+1)")
                        .customFont(size: 18)
                        .customPadding(.leading, 2)
                        .foregroundColor(.custom(.black()))
                    
                    let rankDelta = item.previousRank-(idx+1)
                    let rankDeltaInfo = rankDeltaTextAndColor(delta: rankDelta)
                    
                    Text(rankDeltaInfo.text)
                        .customFont(size: 14)
                        .customPadding(.horizontal, 2)
                        .customFrame(width: 30, id: .s2)
                        .foregroundColor(rankDeltaInfo.color)
                        .lineLimit(1)
                        .minimumScaleFactor(0.001)
                    
                    Image(item.badgeName)
                        .resizable()
                        .scaledToFit()
                        .customPadding(.vertical, 2)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text(item.name)
                            .customFont(size: 20)
                            .foregroundColor(.custom(.black()))
                        
                        Text("\(item.members)/50")
                            .customFont(size: 18, weight: .medium)
                            .foregroundColor(.custom(.secondary()))
                    }
                    .customPadding(t: 2, l: 4, b: 2, tr: 4)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    
                    Spacer(minLength: 0)
                    
                    VStack(alignment: .trailing, spacing: 0) {
                        HStack(spacing: 0) {
                            Text("\(item.clanScore)")
                                .customFont(size: 18, weight: .medium)
                                .customPadding(.trailing, 1)
                                .foregroundColor(.custom(.black()))
                            
                            if leaderboardMode == .clans {
                                Text("🏆")
                                    .customFont(size: 16, weight: .medium)
                                    .customPadding(.trailing, 2)
                            }
                            else {
                                Image("purple-cup")
                                    .resizable()
                                    .scaledToFit()
                                    .sameHeightAs(text: "🏆", withFont: .custom(size: 16, weight: .medium), add: 5)
                                    .customPadding(.trailing, 2)
                            }
                        }
                        
                        if hasMultipleLocations {
                            Text("\(item.location.name)")
                                .customFont(size: 16, weight: .medium)
                                .foregroundColor(.custom(.secondary()))
                                .customPadding(.trailing, 4)
                                .lineLimit(1)
                                .minimumScaleFactor(0.5)
                        }
                    }
                    
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
        
    }
    
    private func rankDeltaTextAndColor(delta: Int) -> (text: String, color: Color) {
        switch delta {
        case let x where x > 0: return ("+\(delta)", .custom(.green()))
        case let x where x < 0: return ("\(delta)", .custom(.red()))
        default: return ("–", .custom(.gray()))
        }
    }
    
    @ViewBuilder
    private func makeContextMenu(idx: Int) -> some View {
        
        let clanTag = datas.clanLeaderboard.items[idx].tag
        Button("Clan profile", imageSystemName: "arrowshape.turn.up.right") {
            Present.statsViewWithInstantSearch(appearance: $appearance,
                                               mode: .clans,
                                               tag: clanTag)
        }
        
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
