import SwiftUI

extension PlayerBaseView.StatsView {
    @ViewBuilder
    func makeBasicInfo() -> some View {
        let profile = datas.playerProfile
        
        HStack(spacing: 0) {
            Spacer(minLength: 0)
            
            Image(profile.clan.badgeName)
                .resizable()
                .scaledToFit()
                .customFrame(height: 65)
                .customPadding(t: 2, l: 4, b: 2, tr: 4)
            
            VStack(spacing: 0) {
                Spacer(minLength: 0)
                
                Text(profile.name)
                    .customFont(size: 18, weight: .bold)
                    .foregroundColor(.custom(.black()))
                
                Spacer(minLength: 0)
                
                Text(profile.clan.name)
                    .customFont(size: 17)
                    .foregroundColor(.custom(.gray()))
                
                Spacer(minLength: 0)
                
                if profile.role != "" {
                    Text(profile.role)
                        .customFont(size: 15)
                        .foregroundColor(.custom(.gray()))
                    
                    Spacer(minLength: 0)
                }
            }
            .customFrame(height: 65)
            
            Spacer(minLength: 0)
            
            let trophies = profile.leagueStatistics.currentSeason.trophies
            let rank = profile.leagueStatistics.currentSeason.rank
            
            Image(Funcs.Player.arenaImageName(trophies: trophies))
                .resizable()
                .scaledToFit()
                .customFrame(height: 65)
                .customPadding(t: 2, l: 4, b: 2, tr: 4)
                .overlay(
                    Text(trophies.removeGroupingSeparator())
                        .customFont(size: 15, weight: .heavy)
                        .foregroundColor(.white)
                        .lineLimit(1)
                        .minimumScaleFactor(0.1)
                        .shadow(color: .black, radius: 2)
                        .offset(y: .custom(-10))
                        .customPadding(.horizontal, 2.5)
                    , alignment: .bottom
                )
                .overlay(
                    Text(rank != 0 ? "#\(rank.removeGroupingSeparator())" : "")
                        .customFont(size: 15, weight: .heavy)
                        .foregroundColor(.white)
                        .lineLimit(1)
                        .minimumScaleFactor(0.1)
                        .shadow(color: .custom(.blackShadow()), radius: 1.5)
                        .offset(y: .custom(+10))
                        .customPadding(.horizontal, 2.5)
                    , alignment: .top
                )
            
            Spacer(minLength: 0)
        }
        .customPadding(t: 4, l: 3, b: 4, tr: 3)
        .background(Color.custom(.white()))
        .customCornerRadius(8)
        .customPadding(t: 5, l: 8, b: 5, tr: 8)
        .shadow(color: .custom(.blackShadow(), opacity: 0.2), radius: 2)
        .frame(width: screen.width)
        .menu {
            let clanTag = datas.playerProfile.clan.tag
            if clanTag != "" {
                Button("Clan profile", imageSystemName: "arrowshape.turn.up.right") {
                    Present.statsViewWithInstantSearch(appearance: $appearance,
                                                       mode: .clans,
                                                       tag: clanTag)
                }
                
                if let playerURL = URL(string: Funcs.Clan.linkStringForOpenningInGame(tag: clanTag)) {
                    Button("Open clan in game", imageSystemName: "square.and.arrow.up") {
                        openURL.callAsFunction(playerURL)
                    }
                }
                
                Button("Clan: \(clanTag)", imageSystemName: "doc.on.doc") {
                    UIPasteboard.general.string = clanTag
                }
            }
            
            Divider()
            
            Button("export Cards as Image", imageSystemName: "square.and.arrow.up") {
                
                // to make image's ratio reseaonable
                let cardsViewColumns = Int(pow(Double(datas.playerProfile.cards.count), 1/2).rounded(.up))
                let cardsView = PlayerBaseView.CardsView
                    .init(settingsMenuValues: .init(fixedColumns: cardsViewColumns))
                    .fixedSize(horizontal: false, vertical: true)
                    .environmentObject(datas)
                    .environmentObject(appearance)
                
                let image = cardsView.asImage()
                appearance.shareSheetItems = [.init(name: "\(datas.playerProfile.name) Cards", image: image)]
                appearance.shareSheetPresentation = true
            }
            
            Button("export Stats as Image", imageSystemName: "square.and.arrow.up") {
                
                let statsView = PlayerBaseView.StatsView(addDeckMenuIsVisible: .constant(false),
                                                         addDeckMenuDeckCards: .constant([]),
                                                         renderForSharingAsImage: true)
                    .environmentObject(datas)
                    .environmentObject(appearance)
                
                let image = statsView.asImage()
                appearance.shareSheetItems = [.init(name: "\(datas.playerProfile.name) Stats", image: image)]
                appearance.shareSheetPresentation = true
            }
            
            //            Button("export Battles as images", imageSystemName: "square.and.arrow.up") {
            //
            //                var views: [AnyView] = []
            //                let partsCount = Int(Double(datas.playerBattles.count/5).rounded(.up))
            //                if partsCount > 0 {
            //                    for partNumber in 1...partsCount {
            //                        let isPossibleToChunk = (5 * (partNumber - 1)) > datas.playerBattles.count
            //                        if isPossibleToChunk {
            //                            let battlesView = PlayerBaseView.BattlesView(addDeckMenuIsVisible: .constant(false),
            //                                                                         addDeckMenuDeckCards: .constant([]),
            //                                                                         onlyShowBattles: (chunkSize: 5,
            //                                                                                           part: partNumber))
            //                                .environmentObject(datas)
            //                                .environmentObject(appearance)
            //
            //                            views.append(.init(battlesView))
            //                        }
            //                    }
            //                }
            //
            //                var items: [ItemDetailSource] {
            //                    views.enumerated().map { idx, battleView in
            //                        let image = battleView.asImage()
            //                        let name = "\(datas.playerProfile.name) Battles part \(idx)"
            //                        return .init(name: name, image: image)
            //                    }
            //                }
            //                appearance.shareSheetItems = items
            //                appearance.shareSheetPresentation = true
            //            }
        }
    }
}
