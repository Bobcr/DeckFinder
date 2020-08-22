import SwiftUI


extension PlayerBaseView.BattlesView {
    @ViewBuilder
    func makeBattler(idx: Int, ind: Int, battler: BattlerType) -> some View {
        let battlerData: OAPI.Models.PlayerBattle.Battler = {
            if battler == .team {
                return datas.playerBattles[idx].team[ind]
            }
            else {
                return datas.playerBattles[idx].opponent[ind]
            }
        }()
        
        let cards = battlerData.cards
        
        VStack(spacing: 0) {
            makeBattlerHeader(battlerData: battlerData, for: battler)
            
            makeDeck(cards: cards)
        }
    }
    
    @ViewBuilder
    private func makeBattlerHeader(battlerData: OAPI.Models.PlayerBattle.Battler,
                                   for battlerType: BattlerType) -> some View {
        
        if battlerType == .team {
            HStack(spacing: 0) {
                makeBattlerTeamHeader(battlerData: battlerData)
                    .customPadding(t: 2, l: 3, b: 0, tr: 3, id: .s2)
                    .frame(width: screen.width/2 - CGFloat.custom(10, id: .s4)) // bad menus
                    .menu { playerContextMenu(battler: battlerData) }
            }
        }
        else {
            HStack(spacing: 0) {
                makeBattlerOpponentHeader(battlerData: battlerData)
                    .customPadding(t: 2, l: 3, b: 0, tr: 3, id: .s2)
                    .frame(width: screen.width/2 - CGFloat.custom(10, id: .s4)) // bad menus
                    .menu { playerContextMenu(battler: battlerData) }
            }
        }
    }
    
    @ViewBuilder
    private func makeBattlerTeamHeader(battlerData: OAPI.Models.PlayerBattle.Battler) -> some View {
        let clan = battlerData.clan
        
        HStack(spacing: 0) {
            Image(clan.badgeName)
                .resizable()
                .customFrame(width: 45, height: 45 * (151/127), id: .s2)
            
            VStack(alignment: .leading, spacing: 0) {
                Text(battlerData.name)
                    .customFont(size: 17, id: .s2)
                    .foregroundColor(.custom(.black()))
                    .lineLimit(1)
                    .minimumScaleFactor(0.1)
                
                Text(clan.name)
                    .customFont(size: 16, weight: .medium, id: .s2)
                    .foregroundColor(.custom(.secondary()))
                    .lineLimit(1)
                    .minimumScaleFactor(0.1)
            }
            .customPadding(t: 2, l: 4, b: 2, tr: 4, id: .s2)
            .lineLimit(1)
            .minimumScaleFactor(0.5)
            
            Spacer(minLength: 0)
        }
    }
    
    @ViewBuilder
    private func makeBattlerOpponentHeader(battlerData: OAPI.Models.PlayerBattle.Battler) -> some View {
        let clan = battlerData.clan
        
        HStack(spacing: 0) {
            Spacer(minLength: 0)
            
            VStack(alignment: .trailing, spacing: 0) {
                Text(battlerData.name)
                    .customFont(size: 17, id: .s2)
                    .foregroundColor(.custom(.black()))
                    .lineLimit(1)
                    .minimumScaleFactor(0.1)
                
                Text(clan.name)
                    .customFont(size: 16, weight: .medium, id: .s2)
                    .foregroundColor(.custom(.secondary()))
                    .lineLimit(1)
                    .minimumScaleFactor(0.1)
            }
            .customPadding(t: 2, l: 4, b: 2, tr: 4)
            .lineLimit(1)
            .minimumScaleFactor(0.5)
            
            Image(clan.badgeName)
                .resizable()
                .customFrame(width: 45, height: 45 * (151/127), id: .s2)
        }
    }
    
    @ViewBuilder
    private func makeDeck(cards: [OfficialAPI.Models.PlayerBattle.Card]) -> some View {
        CustomGrid.init(isLazy: false,
                        allItemsCount: cards.count,
                        columns: 4) { idx in
            
            let isGolden = cards[idx].starLevel > 0
            let cardKey = cards[idx].enumValue.info.key
            
            let ratio: CGFloat = 363/302
            let cardWidth = (screen.width/2-CGFloat.custom(6)-1)/4
            let cardHeight = cardWidth*ratio
            
            Image(isGolden ? "\(cardKey)-g" : cardKey)
                .resizable()
                .frame(width: cardWidth, height: cardHeight)
                .overlay(
                    Text("lvl.\(cards[idx].level)")
                        .frame(width: cardWidth*0.9)
                        .customFont(size: 14, weight: .bold, id: .s4)
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 2)
                        .offset(y: .custom(-4.5, id: .s4))
                    , alignment: .bottom
                )
            
        }
        .menu { deckContextMenu(cards: cards) }
    }
    
    @ViewBuilder
    private func deckContextMenu(cards: [OAPI.Models.PlayerBattle.Card]) -> some View {
        let cardKeys = cards.map{$0.enumValue.info.key}
        let safariDeckLink = Funcs.Deck
            .makeDeckLink(deckCards: cardKeys,
                          appearance: $appearance)
        
        Button("Save to Deck Wallet", imageSystemName: "square.and.arrow.down") {
            addDeckMenuDeckCards = cardKeys
            withAnimation {
                addDeckMenuIsVisible = true
            }
        }
        
        if let link = safariDeckLink,
           let linkURL = URL(string: link) {
            
            Button("Copy deck in game", imageSystemName: "square.and.arrow.up") {
                openURL.callAsFunction(linkURL)
            }
            
            Button("Share deck link", imageSystemName: "square.and.arrow.up") {
                appearance.shareSheetItems = [.init(name: "Deck link", url: linkURL)]
                appearance.shareSheetPresentation = true
            }
        }
        
    }
    
    @ViewBuilder
    private func playerContextMenu(battler: OAPI.Models.PlayerBattle.Battler) -> some View {
        
        let tag = battler.tag
        
        Button("Player profile", imageSystemName: "arrowshape.turn.up.right") {
            appearance.statsInstantSearch = (mode: .players, tag: tag)
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
        
        let clanTag = battler.clan.tag
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
    
}
