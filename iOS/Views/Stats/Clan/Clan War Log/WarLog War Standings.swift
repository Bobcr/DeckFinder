import SwiftUI

extension ClanBaseView.WarLogView {
    struct WarView: View {
        
        @EnvironmentObject var datas: EnvObjs.Datas
        @EnvironmentObject var appearance: EnvObjs.Appearance
        @Environment(\.openURL) var openURL
        @Environment(\.presentationMode) var presentationMode
        
        @State var participantsAreVisible = Array(repeating: false, count: 10)
        let warIndex: Int
        
        var body: some View {
            BGStack {
                CustomScrollView {
                    let items = datas.clanWarLog.items
                    
                    if items.count > self.warIndex {
                        let standings = items[self.warIndex].standings
                        
                        CustomGrid(isLazy: false,
                                   allItemsCount: standings.count, columns: 1) { idx in
                            
                            let item = standings[idx]
                            let clan = item.clan
                            
                            VStack(spacing: 0) {
                                
                                HStack(spacing: 0) {
                                    Text("#\(idx+1)")
                                        .customFont(size: 18)
                                        .customPadding(.horizontal, 2)
                                        .foregroundColor(.custom(.black()))
                                    
                                    Image(clan.badgeName)
                                        .resizable()
                                        .scaledToFit()
                                        .customPadding(.vertical, 2)
                                    
                                    VStack(alignment: .leading, spacing: 0) {
                                        Text(clan.name)
                                            .customFont(size: 20)
                                            .foregroundColor(.custom(.black()))
                                        
                                        let timeString = clan.finishTime
                                        let hasFinished = timeString != ""
                                        
                                        HStack(spacing: 0) {
                                            Text(hasFinished ? "finished" : "unfinished")
                                                .customFont(size: 18)
                                                .foregroundColor(.custom(.secondary()))
                                            
                                            if hasFinished {
                                                Image("race-flag")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .customPadding(.leading, 1)
                                                    .sameHeightAs(text: "unfinished",
                                                                  withFont: .custom(size: 20))
                                            }
                                        }
                                    }
                                    .customPadding(t: 2, l: 4, b: 2, tr: 4)
                                    .lineLimit(1)
                                    .minimumScaleFactor(0.5)
                                    
                                    Spacer(minLength: 0)
                                    
                                    VStack(alignment: .trailing, spacing: 0) {
                                        HStack(spacing: 0) {
                                            Text("\(clan.repairPoints)")
                                                .foregroundColor(.custom(.black()))
                                                .customFont(size: 18, weight: .medium)
                                            
                                            Image("repair-hammer")
                                                .resizable()
                                                .scaledToFit()
                                                .customFrame(height: 24)
                                                .customPadding(.leading, 1)
                                        }
                                        
                                        HStack(spacing: 0) {
                                            Text("\(clan.fame)")
                                                .foregroundColor(.custom(.black()))
                                                .customFont(size: 18, weight: .medium)
                                            
                                            Image("fame")
                                                .resizable()
                                                .scaledToFit()
                                                .customFrame(height: 26)
                                                .customPadding(.leading, 1)
                                        }
                                    }
                                    .customPadding(.trailing, 6)
                                    
                                    VStack(alignment: .trailing, spacing: 0) {
                                        HStack(spacing: 0) {
                                            Text("\(clan.clanScore)")
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
                                            let oldValue = participantsAreVisible[idx]
                                            participantsAreVisible = Array(repeating: false, count: 10)
                                            participantsAreVisible[idx] = oldValue
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
                        .customPadding(.top, 12)
                        .onChange(of: datas.clanProfile.tag) { _ in
                            participantsAreVisible = Array(repeating: false, count: 10)
                        }
                    }
                }
            }
            .navigationTitle("War")
            .navigationBarTitleDisplayMode(.inline)
        }
        
        @ViewBuilder
        private func makeClanContextMenu(idx: Int) -> some View {
            
            let item = datas.clanWarLog.items[self.warIndex]
            let clanTag = item.standings[idx].clan.tag
            
            Button("Clan profile", imageSystemName: "arrowshape.turn.up.right") {
                presentationMode.wrappedValue.dismiss()
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
}
