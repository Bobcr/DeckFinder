import Foundation

// Digging into this file is really not a good idea. It contains rather mathematical operations
// than real programming

// compares GT rewards with classic challenge, grand challenge and shop offers

private typealias GTRewardsComparer = GeneralModels.GTRewardsComparer

extension GeneralModels {
    class GTRewardsComparer {
        var gtInfoData: OAPI.Models.GTInfo.Item
        var player: OAPI.Models.PlayerProfile
        
        init(gtInfoData: OAPI.Models.GTInfo.Item,
             player: OAPI.Models.PlayerProfile) {
            
            self.gtInfoData = gtInfoData
            self.player = player
        }
        
        func getResultsOfTheComparison() -> GTRewardsComparisonType {
            return self.claculateRewardsValue(gtInfoData: self.gtInfoData,
                                              player: self.player)
        }
    }
}

//MARK: -typealiases
extension GTRewardsComparer {
    typealias Contents = DataSet.Chests.Contents
    typealias Chests = DataSet.Chests
}

//MARK: -Models
extension GTRewardsComparer {
    struct GTRewardsComparisonType: Equatable, Hashable, Codable {
        var freeVsShop = 0.0
        var freeVsSpecialOffers = 0.0
        var freeVsCC = 0.0
        var freeVsGC = 0.0
        var milestoneVsShop = 0.0
        var milestoneVsSpecialOffers = 0.0
        var milestoneVsCC = 0.0
        var milestoneVsGC = 0.0
        
        var isEmpty: Bool {
            freeVsShop == 0.0 &&
                freeVsSpecialOffers == 0.0 &&
                freeVsCC == 0.0 &&
                freeVsGC == 0.0 &&
                milestoneVsShop == 0.0 &&
                milestoneVsSpecialOffers == 0.0 &&
                milestoneVsCC == 0.0 &&
                milestoneVsGC == 0.0
        }
    }
}

extension GTRewardsComparer {
    private struct Tokens: Hashable, Equatable {
        var common = 0
        var rare = 0
        var epic = 0
        var legendary = 0
    }
}

extension GTRewardsComparer {
    private enum ChallengeName { case grandChallenge, classicChallenge, none }
}

extension GTRewardsComparer {
    private struct GTRewardsType: Equatable, Hashable {
        var chestsContents: Contents
        var tokens: Tokens
        var golds: Double
        var gems: Double
        
        init(_ chestsContents: Contents,
             _ tokens: Tokens,
             _ golds: Double,
             _ gems: Double) {
            self.chestsContents = chestsContents
            self.tokens = tokens
            self.golds = golds
            self.gems = gems
        }
        
        init(chestsContents: Contents,
             tokens: Tokens,
             golds: Double,
             gems: Double) {
            self.chestsContents = chestsContents
            self.tokens = tokens
            self.golds = golds
            self.gems = gems
        }
        
    }
}

//MARK: -Methods
extension GTRewardsComparer {
    private func finalComparisonResult(playerCards: [OAPI.Models.PlayerProfile.ProfileCard],
                               freeRewardsContent: GTRewardsType,
                               milestoneRewardsContent: GTRewardsType)
    -> GTRewardsComparisonType {
        
        if let ccWins = UD.standardValue(forKey: .classicChallengeAverageWins) as? Int,
           let gcWins = UD.standardValue(forKey: .grandChallengeAverageWins) as? Int {
            
            let freeTiersVsShop = calcRewardsValue(playerCards: playerCards,
                                                   wins: 0,
                                                   challenge: .none,
                                                   rewardsSum: freeRewardsContent)
            
            let freeVsSpecialOffers = (freeTiersVsShop - freeRewardsContent.gems)/4.2 + freeRewardsContent.gems
            
            let freeTiersVsCC = calcRewardsValue(playerCards: playerCards,
                                                 wins: ccWins,
                                                 challenge: .classicChallenge,
                                                 rewardsSum: freeRewardsContent)
            
            let freeTiersVsGC = calcRewardsValue(playerCards: playerCards,
                                                 wins: gcWins,
                                                 challenge: .grandChallenge,
                                                 rewardsSum: freeRewardsContent)
            
            let milestoneTiersVsShop = calcRewardsValue(playerCards: playerCards,
                                                        wins: 0,
                                                        challenge: .none,
                                                        rewardsSum: milestoneRewardsContent)
            
            let milestoneVsSpecialOffers = (milestoneTiersVsShop - milestoneRewardsContent.gems)/4.2 + milestoneRewardsContent.gems
            
            let milestoneTiersVsCC = calcRewardsValue(playerCards: playerCards,
                                                      wins: ccWins,
                                                      challenge: .classicChallenge,
                                                      rewardsSum: milestoneRewardsContent)
            
            let milestoneTiersVsGC = calcRewardsValue(playerCards: playerCards,
                                                      wins: gcWins,
                                                      challenge: .grandChallenge,
                                                      rewardsSum: milestoneRewardsContent)
            
            let gtRewardsComparisonInGems = GTRewardsComparisonType(freeVsShop: freeTiersVsShop,
                                                                    freeVsSpecialOffers: freeVsSpecialOffers,
                                                                    freeVsCC: freeTiersVsCC,
                                                                    freeVsGC: freeTiersVsGC,
                                                                    milestoneVsShop: milestoneTiersVsShop,
                                                                    milestoneVsSpecialOffers: milestoneVsSpecialOffers,
                                                                    milestoneVsCC: milestoneTiersVsCC,
                                                                    milestoneVsGC: milestoneTiersVsGC)
            
            return gtRewardsComparisonInGems
        }
        else {
            return GTRewardsComparisonType()
        }
    }
}

extension GTRewardsComparer {
    private func convertCardsToGold(_ maxedFraction: Double, _ rarityCount: Double, _ rarityGold: Double) -> Double {
        let goldOfMaxed = pow(maxedFraction, 5/4) * rarityCount * rarityGold * 9/10
        let valueOfNotMaxedInGold = (1-pow(maxedFraction, 5/4)) * rarityCount * rarityGold * 6/5
        
        return goldOfMaxed + valueOfNotMaxedInGold
    }
}

extension GTRewardsComparer {
    private func convertTokensToGold(_ maxedFraction: Double, _ tokenCount: Double, _ tokenGold: Double) -> Double {
        let goldOfMaxed = pow(maxedFraction, 5/4) * tokenCount * tokenGold
        let valueOfNotMaxedInGold = (1-pow(maxedFraction, 5/4)) * tokenCount * tokenGold * 6/5
        
        return goldOfMaxed + valueOfNotMaxedInGold
    }
}

extension GTRewardsComparer {
    private func calcRewardsValue(playerCards: [OAPI.Models.PlayerProfile.ProfileCard],
                          wins: Int,
                          challenge: ChallengeName,
                          rewardsSum: GTRewardsType
    ) -> Double {
        
        let rarityCount = (common: DataSet.CardRarity.cardCountNeededToMaxAll(for: .common),
                           rare: DataSet.CardRarity.cardCountNeededToMaxAll(for: .rare),
                           epic: DataSet.CardRarity.cardCountNeededToMaxAll(for: .epic),
                           legendary: DataSet.CardRarity.cardCountNeededToMaxAll(for: .legendary))
        let rarityOwned = Funcs.Card.cardsOwnedOfRarities(playerCards: playerCards)
        let rarityGold = (common: 5.0, rare: 50.0, epic: 500.0, legendary: 20000.0)
        
        let commonMaxed = Double(rarityOwned.common)/Double(rarityCount.common)
        let rareMaxed = Double(rarityOwned.rare)/Double(rarityCount.rare)
        let epicMaxed = Double(rarityOwned.epic)/Double(rarityCount.epic)
        let legendaryMaxed = Double(rarityOwned.legendary)/Double(rarityCount.legendary)
        
        var chestContents: Chests.Contents {
            switch challenge {
            case .grandChallenge: return DataSet.Chests.grandChallenge(wins: wins).contents
            default: return DataSet.Chests.classicChallenge(wins: wins).contents
            }
        }
        
        var gtChestRewardsConvertedToGold = 0.0
        var tokenRewardsConvertedToGold = 0.0
        var challengeChestConvertedToGold = 0.0
        
        if challenge != .none {
            let commonConverted = convertCardsToGold(commonMaxed, chestContents.commons, rarityGold.common)
            let rareConverted = convertCardsToGold(rareMaxed, chestContents.rares, rarityGold.rare)
            let epicConverted = convertCardsToGold(epicMaxed, chestContents.epics, rarityGold.epic)
            let legendaryConverted = convertCardsToGold(legendaryMaxed, chestContents.legendaries+chestContents.chanceOfLegendary, rarityGold.legendary)
            
            challengeChestConvertedToGold = chestContents.golds + commonConverted + rareConverted + epicConverted + legendaryConverted
        }
        
        _ = { // converts Chests to gold
            let chestContents = rewardsSum.chestsContents
            let commonConverted = convertCardsToGold(commonMaxed, chestContents.commons, rarityGold.common)
            let rareConverted = convertCardsToGold(rareMaxed, chestContents.rares, rarityGold.rare)
            let epicConverted = convertCardsToGold(epicMaxed, chestContents.epics+chestContents.chanceOfEpic, rarityGold.epic)
            let legendaryConverted = convertCardsToGold(legendaryMaxed, chestContents.legendaries+chestContents.chanceOfLegendary, rarityGold.legendary)
            
            gtChestRewardsConvertedToGold = chestContents.golds + commonConverted + rareConverted + epicConverted + legendaryConverted
        }()
        
        
        _ = { // converts Tokens to gold
            let tokens = rewardsSum.tokens
            let commonTokens = convertTokensToGold(commonMaxed, Double(tokens.common), rarityGold.common)
            let rareTokens = convertTokensToGold(rareMaxed, Double(tokens.rare), rarityGold.rare)
            let epicTokens = convertTokensToGold(epicMaxed, Double(tokens.epic), rarityGold.epic)
            let legendaryTokens = convertTokensToGold(legendaryMaxed, Double(tokens.legendary), rarityGold.legendary)
            tokenRewardsConvertedToGold = commonTokens + rareTokens + epicTokens + legendaryTokens
        }()
        
        
        // all gt rewards in gold.
        // gems are added down below, in resultOfComparisonInGems
        let gtRewardsInGold = gtChestRewardsConvertedToGold + rewardsSum.golds + tokenRewardsConvertedToGold
        
        var resultOfComparisonInGems: Double
        
        if challenge != .none {
            let challengeCost = challenge == .grandChallenge ? 100.0 : 10.0
            resultOfComparisonInGems = gtRewardsInGold/challengeChestConvertedToGold*challengeCost + rewardsSum.gems
        }
        else {
            resultOfComparisonInGems = gtRewardsInGold/100000*4500 + rewardsSum.gems
        }
        
        return resultOfComparisonInGems
    }
}

extension GTRewardsComparer {
    private func sumAllGTRewardsTogether(reward: OAPI.Models.GTInfo.Reward, trophies: Int)
    -> GTRewardsType {
        
        var chestContents = [Chests.Contents]()
        var summedChestContents = Chests.Contents()
        var tokens = Tokens()
        var golds = 0.0
        var gems = 0.0
        
        switch reward.type {
        case "chest":
            switch reward.chest {
            case "Giant": chestContents.append(
                DataSet.Chests.giant(arena: .find(trophies: trophies)).contents)
            case "Epic": chestContents.append(
                DataSet.Chests.epic(arena: .find(trophies: trophies)).contents)
            case "Wooden": chestContents.append(
                DataSet.Chests.wooden(arena: .find(trophies: trophies)).contents)
            case "Silver": chestContents.append(
                DataSet.Chests.silver(arena: .find(trophies: trophies)).contents)
            case "Golden": chestContents.append(
                DataSet.Chests.golden(arena: .find(trophies: trophies)).contents)
            case "Legendary": chestContents.append(
                DataSet.Chests.legendary.contents)
            case "Lightning": chestContents.append(
                DataSet.Chests.lightning(arena: .find(trophies: trophies)).contents)
            case "Magical": chestContents.append(
                DataSet.Chests.magical(arena: .find(trophies: trophies)).contents)
            case let x where x.lowercased().contains("crown"): chestContents.append(
                DataSet.Chests.crown(arena: .find(trophies: trophies)).contents)
            case let x where x.lowercased().contains("mega"): chestContents.append(
                DataSet.Chests.megaLightning(arena: .find(trophies: trophies)).contents)
            case let x where x.lowercased().contains("king"): chestContents.append(
                DataSet.Chests.kings(arena: .find(trophies: trophies)).contents)
            default: {}()
            }
        case "tradeToken":
            switch reward.rarity {
            case "common": tokens.common += reward.amount
            case "rare": tokens.rare += reward.amount
            case "epic": tokens.epic += reward.amount
            case "legendary": tokens.legendary += reward.amount
            default: {}()
            }
        case "resource":
            switch reward.resource {
            case "gold": golds += Double(reward.amount)
            case "gem": gems += Double(reward.amount)
            default: {}()
            }
        default: {}()
        }
        
        summedChestContents = chestContents.reduce(summedChestContents) { lhs, rhs -> Chests.Contents in
            let returni = Chests.Contents.init(lhs.commons+rhs.commons,
                                               lhs.rares+rhs.rares,
                                               lhs.epics+rhs.epics,
                                               lhs.legendaries+rhs.legendaries,
                                               lhs.averageGolds+rhs.averageGolds,
                                               lhs.chanceOfRare+rhs.chanceOfRare,
                                               lhs.chanceOfEpic+rhs.chanceOfEpic,
                                               lhs.chanceOfLegendary+rhs.chanceOfLegendary,
                                               0)
            return returni
        }
        
        return GTRewardsType(summedChestContents, tokens, golds, gems)
    }
}

extension GTRewardsComparer {
    private func calcRewardsSum(rewards: [OAPI.Models.GTInfo.Reward], trophies: Int) -> GTRewardsType {
        
        var allRewards = [GTRewardsType]()
        
        for idx in rewards.indices {
            let newValue = sumAllGTRewardsTogether(reward: rewards[idx],
                                                   trophies: trophies)
            allRewards.append(newValue)
        }
        
        let initialValue = GTRewardsType(Chests.Contents(), Tokens(), 0.0, 0.0)
        
        let sumOfAllRewards = allRewards.reduce(initialValue) { lhs, rhs -> GTRewardsType in
            
            var newChestContents: Chests.Contents {
                let lhs = lhs.chestsContents
                let rhs = rhs.chestsContents
                return Chests.Contents.init(lhs.commons+rhs.commons,
                                            lhs.rares+rhs.rares,
                                            lhs.epics+rhs.epics,
                                            lhs.legendaries+rhs.legendaries,
                                            lhs.averageGolds+rhs.averageGolds,
                                            lhs.chanceOfRare+rhs.chanceOfRare,
                                            lhs.chanceOfEpic+rhs.chanceOfEpic,
                                            lhs.chanceOfLegendary+rhs.chanceOfLegendary, 0)
            }
            
            var newTokens: Tokens {
                let lhs = lhs.tokens
                let rhs = rhs.tokens
                return Tokens(common: lhs.common+rhs.common,
                              rare: lhs.rare+rhs.rare,
                              epic: lhs.epic+rhs.epic,
                              legendary: lhs.legendary+rhs.legendary)
            }
            
            return GTRewardsType(newChestContents,
                                 newTokens,
                                 lhs.golds+rhs.golds,
                                 lhs.gems+rhs.gems)
        }
        
        return sumOfAllRewards
    }
}

extension GTRewardsComparer {
    private func claculateRewardsValue(gtInfoData: OAPI.Models.GTInfo.Item, player: OAPI.Models.PlayerProfile)
    -> GTRewardsComparisonType {
        
        guard gtInfoData.freeTierRewards.count != 0,
              gtInfoData.milestoneRewards.count != 0
        else { return GTRewardsComparisonType() }
        
        let freeRewardsContent = calcRewardsSum(rewards: gtInfoData.freeTierRewards,
                                                trophies: player.trophies)
        
        let milestoneRewardsContent = calcRewardsSum(rewards: gtInfoData.milestoneRewards,
                                                     trophies: player.trophies)
        
        let rewardsComparisonInGems = finalComparisonResult(playerCards: player.cards,
                                                            freeRewardsContent: freeRewardsContent,
                                                            milestoneRewardsContent: milestoneRewardsContent)
        
        return rewardsComparisonInGems
    }
}
