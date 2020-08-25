import SwiftUI

extension PlayerBaseView.StatsView {
    
    private struct PlayerDeck {
        var deckCards: [String]
        var title: String
        var count: Int
        var wins: Int
        var losses: Int
        var draws: Int
    }
    
    @ViewBuilder
    func makePlayerDecks() -> some View {
        let playerDecks = findPlayerDecks()
        let _ = {
            if !(playerDeckIndex < playerDecks.count) {
                playerDeckIndex = 0
            }
        }()
        
        if playerDecks.count != 0 {
            VStack(spacing: 0) {
                let cardWidthHeightRatio: CGFloat = 302/363
                let deckWidth: CGFloat = 68 * 4 * cardWidthHeightRatio
                    
                ZStack {
                    ForEach(playerDecks.indices, id: \.self) { idx in
                        let playerDeck = playerDecks[idx]
                        let isInFront = playerDeckIndex == idx
                        let multiplier: CGFloat = isInFront ? 1 : 0.7
                        
                        VStack(spacing: 0) {
                            Text(playerDeck.title == "" ? " " : playerDeck.title)
                                .foregroundColor(.custom(.green()))
                                .customFont(size: 22, weight: .medium, id: .s2)
                                .customPadding(t: 3, l: 6, b: 5, tr: 6, id: .s2)
                                .lineLimit(1)
                                .minimumScaleFactor(0.01)
                            
                            makeDeck(cards: playerDeck.deckCards, isInFront: isInFront)
                            
                            makeDeckFooter(deck: playerDeck)
                                .customPadding(t: 5, b: 2, id: .s2)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                        .customFrame(width: deckWidth, id: .s2)
                        .scaleEffect(multiplier, anchor: .center)
                        .offset(x: .custom(-deckWidth*(CGFloat(playerDeckIndex-idx)), id: .s2))
                        
                    }
                    .frame(maxWidth: screen.width)
                }
            }
            .customPadding(t: 4, l: 3, b: 4, tr: 3, id: .s4)
            .background(Color.custom(.white()))
            .customCornerRadius(8)
            .customPadding(t: 5, l: 8, b: 5, tr: 8, id: .s4)
            .shadow(color: .custom(.blackShadow(), opacity: 0.2), radius: 2)
            .simultaneousGesture(swipeGesture(playerDecks: playerDecks))
        }
    }
    
    @ViewBuilder
    private func makeDeck(cards: [String], isInFront: Bool) -> some View {
        
        let profile = datas.playerProfile
        
        CustomGrid.init(isLazy: false, allItemsCount: 8, rows: 2) { idx in
            
            let cardKey = cards[idx]
            let cardInProfile = profile.cards.first { $0.enumValue.info.key == cardKey } ?? .init()
            let isGolden = cardInProfile.starLevel > 0
            let level = cardInProfile.level
            
            Image(isGolden ? "\(cardKey)-g" : cardKey)
                .resizable()
                .scaledToFit()
                .customFrame(height: 68, id: .s2)
                .overlay(
                    Text("lvl.\(level)")
                        .customFont(size: 16, weight: .bold, id: .s2)
                        .foregroundColor(.white)
                        .shadow(color: .black, radius: 2)
                        .offset(y: .custom(-5, id: .s2))
                    , alignment: .bottom
                )
        }
        .customPadding(5, id: .s2)
        .background(Color.custom(.gray(), opacity: 0.25))
        .customCornerRadius(8)
        .menu { deckContextMenu(cardKeys: cards, isInFront: isInFront) }
    }
    
    @ViewBuilder
    private func makeDeckFooter(deck: PlayerDeck) -> some View {
        let lhss = ["Count", "Losses", "Wins", "Draws"]
        let battleCount = datas.playerBattles.count
        let rhss = ["\(deck.count)/\(battleCount)", "\(deck.losses)", "\(deck.wins)", "\(deck.draws)"]
        
        HStack(spacing: 0) {
            ForEach(0...1, id: \.self) { idx in
                VStack(spacing: 0) {
                    ForEach(0...1, id: \.self) { ind in
                        makeTextsForFooter(lhs: lhss[2*idx+ind],
                                           rhs: rhss[2*idx+ind])
                    }
                }
                
                if idx == 0 {
                    Divider()
                }
            }
        }
    }
    
    func makeTextsForFooter(lhs: String, rhs: String) -> some View {
        HStack(spacing: 0) {
            Text("\(lhs):")
                .foregroundColor(.custom(.gray(id: .c2)))
                .customFont(size: 16, weight: .bold)
            
            Spacer(minLength: 0)
            
            Text(rhs)
                .foregroundColor(.custom(.gray(id: .c2)))
                .customFont(size: 16, weight: .semibold)
        }
        .customPadding(t: 1, l: 3, b: 1, tr: 3)
    }
    
    private func findPlayerDecks() -> [PlayerDeck] {
        
        var decks = [PlayerDeck]()
        let battles = datas.playerBattles
        let profile = datas.playerProfile
        let playerTag = profile.tag
        let playerData = datas.playerBattles.map{($0.team.filter { $0.tag == playerTag }) }.map{ $0[0] }
        
        let cardKeys: ([OAPI.Models.PlayerBattle.Card]) -> [String] = {
            $0.map{$0.enumValue.info.key}
        }
        
        let isLadderBattle: (String) -> Bool = {
            $0 == "Ladder" ||
                $0 == "Ladder Crown Rush" ||
                $0 == "Ladder Gold Rush" ||
                $0 == "Ladder Gem Rush"
        }
        
        let countPlayed: ([String]) -> Int = { cards in
            playerData
                .filter{cardKeys($0.cards).sorted() == cards.sorted()}.count
        }
        
        let findBattlesWithDeck: ([String]) -> [OAPI.Models.PlayerBattle] = { cards in
            battles
                .filter{$0.team.contains { $0.tag == playerTag &&
                    cardKeys($0.cards).sorted() == cards.sorted() } }
        }
        
        let winCount: ([String]) -> Int = { cards in
            let battles = findBattlesWithDeck(cards)
            return battles.filter { $0.team[0].crowns > $0.opponent[0].crowns }.count
        }
        
        let lossCount: ([String]) -> Int = { cards in
            let battles = findBattlesWithDeck(cards)
            return battles.filter { $0.team[0].crowns < $0.opponent[0].crowns }.count
        }
        
        let drawCount: ([String]) -> Int = { cards in
            let battles = findBattlesWithDeck(cards)
            return battles.filter { $0.team[0].crowns == $0.opponent[0].crowns }.count
        }
        
        //append last ladder deck if any ladder decks were played recently
        if let firstLadderBattle = (battles.first { isLadderBattle($0.title) }) {
            
            let battle = firstLadderBattle
            let deckCards = cardKeys(battle.team.first{$0.tag == playerTag}!.cards)
            let count = countPlayed(deckCards)
            let wins = winCount(deckCards)
            let losses = lossCount(deckCards)
            let draws = drawCount(deckCards)
            
            decks.append(.init(deckCards: deckCards,
                               title: "Last Ladder Deck",
                               count: count,
                               wins: wins,
                               losses: losses,
                               draws: draws))
        }
        
        //append favorite deck
        let favoriteDeckCards = profile.currentDeck.map{$0.enumValue.info.key}
        if favoriteDeckCards.count == 8 {
            let count = countPlayed(favoriteDeckCards)
            let wins = winCount(favoriteDeckCards)
            let losses = lossCount(favoriteDeckCards)
            let draws = drawCount(favoriteDeckCards)
            
            var title: String {
                if let firstIndex = (decks.firstIndex{$0.deckCards.sorted() == favoriteDeckCards.sorted()}) {
                    decks.remove(at: firstIndex)
                    return "Favorite & Last Ladder Deck"
                }
                
                return "Favorite Deck"
            }
            
            decks.append(.init(deckCards: favoriteDeckCards,
                               title: title,
                               count: count,
                               wins: wins,
                               losses: losses,
                               draws: draws))
        }
        
        //append other decks
        for data in playerData {
            if !(decks.map{$0.deckCards.sorted()}).contains(cardKeys(data.cards).sorted()) {
                if cardKeys(data.cards).count == 8 {
                    let deckCards = cardKeys(data.cards)
                    let count = countPlayed(deckCards)
                    let wins = winCount(deckCards)
                    let losses = lossCount(deckCards)
                    let draws = drawCount(deckCards)
                    
                    decks.append(.init(deckCards: deckCards,
                                       title: "",
                                       count: count,
                                       wins: wins,
                                       losses: losses,
                                       draws: draws))
                }
            }
        }
        
        return decks
    }
    
    @ViewBuilder
    private func deckContextMenu(cardKeys: [String], isInFront: Bool) -> some View {
        
        if isInFront {
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
        
    }
    
    private func swipeGesture(playerDecks: [PlayerDeck]) -> some Gesture {
        DragGesture()
            .onEnded { value in
                withAnimation {
                    
                    let translation = value.translation
                    let deckCount = playerDecks.count
                    
                    if translation.width.absoluteDistance(to: 0) > 40 {
                        if translation.width < 0 {
                            playerDeckIndex.addOrBounce(max: deckCount-1)
                        }
                        else {
                            playerDeckIndex.addOrBounce(value: -1, max: deckCount-1)
                        }
                    }
                    
                }
            }
    }
    
}
