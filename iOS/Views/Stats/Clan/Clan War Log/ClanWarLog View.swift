import SwiftUI

extension ClanBaseView {
    struct WarLogView: View {
        
//        @EnvironmentObject var datas: EnvObjs.Datas
        
        var body: some View {
            Text("Clan River Race Log (War Log) will be implemented very soon. Currently clans have none/a few river races completed.")
                .customFont(size: 20)
                .customPadding(12)
                .multilineTextAlignment(.center)
                .foregroundColor(.custom(.gray()))
            
            /*
            VStack(spacing: 0) {

                let items = datas.clanWarLog.items
                CustomGrid.init(allItemsCount: items.count, rows: 1) { idx in

                    let item = items[idx]

                    HStack(spacing: 0) {

                        Text("#\(idx+1)")
                            .customFont(size: 18)
                            .customPadding(.leading, 2)
                            .foregroundColor(.custom(.black()))

//                        let rankDelta = item.previousRank-(idx+1)
//                        let rankDeltaInfo = rankDeltaTextAndColor(delta: rankDelta)
//
//                        Text(rankDeltaInfo.text)
//                            .customFont(size: 14)
//                            .customPadding(.horizontal, 2)
//                            .foregroundColor(rankDeltaInfo.color)
//                            .lineLimit(1)
//                            .minimumScaleFactor(0.001)
//                            .customFrame(width: 30)

//                        Image(item.badgeName)
//                            .resizable()
//                            .scaledToFit()
//                            .customPadding(.vertical, 2)

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
            */
        }
    }
}
