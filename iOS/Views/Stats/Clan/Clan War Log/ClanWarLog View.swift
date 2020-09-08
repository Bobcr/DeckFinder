import SwiftUI

/*
 i think clan finish time is wrong on the api side,
 keeping this for when its not wrong
 
 let firstDateString = logItem.createdDate
 let firstDate = Funcs.convertAPITimeToDate(dateString: firstDateString)
 let time = Funcs.timeDifferenceUsingAPIDate(from: firstDate ?? Date(),
                                             to: item.clan.finishTime)
 Text(time)
     .customFont(size: 18, weight: .medium)
     .foregroundColor(.custom(.secondary()))
 */

extension ClanBaseView {
    struct WarLogView: View {
        
        @EnvironmentObject var datas: EnvObjs.Datas
        
        @State var warIndex: Int = 0
        @State var navigationLinkTriggerer: Bool?
        
        var body: some View {
            NavigationLink(destination: WarView(warIndex: warIndex),
                           tag: true,
                           selection: $navigationLinkTriggerer) {
                EmptyView()
            }
            
            let items = datas.clanWarLog.items
            CustomGrid(allItemsCount: items.count, rows: 1) { idx in
                
                let currentClanTag = datas.clanProfile.tag
                let logItem = items[idx]
                let item = logItem.standings.first { $0.clan.tag == currentClanTag }
                
                if let item = item {
                    Button(action: {
                        warIndex = idx
                        navigationLinkTriggerer = true
                    })
                    {
                        HStack(spacing: 0) {
                            VStack(spacing: 0) {
                                let rank = item.rank
                                Text(rank == 0 ? "Unranked" : "#\(rank)")
                                    .customFont(size: 20)
                                    .foregroundColor(rankColor(rank: rank))
                                
                                Text("Season \(logItem.seasonId)")
                                    .customFont(size: 18)
                                    .customPadding(.leading, 2)
                                    .foregroundColor(.custom(.teal()))
                            }
                            
                            Spacer(minLength: 0)
                            
                            VStack(spacing: 0) {
                                HStack(spacing: 0) {
                                    Text("\(item.clan.repairPoints)")
                                        .foregroundColor(.custom(.black()))
                                        .customFont(size: 18, weight: .medium)
                                    
                                    Image("repair-hammer")
                                        .resizable()
                                        .scaledToFit()
                                        .customFrame(height: 24)
                                        .customPadding(.leading, 1)
                                }
                                
                                HStack(spacing: 0) {
                                    Text("\(item.clan.fame)")
                                        .foregroundColor(.custom(.black()))
                                        .customFont(size: 18, weight: .medium)
                                    
                                    Image("fame")
                                        .resizable()
                                        .scaledToFit()
                                        .customFrame(height: 26)
                                        .customPadding(.leading, 1)
                                }
                            }
                            
                            Spacer(minLength: 0)
                            
                            VStack(spacing: 0) {
                                HStack(spacing: 0) {
                                    Text(item.clan.clanScore)
                                        .customFont(size: 18, weight: .medium)
                                        .customPadding(.trailing, 1)
                                        .foregroundColor(.custom(.black()))
                                    
                                    Image("purple-cup")
                                        .resizable()
                                        .scaledToFit()
                                        .sameHeightAs(text: "🏆",
                                                      withFont: .custom(size: 16, weight: .medium),
                                                      add: 5)
                                        .customPadding(.trailing, 2)
                                }
                                
                                let trophyChange = item.trophyChange
                                let positiveChange = trophyChange.absoluteDistance(to: 0)
                                let isNegative = trophyChange < 0
                                Text(isNegative ? "-\(positiveChange)" : "+\(positiveChange)")
                                    .customFont(size: 15, weight: .medium)
                                    .customPadding(.trailing, 2)
                                    .foregroundColor(rankColor(rank: item.rank))
                            }
                            
                        }
                        .customFrame(height: 50)
                        .customPadding(.horizontal, 4)
                        .background(Color.custom(.white()))
                        .customCornerRadius(8)
                        .customPadding(t: 4, l: 10, b: 4, tr: 10)
                        .shadow(color: .custom(.blackShadow(), opacity: 0.2),
                                radius: 4, x: 0, y: 0)
                        .frame(width: screen.width)
                    }
                    .buttonStyle(SpringButtonStyle())
                }
            }
        }
        
        private func rankColor(rank: Int) -> Color {
            switch rank {
            case 0: return .custom(.purple())
            case 1, 2: return .custom(.green())
            case 3: return .custom(.gray())
            default: return .custom(.red())
            }
        }
    }
}
