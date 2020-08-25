//
//  GlobalTourneyInfo.swift
//  iOS
//
//  Created by Mohammad on 7/7/20.
//

import Foundation

private typealias GTInfo = OAPI.Models.GTInfo

extension OAPI.Models {
    typealias GTInfo = GlobalTourneyInfo
    
    struct GlobalTourneyInfo {
        var items: [Item] = .init()
    }
}

extension GTInfo {
    struct Item {
        var tag: String = .init()
        var gameMode: GameMode = .init()
        var maxLosses: Int = .init()
        var minExpLevel: Int = .init()
        var tournamentLevel: Int = .init()
        var title: String = .init()
        var startTime: String = .init()
        var endTime: String = .init()
        var maxTopRewardRank: Int = .init()
        var milestoneRewards: [Reward] = .init()
        var freeTierRewards: [Reward] = .init()
        var topRankReward: [Reward] = .init()
    }
}

extension GTInfo {
    struct GameMode {
        var id: Int = .init()
        var name: String = .init()
    }
}

extension GTInfo {
    struct Reward {
        var chest: String = .init()
        var rarity: String = .init()
        var resource: String = .init()
        var type: String = .init()
        var amount: Int = .init()
        var card: Card = .init()
        var wins: Int = .init()
    }
}

extension GTInfo {
    struct Card {
        var iconUrls: IconUrls = .init()
        var name: String = .init()
        var id: Int = .init()
        var maxLevel: Int = .init()
    }
}

extension GTInfo {
    struct IconUrls {
        var medium: String = .init()
    }
}

