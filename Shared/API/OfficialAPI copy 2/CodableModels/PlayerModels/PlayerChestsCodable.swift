//
//  PlayerChests.swift
//  iOS
//
//  Created by Mohammad on 7/7/20.
//

import Foundation
import SwiftUI

extension OAPI.CodableModels {
    struct PlayerChests: Codable, EmptyInitializable {
        @DecodeNilable var items: [Chest] = .init()
    }
}

extension OAPI.CodableModels.PlayerChests {
    struct Chest: Codable, EmptyInitializable {
        @DecodeNilable var index: Int = .init()
        @DecodeNilable var name: String = .init()
    }
}

extension OAPI.CodableModels.PlayerChests: DecodeConvertible {
    func convertAndSave(datas: DatasEnvObj) {
        
        datas.playerChests.items.wrappedValue = self.items.map {
            .init(index: $0.index,
                  name: $0.name)
        }
        
    }
}
