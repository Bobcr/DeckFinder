//
//  PlayerChests.swift
//  iOS
//
//  Created by Mohammad on 7/7/20.
//

import Foundation

extension OAPI.CodableModels {
    struct PlayerChests: Codable {
        var items: [Chest]? = .init()
    }
}

extension OAPI.CodableModels.PlayerChests {
    struct Chest: Codable {
        var index: Int? = .init()
        var name: String? = .init()
    }
}

extension OAPI.CodableModels.PlayerChests: DecodeConvertible {
    func convertAfterDecode() -> OAPI.Models.PlayerChests {
        var returni = OAPI.Models.PlayerChests()
        
        returni.items = self.items?.map {
            .init(index: $0.index ?? .init(),
                  name: $0.name ?? .init())
        } ?? []
        
        return returni
    }
}
