//
//  GlobalTourneyInfo.swift
//  iOS
//
//  Created by Mohammad on 7/7/20.
//

import Foundation

private typealias GTInfo = OAPI.CodableModels.GTInfo

extension OAPI.CodableModels {
    typealias GTInfo = GlobalTourneyInfo
    
    struct GlobalTourneyInfo: Codable {
        var items: [Item]? = .init()
    }
}

extension GTInfo {
    struct Item: Codable {
        var tag: String? = .init()
        var gameMode: GameMode? = .init()
        var maxLosses: Int? = .init()
        var minExpLevel: Int? = .init()
        var tournamentLevel: Int? = .init()
        var title: String? = .init()
        var startTime: String? = .init()
        var endTime: String? = .init()
        var maxTopRewardRank: Int? = .init()
        var milestoneRewards: [Reward]? = .init()
        var freeTierRewards: [Reward]? = .init()
        var topRankReward: [Reward]? = .init()
    }
}

extension GTInfo {
    struct GameMode: Codable {
        var id: Int? = .init()
        var name: String? = .init()
    }
}

extension GTInfo {
    struct Reward: Codable {
        var chest: String? = .init()
        var rarity: String? = .init()
        var resource: String? = .init()
        var type: String? = .init()
        var amount: Int? = .init()
        var card: Card? = .init()
        var wins: Int? = .init()
    }
}

extension GTInfo {
    struct Card: Codable {
        var iconUrls: IconUrls? = .init()
        var name: String? = .init()
        var id: Int? = .init()
        var maxLevel: Int? = .init()
    }
}

extension GTInfo {
    struct IconUrls: Codable {
        var medium: String? = .init()
    }
}

extension GTInfo: DecodeConvertible {
    func convertAfterDecode() -> OAPI.Models.GTInfo {
        
        let returni = OAPI.Models.GTInfo
            .init(items: self.items?.map { item in
                OfficialAPI.Models.GlobalTourneyInfo.Item
                    .init(tag: item.tag ?? .init(),
                          gameMode: .init(id: item.gameMode?.id ?? .init(),
                                          name: item.gameMode?.name ?? .init()),
                          maxLosses: item.maxLosses ?? .init(),
                          minExpLevel: item.minExpLevel ?? .init(),
                          tournamentLevel: item.tournamentLevel ?? .init(),
                          title: item.title ?? .init(),
                          startTime: item.startTime ?? .init(),
                          endTime: item.endTime ?? .init(),
                          maxTopRewardRank: item.maxTopRewardRank ?? .init(),
                          milestoneRewards: item.milestoneRewards?.map { reward in
                            OfficialAPI.Models.GlobalTourneyInfo.Reward
                                .init(chest: reward.chest ?? .init(),
                                      rarity: reward.rarity ?? .init(),
                                      resource: reward.resource ?? .init(),
                                      type: reward.type ?? .init(),
                                      amount: reward.amount ?? .init(),
                                      card: .init(iconUrls:
                                                    .init(medium: reward.card?.iconUrls?.medium ?? .init()),
                                                  name: reward.card?.name ?? .init(),
                                                  id: reward.card?.id ?? .init(),
                                                  maxLevel: reward.card?.maxLevel ?? .init()),
                                      wins: reward.wins ?? .init())
                          } ?? [],
                          freeTierRewards: item.freeTierRewards?.map { reward in
                            OfficialAPI.Models.GlobalTourneyInfo.Reward
                                .init(chest: reward.chest ?? .init(),
                                      rarity: reward.rarity ?? .init(),
                                      resource: reward.resource ?? .init(),
                                      type: reward.type ?? .init(),
                                      amount: reward.amount ?? .init(),
                                      card: .init(iconUrls:
                                                    .init(medium: reward.card?.iconUrls?.medium ?? .init()),
                                                  name: reward.card?.name ?? .init(),
                                                  id: reward.card?.id ?? .init(),
                                                  maxLevel: reward.card?.maxLevel ?? .init()),
                                      wins: reward.wins ?? .init())
                          } ?? [],
                          topRankReward: item.topRankReward?.map { reward in
                            OfficialAPI.Models.GlobalTourneyInfo.Reward
                                .init(chest: reward.chest ?? .init(),
                                      rarity: reward.rarity ?? .init(),
                                      resource: reward.resource ?? .init(),
                                      type: reward.type ?? .init(),
                                      amount: reward.amount ?? .init(),
                                      card: .init(iconUrls:
                                                    .init(medium: reward.card?.iconUrls?.medium ?? .init()),
                                                  name: reward.card?.name ?? .init(),
                                                  id: reward.card?.id ?? .init(),
                                                  maxLevel: reward.card?.maxLevel ?? .init()),
                                      wins: reward.wins ?? .init())
                          } ?? [])
            } ?? [])
        
        return returni
    }
}
