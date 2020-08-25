//
//  GlobalTourneyInfo.swift
//  iOS
//
//  Created by Mohammad on 7/7/20.
//

import Foundation
import SwiftUI

private typealias GTInfo = OAPI.CodableModels.GTInfo

extension OAPI.CodableModels {
    typealias GTInfo = GlobalTourneyInfo
    
    struct GlobalTourneyInfo: Codable, EmptyInitializable {
        @DecodeNilable var items: [Item] = .init()
    }
}

extension GTInfo {
    struct Item: Codable, EmptyInitializable {
        @DecodeNilable var tag: String = .init()
        @DecodeNilable var gameMode: GameMode = .init()
        @DecodeNilable var maxLosses: Int = .init()
        @DecodeNilable var minExpLevel: Int = .init()
        @DecodeNilable var tournamentLevel: Int = .init()
        @DecodeNilable var title: String = .init()
        @DecodeNilable var startTime: String = .init()
        @DecodeNilable var endTime: String = .init()
        @DecodeNilable var maxTopRewardRank: Int = .init()
        @DecodeNilable var milestoneRewards: [Reward] = .init()
        @DecodeNilable var freeTierRewards: [Reward] = .init()
        @DecodeNilable var topRankReward: [Reward] = .init()
    }
}

extension GTInfo {
    struct GameMode: Codable, EmptyInitializable {
        @DecodeNilable var id: Int = .init()
        @DecodeNilable var name: String = .init()
    }
}

extension GTInfo {
    struct Reward: Codable, EmptyInitializable {
        @DecodeNilable var chest: String = .init()
        @DecodeNilable var rarity: String = .init()
        @DecodeNilable var resource: String = .init()
        @DecodeNilable var type: String = .init()
        @DecodeNilable var amount: Int = .init()
        @DecodeNilable var card: Card = .init()
        @DecodeNilable var wins: Int = .init()
    }
}

extension GTInfo {
    struct Card: Codable, EmptyInitializable {
        @DecodeNilable var iconUrls: IconUrls = .init()
        @DecodeNilable var name: String = .init()
        @DecodeNilable var id: Int = .init()
        @DecodeNilable var maxLevel: Int = .init()
    }
}

extension GTInfo {
    struct IconUrls: Codable, EmptyInitializable {
        @DecodeNilable var medium: String = .init()
    }
}

extension GTInfo: DecodeConvertible {
    func convertAndSave(datas: DatasEnvObj) {
        
        datas.gtInfo.wrappedValue = OAPI.Models.GTInfo
            .init(items: self.items.map { item in
                OfficialAPI.Models.GlobalTourneyInfo.Item
                    .init(tag: item.tag,
                          gameMode: .init(id: item.gameMode.id,
                                          name: item.gameMode.name),
                          maxLosses: item.maxLosses,
                          minExpLevel: item.minExpLevel,
                          tournamentLevel: item.tournamentLevel,
                          title: item.title,
                          startTime: item.startTime,
                          endTime: item.endTime,
                          maxTopRewardRank: item.maxTopRewardRank,
                          milestoneRewards: item.milestoneRewards.map { reward in
                            OfficialAPI.Models.GlobalTourneyInfo.Reward
                                .init(chest: reward.chest,
                                      rarity: reward.rarity,
                                      resource: reward.resource,
                                      type: reward.type,
                                      amount: reward.amount,
                                      card: .init(iconUrls:
                                                    .init(medium: reward.card.iconUrls.medium),
                                                  name: reward.card.name,
                                                  id: reward.card.id,
                                                  maxLevel: reward.card.maxLevel),
                                      wins: reward.wins)
                          },
                          freeTierRewards: item.freeTierRewards.map { reward in
                            OfficialAPI.Models.GlobalTourneyInfo.Reward
                                .init(chest: reward.chest,
                                      rarity: reward.rarity,
                                      resource: reward.resource,
                                      type: reward.type,
                                      amount: reward.amount,
                                      card: .init(iconUrls:
                                                    .init(medium: reward.card.iconUrls.medium),
                                                  name: reward.card.name,
                                                  id: reward.card.id,
                                                  maxLevel: reward.card.maxLevel),
                                      wins: reward.wins)
                          },
                          topRankReward: item.topRankReward.map { reward in
                            OfficialAPI.Models.GlobalTourneyInfo.Reward
                                .init(chest: reward.chest,
                                      rarity: reward.rarity,
                                      resource: reward.resource,
                                      type: reward.type,
                                      amount: reward.amount,
                                      card: .init(iconUrls:
                                                    .init(medium: reward.card.iconUrls.medium),
                                                  name: reward.card.name,
                                                  id: reward.card.id,
                                                  maxLevel: reward.card.maxLevel),
                                      wins: reward.wins)
                          })
            })
        
    }
}
