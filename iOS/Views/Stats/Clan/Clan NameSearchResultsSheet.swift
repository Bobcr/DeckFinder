import SwiftUI

extension ClanBaseView.NameSearchMenu {
    struct NameSearchResultsSheet: View {
        
        @EnvironmentObject var datas: EnvObjs.Datas
        @EnvironmentObject var appearance: EnvObjs.Appearance
        @Environment(\.presentationMode) var presentationMode
        @Environment(\.openURL) var openURL
        
        var capsule: some View = Capsule()
            .customFrame(width: 32, height: 9)
            .customPadding(t: 12, b: 2)
            .foregroundColor(.custom(.gray()))
        
        var body: some View {
            BGStack {
                VStack(spacing: 0) {
                    capsule
                    
                    Divider()
                        .customPadding(.top, 3)
                    
                    CustomScrollView {
                        let items = datas.clanNameSearch.items
                        
                        CustomGrid.init(allItemsCount: items.count, columns: 1) { idx in
                            
                            let item = items[idx]
                            
                            HStack(spacing: 0) {
                                Image(item.badgeName)
                                    .resizable()
                                    .scaledToFit()
                                    .customPadding(.vertical, 2)
                                    .customPadding(.leading, 3)
                                
                                VStack(alignment: .leading, spacing: 0) {
                                    Text(item.name)
                                        .customFont(size: 20)
                                        .foregroundColor(.custom(.black()))
                                    
                                    HStack(spacing: 0) {
                                        Text(item.donationsPerWeek)
                                            .customFont(size: 18, weight: .medium)
                                            .foregroundColor(.custom(.secondary()))
                                        
                                        Image("donation")
                                            .resizable()
                                            .scaledToFit()
                                            .customFrame(height: 21)
                                            .customPadding(.leading, 1)
                                    }
                                }
                                .customPadding(t: 2, l: 4, b: 2, tr: 4)
                                .lineLimit(1)
                                .minimumScaleFactor(0.5)
                                .customPadding(.trailing, 3)
                                
                                Spacer(minLength: 0)
                                
                                Divider()
                                
                                VStack(alignment: .trailing, spacing: 0) {
                                    Text("\(item.members)/50")
                                        .customFont(size: 18, weight: .medium)
                                        .foregroundColor(.custom(.black()))
                                    
                                    Text(item.type)
                                        .customFont(size: 18, weight: .medium)
                                        .foregroundColor(.custom(.black()))
                                }
                                .customPadding(.horizontal, 3)
                                
                                Divider()
                                
                                VStack(alignment: .trailing, spacing: 0) {
                                    HStack(spacing: 0) {
                                        Text("\(item.clanScore)")
                                            .customFont(size: 18, weight: .medium)
                                            .customPadding(.trailing, 1)
                                            .foregroundColor(.custom(.black()))
                                        
                                        Text("🏆")
                                            .customFont(size: 16, weight: .medium)
                                            .customPadding(.trailing, -1)
                                    }
                                    
                                    HStack(spacing: 0) {
                                        Text("\(item.clanWarTrophies)")
                                            .customFont(size: 18, weight: .medium)
                                            .customPadding(.trailing, 1)
                                            .foregroundColor(.custom(.black()))
                                        
                                        Image("purple-cup")
                                            .resizable()
                                            .scaledToFit()
                                            .customFrame(height: 22)
                                            .customPadding(l: 1)
                                    }
                                }
                                .customPadding(.horizontal, 3)
                            }
                            .customFrame(height: 55)
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
            }
        }
        
        @ViewBuilder
        private func makeContextMenu(idx: Int) -> some View {
            
            let item = datas.clanNameSearch.items[idx]
            
            let clanTag = item.tag
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
            
            Divider()
            
            Button("Result number \(idx+1)") { }
            Button(item.location.name) { }
            Button("Donations: \(item.donationsPerWeek)") { }
        }
    }
}
