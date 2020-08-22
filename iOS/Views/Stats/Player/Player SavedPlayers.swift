import SwiftUI

extension PlayerBaseView {
    struct SavedPlayersView: View {
        
        typealias SearchedPlayers = GeneralModels.Players.SearchedPlayers
        @State var savedPlayersData: [SearchedPlayers] = SearchedPlayers.getAll().reversed()
        
        @EnvironmentObject var appearance: EnvObjs.Appearance
        @Environment(\.presentationMode) var presentaionMode
        @Environment(\.openURL) var openURL
        
        var capsule: some View = Capsule()
            .customFrame(width: 32, height: 9)
            .customPadding(t: 12, b: 2)
            .foregroundColor(.custom(.gray()))
        
        var body: some View {
            BGStack(frameWidth: nil)  {
                let count = savedPlayersData.count
                if count > 0 {
                    ScrollView {
                        capsule
                        
                        CustomGrid.init(allItemsCount: count,
                                        columns: 1) { idx in
                            
                            let item = savedPlayersData[idx]
                            
                            HStack(spacing: 0) {
                                
                                Text("#\(count-idx)")
                                    .customFont(size: 18)
                                    .customPadding(l: 2, tr: 3)
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
                                
                                VStack(spacing: 0) {
                                    Text("search count")
                                        .customFont(size: 16, weight: .medium)
                                        .customPadding(t: 1, b: 1, tr: 3)
                                    
                                    Text(item.searchCount)
                                        .customFont(size: 16, weight: .medium)
                                        .customPadding(t: 1, b: 1, tr: 3)
                                }
                                .foregroundColor(.custom(.black()))
                                
                            }
                            .customFrame(height: 50)
                            .customPadding(.horizontal, 4)
                            .background(Color.custom(.white()))
                            .customCornerRadius(8)
                            .customPadding(t: 4, l: 10, b: 4, tr: 10)
                            .shadow(color: .custom(.blackShadow(), opacity: 0.2), radius: 4, x: 0, y: 0)
                            .contextMenu { makeContextMenu(idx: idx) }
                            .simultaneousGesture(
                                TapGesture()
                                    .onEnded { _ in
                                        appearance.statsInstantSearch = (mode: .players, tag: savedPlayersData[idx].tag)
                                        presentaionMode.wrappedValue.dismiss()
                                    })
                        }
                    }
                }
                else {
                    VStack(spacing: 0) {
                        capsule
                        
                        Text("Recently searched players\n will be shown here")
                            .customFont(size: 24)
                            .multilineTextAlignment(.center)
                            .customPadding(6)
                            .background(Color.custom(.white()))
                            .customCornerRadius(8)
                            .customPadding(t: 10, l: 10, b: 4, tr: 10)
                            .shadow(color: .custom(.blackShadow(), opacity: 0.2), radius: 4, x: 0, y: 0)
                            
                        
                        Spacer()
                    }
                }
            }
            .onAppear {
                savedPlayersData = SearchedPlayers.getAll().reversed()
            }
        }
        
        @ViewBuilder
        private func makeContextMenu(idx: Int) -> some View {
            
            let tag = savedPlayersData[idx].tag
            
            if let playerURL = URL(string: Funcs.Player.linkStringForOpenningInGame(tag: tag)) {
                Button("Open player in game", imageSystemName: "square.and.arrow.up") {
                    openURL.callAsFunction(playerURL)
                }
            }
            
            Button("Player: \(tag)", imageSystemName: "doc.on.doc") {
                UIPasteboard.general.string = tag
            }
            
            let clanTag = savedPlayersData[idx].clanTag
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
            
            Button("Delete from list", imageSystemName: "trash") {
                withAnimation {
                    savedPlayersData[idx].delete()
                    savedPlayersData = SearchedPlayers.getAll()
                }
            }
        }
        
    }
}
