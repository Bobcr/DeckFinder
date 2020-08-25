//
//  PlayerChests.swift
//  iOS
//
//  Created by Mohammad on 7/7/20.
//

import Foundation

extension OAPI.Models {
    struct PlayerChests {
        var items: [Chest] = .init()
    }
}

extension OAPI.Models.PlayerChests {
    struct Chest {
        var index: Int = .init()
        var name: String = .init()
    }
}
