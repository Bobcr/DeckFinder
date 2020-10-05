import SwiftUI

extension LeaderboardsBaseView.LeaderboardsContentView {
    @ViewBuilder
    func makeRAAPILeaderboardsContent() -> some View {
        let rankImageName = datas.raLeaderboards.mode.rankValueImageName
        let data = datas.raLeaderboards.items
        
        if leaderboardMode == datas.raLeaderboards.mode {
            CustomGrid(allItemsCount: data.count, columns: 1) { idx in
                
                let item = data[idx]
                
                HStack(spacing: 0) {
                    
                    Text("#\(idx+1)")
                        .customFont(size: 18)
                        .customPadding(l: 2, tr: 4)
                        .foregroundColor(.custom(.black()))
                    
                    Image(item.clanBadgeName)
                        .resizable()
                        .scaledToFit()
                        .customPadding(.vertical, 2)
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text(item.name)
                            .customFont(size: 20)
                            .foregroundColor(.custom(.black()))
                        
                        Text(item.clanName == "" ? "no clan" : item.clanName)
                            .customFont(size: 18, weight: .medium)
                            .foregroundColor(.custom(.secondary()))
                    }
                    .customPadding(t: 2, l: 4, b: 2, tr: 4)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    
                    Spacer(minLength: 0)
                    
                    Text("\(item.rankValue)")
                        .customFont(size: 18, weight: .medium)
                        .customPadding(.trailing, 2)
                        .fixedSize(.horizontal)
                        .foregroundColor(.custom(.black()))
                    
                    Image(rankImageName)
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
    }
    
    @ViewBuilder
    private func makeContextMenu(idx: Int) -> some View {
        
        let tag = datas.raLeaderboards.items[idx].tag
        
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
        
        let clanTag = datas.raLeaderboards.items[idx].clanTag
        if clanTag != "" {
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
}
