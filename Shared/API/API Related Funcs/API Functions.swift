import Foundation
import SwiftUI

private typealias Card = Funcs.Card
private typealias Player = Funcs.Player
private typealias Clan = Funcs.Clan
private typealias Battle = Funcs.Battle
private typealias GT = Funcs.GT

extension Funcs {
    class Card { }
}

extension Funcs {
    class Player { }
}

extension Funcs {
    class Clan { }
}

extension Funcs {
    class Battle { }
}

extension Funcs {
    class GT { }
}

extension GT {
    static func compareGTRewardsWithCCandGCandShop(gtInfoData: OAPI.Models.GTInfo.Item,
                                                   player: OAPI.Models.PlayerProfile)
    -> GeneralModels.GTRewardsComparer.GTRewardsComparisonType {
        
        return GeneralModels.GTRewardsComparer(gtInfoData: gtInfoData,
                                               player: player)
            .getResultsOfTheComparison()
    }
}

extension Player {
    static func linkStringForOpenningInGame(tag: String) -> String {
        let tag = tag.uppercased()
            .replacingOccurrences(of: " ", with: "")
            .replacingOccurrences(of: "#", with: "")
            
        return "clashroyale://playerInfo?id=\(tag)"
    }
}

extension Clan {
    static func linkStringForOpenningInGame(tag: String) -> String {
        let tag = tag.uppercased()
            .replacingOccurrences(of: " ", with: "")
            .replacingOccurrences(of: "#", with: "")
            
        return "clashroyale://clanInfo?id=\(tag)"
    }
}

extension Player {
    static func arenaImageName(trophies: Int) -> String {
        
        switch trophies {
        case let x where x < 300 : return "arena1"
        case let x where x < 600 : return "arena2"
        case let x where x < 1000 : return "arena3"
        case let x where x < 1300 : return "arena4"
        case let x where x < 1600 : return "arena5"
        case let x where x < 2000 : return "arena6"
        case let x where x < 2300 : return "arena7"
        case let x where x < 2600 : return "arena8"
        case let x where x < 3000 : return "arena9"
        case let x where x < 3300 : return "arena10"
        case let x where x < 3600 : return "arena11"
        case let x where x < 4000 : return "arena12"
        case let x where x < 4300 : return "arena13"
        case let x where x < 4600 : return "arena14"
        case let x where x < 5000 : return "arena15"
        case let x where x < 5300 : return "arena16"
        case let x where x < 5600 : return "arena17"
        case let x where x < 6000 : return "arena18"
        case let x where x < 6300 : return "arena19"
        case let x where x < 6600 : return "arena20"
        case let x where x < 7000 : return "arena21"
        case let x where x < 100000 : return "arena22"
        default: return "arena0"
        }
        
    }
}

extension Battle {
    static func title(battleName: String, challengeTitle: String, isLadderTournament: Bool) -> String {
        
        if challengeTitle == "Grand Challenge" { return "Grand Challenge" }
        else if challengeTitle == "Classic Challenge" { return "Classic Challenge" }
        else if isLadderTournament { return "Global Tournament" }
        else {
            var battleTitle = battleName
                .replacingOccurrences(of: "_", with: "")
                //                .replacingOccurrences(of: "Mode", with: "")
                .replacingOccurrences(of: "Competitive", with: "Challenge")
                .replacingOccurrences(of: "DoubleDeck", with: "MegaDeck")
                .replacingOccurrences(of: "Overtime", with: "SuddenDeath")
                .replacingOccurrences(of: "Spawn", with: "")
                .replacingOccurrences(of: "Friendly", with: "FriendlyBattle")
            
            if challengeTitle != "" {
                battleTitle = battleTitle.replacingOccurrences(of: "Tournament", with: "Challenge")
            }
            
            let letters = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "1", "2", "3", "4", "5", "6", "7", "8", "9", "2016", "2017", "2018", "2019", "2020", "2021", "2022", " A", " B", " C", " D", " E", " F", " G", " H", " I", " J", " K", " L", " M", " N", " O", " P", " Q", " R", " S", " T", " U", " V", " W", " X", " Y", " Z", " 1 ", " 2 ", " 3 ", " 4 ", " 5 ", " 6 ", " 7 ", " 8 ", " 9 ", " 2016 ", " 2017 ", " 2018 ", " 2019 ", " 2020 ", " 2021 ", " 2022 "]
            
            for ind in 0...41 {
                battleTitle = battleTitle.replacingOccurrences(of: letters[ind], with: letters[ind+42])
            }
            
            battleTitle = battleTitle.replacingOccurrences(of: "Team Vs Team", with: " 2v2")
            
            if battleTitle.firstTrailingIndexOfSubString(subString: "Modern") == nil {
                battleTitle = battleTitle.replacingOccurrences(of: "Mode", with: "")
            }
            
            if (battleTitle.map{$0})[0] == " " {
                battleTitle = battleTitle.remove(at: 0)
            }
            
            battleTitle = battleTitle.replacingOccurrences(of: "  ", with: " ")
            
            return battleTitle
        }
    }
}

extension Battle {
    static func titleImageName(battle: OAPI.Models.PlayerBattle) -> String {
        
        let battleTitle = battle.title
        let challengeTitle = battle.challengeTitle
        let isLadderTournament = battle.isLadderTournament
        let teamSize = battle.team.count
        
        let b = battleTitle.contains("Retro")
        let c = battleTitle.contains("Modern")
        let d = battleTitle.contains("Draft")
        let e = battleTitle.contains("Ghost")
        let f = battleTitle.contains("Lumberjack")
        let g = battleTitle.contains("Fisherman")
        let h = battleTitle.contains("WallBreakers")
        let i = battleTitle.contains("Dragon")
        //    let j = alpha.contains("Global")
        let k = battleTitle.contains("Tournament")
        let l = battleTitle.contains("Ladder")
        let m = battleTitle.contains("Touchdown")
        let n = battleTitle.contains("DoubleDeck") // Mega Deck
        let o = battleTitle.contains("Friendly")
        let p = battleTitle.contains("Decks")
        let q = battleTitle.contains("Guards")
        let r = battleTitle.contains("Heist")
        let s = battleTitle.contains("DoubleElixir")
        let t = battleTitle.contains("TripleElixir")
        let u = battleTitle.contains("RampUp")
        let v = battleTitle.contains("SuddenDeath")
        let w = battleTitle.contains("Rage")
        let x = battleTitle.contains("Capture")
        
        if isLadderTournament { return "global-tournament" }
        else if teamSize == 2 { return "2v2" }
        else if o { return "friendly" }
        else if n { return "mega-deck" }
        else if d { return "draft" }
        else if m { return "touchdown" }
        else if w { return "rage-ladder" }
        else if r { return "heist" }
        else if p { return "classic-decks" }
        else if e { return "royal-ghost" }
        else if f { return "lumberjack" }
        else if g { return "fisherman" }
        else if h { return "wall-breakers" }
        else if q { return "guards" }
        else if i { return "dragon-hunt" }
        else if x { return "elixir-capture" }
        else if v { return "sudden-death" }
        else if s { return "double-elixir" }
        else if t { return "triple-elixir" }
        else if u { return "rampup" }
        else if k { return "tournament" }
        else if challengeTitle == "Classic Challenge" { return "challenge-classic" }
        else if challengeTitle == "Grand Challenge" { return "challenge-grand" }
        else if l { return "battle" }
        else if b { return "retro-royale" }
        else if c { return "classic-decks" }
        else { return "battle-unknown" }
        
    }
}

extension Battle {
    static func teamResult(battle: OAPI.Models.PlayerBattle)
    -> (text: String, color: Color) {
        
        let team = battle.team
        let opp = battle.opponent
        let battleTitle = battle.title
        let challengeTitle = battle.challengeTitle
        let isLadderTournament = battle.isLadderTournament
        let teamSize = team.count
        let teamTrophyChange = team[0].trophyChange
        let oppTrophyChange = opp[0].trophyChange
        let teamStartTrophies = team[0].startingTrophies
        let teamCrowns = team[0].crowns
        let oppCrowns = opp[0].crowns
        let winCountBefore = battle.challengeWinCountBefore
        
        if battleTitle.contains("Ladder") && teamSize == 1 && !isLadderTournament {
            if (oppTrophyChange == 0) {
                return (text: "\(teamStartTrophies)", color: .custom(.gray()))
            } else if teamCrowns > oppCrowns {
                return (text: "\(teamStartTrophies)+\(teamTrophyChange)", color: .custom(.green()))
            } else {
                return (text: "\(teamStartTrophies)\(teamTrophyChange)", color: .custom(.red()))
            }
        }
        else if challengeTitle != "" && !isLadderTournament {
            if teamCrowns == oppCrowns {
                return (text: "\(winCountBefore)±0", color: .custom(.gray()))
            } else if teamCrowns > oppCrowns {
                return (text: "\(winCountBefore)+1 Win", color: .custom(.green()))
            } else {
                return (text: "\(winCountBefore)+1 Loss", color: .custom(.red()))
            }
        }
        else {
            if teamCrowns == oppCrowns {
                return (text: "Draw", color: .custom(.gray()))
            } else if teamCrowns > oppCrowns {
                return (text: "+1 Win", color: .custom(.green()))
            } else {
                return (text: "+1 Loss", color: .custom(.red()))
            }
        }
        
    }
}

extension Battle {
    static func opponentResult(battle: OAPI.Models.PlayerBattle)
    -> (text: String, color: Color) {
        
        let team = battle.team
        let opp = battle.opponent
        let battleTitle = battle.title
        let isLadderTournament = battle.isLadderTournament
        let teamSize = team.count
        let oppTrophyChange = opp[0].trophyChange
        let oppStartTrophies = opp[0].startingTrophies
        let teamCrowns = team[0].crowns
        let oppCrowns = opp[0].crowns
        
        if battleTitle.contains("Ladder") && teamSize == 1 && !isLadderTournament {
            if (oppTrophyChange == 0) {
                return (text: "\(oppStartTrophies)", color: .custom(.gray()))
            } else if teamCrowns > oppCrowns {
                return (text: "\(oppStartTrophies)\(oppTrophyChange)", color: .custom(.red()))
            } else {
                return (text: "\(oppStartTrophies)+\(oppTrophyChange)", color: .custom(.green()))
            }
        }
        else {
            if teamCrowns == oppCrowns {
                return (text: "Draw", color: .custom(.gray()))
            } else if teamCrowns > oppCrowns {
                return (text: "+1 Loss", color: .custom(.red()))
            } else {
                return (text: "+1 Win", color: .custom(.green()))
            }
        }
        
    }
}

extension Clan {
    static func badgeName(badgeId: Int) -> String {
        return DataSet.ClanBadge.all.first{$0.id == badgeId}?.name ?? DataSet.ClanBadge.noClan.name
    }
}

extension Clan {
    static func clanType(type: String) -> String {
        switch type {
        case "inviteOnly": return "Invite only"
        case "open": return "Open"
        default: return "Closed"
        }
    }
}

extension Card {
    static func level(oldLevel: Int, maxLevel: Int) -> Int {
        return (13 - (maxLevel - oldLevel))
    }
}

extension Card {
    static func isMaxed(oldLevel: Int, maxLevel: Int) -> Bool {
        return oldLevel == maxLevel
    }
}

extension Card {
    static func isReadyToUpgrade(count: Int,
                                 upgradeIsPossibleAtThisCardCount: Int) -> Bool {
        
        return count > upgradeIsPossibleAtThisCardCount
    }
}

extension Card {
    static func upgradeIsPossibleAtThisCardCount(rarity: DataSet.CardRarity, oldLevel: Int) -> Int {
        let common = [1,2,4,10,20,50,100,200,400,800,1000,2000,5000,10000]
        let rare = [1,2,4,10,20,50,100,200,400,800,1000,2000]
        let epic = [1,2,4,10,20,50,100,200,400]
        let legendary = [1,2,4,10,20,50]
        
        switch rarity {
        case .common: return common[oldLevel]
        case .rare: return rare[oldLevel]
        case .epic: return epic[oldLevel]
        case .legendary: return legendary[oldLevel]
        }
    }
}

extension Card {
    static func upgradeableToLevel(rarity: DataSet.CardRarity, count: Int, level: Int) -> Int {
        
        var count = count
        var inti = level
        
        let common = [1,2,4,10,20,50,100,200,400,800,1000,2000,5000,10000]
        let rare = [1,2,4,10,20,50,100,200,400,800,1000,2000]
        let epic = [1,2,4,10,20,50,100,200,400]
        let legendary = [1,2,4,10,20,50]
        
        switch rarity {
        case .common:
            while count >= common[inti] {
                count -= common[inti]
                inti += 1
            }
        case .rare:
            while count >= rare[inti-2] {
                count -= rare[inti-2]
                inti += 1
            }
        case .epic:
            while count >= epic[inti-5] {
                count -= epic[inti-5]
                inti += 1
            }
        case .legendary:
            while count >= legendary[inti-8] {
                count -= legendary[inti-8]
                inti += 1
            }
        }
        
        return inti
    }
}

extension Card {
    static func currentCountPlusUsedCount(count: Int, level: Int, rarity: DataSet.CardRarity) -> Int {
        var cardCount = count
        
        switch rarity {
        case .common:
            switch level {
            case 2: cardCount += 2
            case 3: cardCount += 6
            case 4: cardCount += 16
            case 5: cardCount += 36
            case 6: cardCount += 86
            case 7: cardCount += 186
            case 8: cardCount += 386
            case 9: cardCount += 786
            case 10: cardCount += 1586
            case 11: cardCount += 2586
            case 12: cardCount += 4586
            case 13: cardCount += 9586
            default: {}()
            }
        case .rare:
            switch level {
            case 4: cardCount += 2
            case 5: cardCount += 6
            case 6: cardCount += 16
            case 7: cardCount += 36
            case 8: cardCount += 86
            case 9: cardCount += 186
            case 10: cardCount += 386
            case 11: cardCount += 786
            case 12: cardCount += 1586
            case 13: cardCount += 2586
            default: {}()
            }
        case .epic:
            switch level {
            case 7: cardCount += 2
            case 8: cardCount += 6
            case 9: cardCount += 16
            case 10: cardCount += 36
            case 11: cardCount += 86
            case 12: cardCount += 186
            case 13: cardCount += 386
            default: {}()
            }
        case .legendary:
            switch level {
            case 10: cardCount += 2
            case 11: cardCount += 6
            case 12: cardCount += 16
            case 13: cardCount += 36
            default: {}()
            }
        }
        
        return cardCount
    }
}

extension Card {
    static func progressText(count: Int, level: Int, rarity: DataSet.CardRarity) -> String {
        
        let allCardCountUpToNow = currentCountPlusUsedCount(count: count, level: level, rarity: rarity)
        let upgradePercentageInt = (allCardCountUpToNow*100)/rarity.cardCountNeededToMaxOne
        
        return "\(upgradePercentageInt)%"
    }
}

extension Card {
    static func cardsOwnedOfRarities(playerCards: [OAPI.Models.PlayerProfile.ProfileCard])
    -> (common: Int, rare: Int, epic: Int, legendary: Int) {
        
        let playerCards = playerCards.removeUnknownCards()
        
        let filteredBy: (DataSet.CardRarity) -> ([OAPI.Models.PlayerProfile.ProfileCard]) = { rarity in
            return playerCards.filter{$0.enumValue.info.rarity == rarity}
        }
        
        let commons = filteredBy(.common)
        let rares = filteredBy(.rare)
        let epics = filteredBy(.epic)
        let legendaries = filteredBy(.legendary)
        
        let getCount: ([OAPI.Models.PlayerProfile.ProfileCard]) -> Int = {
            $0.reduce(0) { lhs, rhs in
                return (lhs + currentCountPlusUsedCount(count: rhs.count,
                                                       level: rhs.level,
                                                       rarity: (rhs.enumValue).info.rarity))
            }
        }
        
        return (common: getCount(commons),
                rare: getCount(rares),
                epic: getCount(epics),
                legendary: getCount(legendaries))
    }
}

extension Card {
    static func goldsSpent(levelAndRarityPairs: [(level: Int, rarity: DataSet.CardRarity)]) -> Int {
        
        levelAndRarityPairs
            .reduce(0) { lhs, rhs in
                let level = rhs.level
                let rarity = rhs.rarity
                
                switch rarity {
                case .common:
                    switch level {
                    case 2: return lhs + 5
                    case 3: return lhs + 25
                    case 4: return lhs + 75
                    case 5: return lhs + 225
                    case 6: return lhs + 625
                    case 7: return lhs + 1625
                    case 8: return lhs + 3625
                    case 9: return lhs + 7625
                    case 10: return lhs + 15625
                    case 11: return lhs + 35625
                    case 12: return lhs + 85625
                    case 13: return lhs + 185625
                    default: return lhs
                    }
                case .rare:
                    switch level {
                    case 4: return lhs + 50
                    case 5: return lhs + 200
                    case 6: return lhs + 600
                    case 7: return lhs + 1600
                    case 8: return lhs + 3600
                    case 9: return lhs + 7600
                    case 10: return lhs + 15600
                    case 11: return lhs + 35600
                    case 12: return lhs + 85600
                    case 13: return lhs + 185600
                    default: return lhs
                    }
                case .epic:
                    switch level {
                    case 7: return lhs + 400
                    case 8: return lhs + 2400
                    case 9: return lhs + 6400
                    case 10: return lhs + 14400
                    case 11: return lhs + 34400
                    case 12: return lhs + 84400
                    case 13: return lhs + 184400
                    default: return lhs
                    }
                case .legendary:
                    switch level {
                    case 10: return lhs + 5000
                    case 11: return lhs + 25000
                    case 12: return lhs + 75000
                    case 13: return lhs + 175000
                    default: return lhs
                    }
                }
            }
    }
}

extension Player {
    static func calculatePlayerCardsStats(datas: EnvObjs.Datas) -> [StringArrayOfStringPair] {
        
        let profile = datas.playerProfile
        let allCards = DataSet.Cards.allValids
        let playerCards = profile.cards
        
        let allCardsCount = allCards.count
        let playerCardCount = playerCards.count
        let cardsMaxed = (playerCards.filter {$0.level == 13}).count
        let cardsMaxedPercentage = (Double(cardsMaxed)/Double(allCardsCount)*100).maxDigitCount(3)
        
        let allCardsLevelAndRarityPairs = allCards.map{(level: 13, rarity: $0.info.rarity)}
        let playerLevelAndRarityPairs = playerCards
            .map{(level: $0.level, rarity: $0.enumValue.info.rarity)}
        let allGoldToMax = Funcs.Card.goldsSpent(levelAndRarityPairs: allCardsLevelAndRarityPairs)
        let goldSpent = Funcs.Card.goldsSpent(levelAndRarityPairs: playerLevelAndRarityPairs)
        let goldSpentPercentage = (Double(goldSpent)/Double(allGoldToMax)*100).maxDigitCount(3)
        let goldNeededToMax = allGoldToMax - goldSpent
        
        let starpoints = profile.starPoints
        let starpointsForMax = allCards.reduce(0) { lhs, rhs in
            switch rhs.info.starLevels {
            case 1: return lhs + 10000
            case 2: return lhs + 15000
            case 3: return lhs + 20000
            default: return lhs
            }
        }
        let starpointsSpent = playerCards.reduce(0) { lhs, rhs in
            switch rhs.starLevel {
            case 1: return lhs + 10000
            case 2: return lhs + 15000
            case 3: return lhs + 20000
            default: return lhs
            }
        }
        let starpointsToBeCollected = (starpointsForMax - starpoints > 0) ? starpointsForMax - starpoints : 0
        let starpointsSpentPercentage = (Double(starpointsSpent)/Double(starpointsForMax)*100).maxDigitCount(3)
        
        let allCardsCountForRarity: (DataSet.CardRarity) -> Int = {
            DataSet.CardRarity.cardCountNeededToMaxAll(for: $0)
        }
        let cardCountToMaxAllCards: (DataSet.CardRarity) -> Int = {
            allCardsCountForRarity($0)
        }
        let cardCountGatheredSoFar: (DataSet.CardRarity) -> Int = { rarity in
            playerCards
                .filter { $0.enumValue.info.rarity == rarity }
                .reduce(0) { lhs, rhs in
                    lhs + Funcs.Card.currentCountPlusUsedCount(count: rhs.count,
                                                               level: rhs.level,
                                                               rarity: rarity)
                }
        }
        let progressPercentage: (DataSet.CardRarity) -> String = {
            (Double(cardCountGatheredSoFar($0))/Double(cardCountToMaxAllCards($0))*100)
                .maxDigitCount(3)
        }
        let cardCountNeededToMax: (DataSet.CardRarity) -> Int = {
            cardCountToMaxAllCards($0) - cardCountGatheredSoFar($0)
        }
        
        return [
            .init(key: "Cards Unlocked", values: [playerCardCount.addGroupingSeparator()]),
            .init(key: "Cards Maxed", values: [cardsMaxed.addGroupingSeparator(), cardsMaxedPercentage+"%"]),
            .init(key: "Gold Spent", values: [goldSpent.addGroupingSeparator(), goldSpentPercentage+"%"]),
            .init(key: "Gold Needed", values: [goldNeededToMax.addGroupingSeparator()]),
            .init(key: "Current Starpoints", values: [starpoints.addGroupingSeparator()]),
            .init(key: "Starpoints Spent", values: [starpointsSpent.addGroupingSeparator(),
                                                    starpointsSpentPercentage+"%"]),
            .init(key: "Starpoints Needed", values: [starpointsForMax.addGroupingSeparator()]),
            .init(key: "Starpoints To Be Collected", values: [starpointsToBeCollected.addGroupingSeparator()]),
            .init(key: "Common Progress", values: [cardCountGatheredSoFar(.common).addGroupingSeparator(),
                                                   progressPercentage(.common)+"%"]),
            .init(key: "Commons Needed", values: [cardCountNeededToMax(.common).addGroupingSeparator()]),
            .init(key: "Rare Progress", values: [cardCountGatheredSoFar(.rare).addGroupingSeparator(),
                                                 progressPercentage(.rare)+"%"]),
            .init(key: "Rares Needed", values: [cardCountNeededToMax(.rare).addGroupingSeparator()]),
            .init(key: "Epic Progress", values: [cardCountGatheredSoFar(.epic).addGroupingSeparator(),
                                                 progressPercentage(.epic)+"%"]),
            .init(key: "Epics Needed", values: [cardCountNeededToMax(.epic).addGroupingSeparator()]),
            .init(key: "Legendary Progress", values: [cardCountGatheredSoFar(.legendary).addGroupingSeparator(),
                                                      progressPercentage(.legendary)+"%"]),
            .init(key: "Legendaries Needed", values: [cardCountNeededToMax(.legendary).addGroupingSeparator()])
        ]
    }
}

extension Player {
    static func identifyAllBadges(badges: [OAPI.Models.PlayerProfile.Badge])
    -> [(imageName: String, progress: String, explanation: String)] {
        
        var badgesToReturn = [(imageName: String, progress: String, explanation: String)]()
        
        for badge in badges {
            
            var shouldAppend = true
            var badgeInfo = (imageName: "", progress: "", explanation: "")
            let badgeName = badge.name
            let badgeProgress = badge.progress
            
            switch badgeName {
            case "TopLeague":
                badgeInfo.imageName = DataSet.Arena.find(trophies: badgeProgress).imageName
                badgeInfo.progress = badgeProgress.addGroupingSeparator()
                badgeInfo.explanation = "Top league reached"
                
            case "ClanWarWins":
                badgeInfo.imageName = "clan-war-tight"
                badgeInfo.progress = "x\(badgeProgress.addGroupingSeparator())"
                badgeInfo.explanation = "Clan war warDay wins"
                
            case let x where x.contains("LadderTournamentTop"):
                badgeInfo.imageName = "tournament-badge"
                badgeInfo.progress = "#\(badgeProgress)"
                badgeInfo.explanation = "Global Tournament rank"
                
            case let x where x.contains("Played") && x.contains("Year"):
                badgeInfo.imageName = "golden-badge"
                var progressYear = badgeName.replacingOccurrences(of: "Played", with: "")
                progressYear = progressYear.replacingOccurrences(of: "Y", with: " Y")
                badgeInfo.progress = progressYear
                badgeInfo.explanation = "Years played Clash Royale"
                
            case let x where x.contains("Crl20Wins"):
                badgeInfo.imageName = "crl-20win-badge"
                badgeInfo.progress = "\(badgeProgress)"
                badgeInfo.explanation = "CRL 20Win challenge"
                
            case let x where x.contains("LadderTop1000"):
                badgeInfo.imageName = "trophy"
                badgeInfo.progress = "#\(badgeProgress)"
                badgeInfo.explanation = "Top ladder finish"
                
            case "1000Wins":
                badgeInfo.imageName = "crown-blue"
                badgeInfo.progress = "x\(badgeProgress.addGroupingSeparator())"
                badgeInfo.explanation = "Battles won"
                
            case "Grand12Wins":
                badgeInfo.imageName = "challenge-grand"
                badgeInfo.progress = "x\(badgeProgress)"
                badgeInfo.explanation = "Grand challenge 12Wins"
                
            case "Classic12Wins":
                badgeInfo.imageName = "challenge-classic"
                badgeInfo.progress = "x\(badgeProgress)"
                badgeInfo.explanation = "Classic challenge 12Wins"
                
            default: shouldAppend = false
            }
            
            if shouldAppend {
                badgesToReturn.append(badgeInfo)
            }
        }
        
        return badgesToReturn
    }
}
