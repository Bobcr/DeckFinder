import SwiftUI

extension ClanBaseView.CurrentWarView {
    @ViewBuilder
    func makeStandings() -> some View {
        let items = datas.clanCurrentWar.clans
        
        CustomGrid(allItemsCount: items.count, columns: 1) { idx in
            
            let item = items[idx]
            
            VStack(spacing: 0) {
                
                    HStack(spacing: 0) {
                        Text("#\(idx+1)")
                            .customFont(size: 18)
                            .customPadding(.horizontal, 2)
                            .foregroundColor(.custom(.black()))
                        
                        Image(item.badgeName)
                            .resizable()
                            .scaledToFit()
                            .customPadding(.vertical, 2)
                        
                        VStack(alignment: .leading, spacing: 0) {
                            Text(item.name)
                                .customFont(size: 20)
                                .foregroundColor(.custom(.black()))
                            
                            let timeString = item.finishTime
                            let finishTime = timeString == "" ? nil
                                : Funcs.timeDifferenceUsingAPIDate(to: timeString)
                            
                            Text(finishTime ?? "unfinished")
                                .customFont(size: 18)
                                .foregroundColor(.custom(.secondary()))
                        }
                        .customPadding(t: 2, l: 4, b: 2, tr: 4)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                        
                        Spacer(minLength: 0)
                        
                        VStack(alignment: .trailing, spacing: 0) {
                            HStack(spacing: 0) {
                                Text("\(item.repairPoints)")
                                    .foregroundColor(.custom(.black()))
                                    .customFont(size: 18, weight: .medium)
                                
                                Image("repair-hammer")
                                    .resizable()
                                    .scaledToFit()
                                    .customFrame(height: 24)
                                    .customPadding(.leading, 1)
                            }
                            
                            HStack(spacing: 0) {
                                Text("\(item.fame)")
                                    .foregroundColor(.custom(.black()))
                                    .customFont(size: 18, weight: .medium)
                                
                                Image("fame")
                                    .resizable()
                                    .scaledToFit()
                                    .customFrame(height: 26)
                                    .customPadding(.leading, 1)
                            }
                        }
                        .customPadding(.trailing, 4)
                        
                        VStack(alignment: .trailing, spacing: 0) {
                            HStack(spacing: 0) {
                                Text("\(item.clanScore)")
                                    .customFont(size: 18, weight: .medium)
                                    .customPadding(.trailing, 1)
                                    .foregroundColor(.custom(.black()))
                                
                                Image("purple-cup")
                                    .resizable()
                                    .scaledToFit()
                                    .sameHeightAs(text: "🏆", withFont: .custom(size: 16, weight: .medium), add: 5)
                                    .customPadding(.trailing, 2)
                            }
                        }
                    }
                    .customPadding(t: 2, l: 4, b: 2, tr: 4)
                    .customFrame(height: 60)
                    .frame(width: screen.width - 20)
                    .menu { makeClanContextMenu(idx: idx) }
                    
                Image(systemName: "arrowtriangle.down.square")
                    .resizable()
                    .scaledToFit()
                    .rotationEffect(participantsAreVisible[idx] ? .degrees(180) : .degrees(0))
                    .customFrame(height: 26)
                    .customPadding(.vertical, 4)
                    .foregroundColor(.custom(.white()))
                    .frame(maxWidth: .infinity)
                    .background(Color.custom(.blue()))
                    .customFrame(height: 40)
                    .customPadding(.bottom, -4)
                    .onTapGesture {
                        withAnimation {
                            participantsAreVisible[idx].toggle()
                        }
                    }
                
                if participantsAreVisible[idx] {
                    makePlayers(idx: idx)
                }
            }
            .background(Color.custom(.white()))
            .customCornerRadius(8)
            .customPadding(t: 4, l: 10, b: 4, tr: 10)
            .shadow(color: .custom(.blackShadow(), opacity: 0.2), radius: 4, x: 0, y: 0)
        }
    }
    
    @ViewBuilder
    private func makeClanContextMenu(idx: Int) -> some View {
        
        let clanTag = datas.clanCurrentWar.clans[idx].tag
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
