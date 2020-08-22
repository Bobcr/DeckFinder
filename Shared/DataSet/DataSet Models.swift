import Foundation
import SwiftUI
import Combine

class DataSet { }

extension DataSet {
    
    enum CardRarity: String, Codable {
        case common = "Common"
        case rare = "Rare"
        case epic = "Epic"
        case legendary = "Legendary"
    }
    
    enum CardType: String, Codable {
        case troop = "Troop"
        case spell = "Spell"
        case building = "Building"
    }
    
    struct CardsInfo {
        var arena: Int
        var description: String
        var elixir: Int
        var id: Int
        var key: String
        var name: String
        var rarity: CardRarity
        var type: CardType
        var starLevels: Int
    }
    
    struct ClanBadge {
        var id: Int
        var name: String
        var category: String
    }
    
    struct CardVariableStats {
        var hitpoints: Int = 0
        var shieldHitpoints: Int = 0
        var damage: Int = 0
        var expDamage: String = ""
        var areaDamage: Int = 0
        var rangedDamage: Int = 0
        var damagePerSecond: Int = 0
        var expDamagePerSecond: String = ""
        var crownTowerDamage: Int = 0
        var crownTowerDamagePerSecond: Int = 0
        var deathDamage: Int = 0
        var spawnDamage: Int = 0
        var buildingDamagePerSecond: Int = 0
        var chargeDamage: Int = 0
        var healingPerSecond: Int = 0
        var healing: Int = 0
        var subTroopsLevel: Int = 0
        var duration: Double = 0
        var clonedOrMirroredCardsLevel: Int = 0
    }
    
    struct CardConstantStats {
        var elixir: Double = 0
        var stunDuration: Double = 0
        var radius: Double = 0
        var hitSpeed: Double = 0
        var targets = ""
        var speed = ""
        var range = ""
        var projectileRange: Double = 0
        var duration: Double = 0
        var dashRange = ""
        var freezeDuration: Double = 0
        var slowdownDuration: Double = 0
        var lifetime: Double = 0
        var spawnSpeed: Double = 0
        var productionSpeed: Double = 0
        var width: Double = 0
        var boost = ""
        var deployTime: Double = 0
        var rangedAttackRange = ""
        var count: Double = 0
        var subTroopsCount: Double = 0
        var cloneHitpoints: Double = 0
        var cloneShieldHitpoints: Double = 0
        var slowdown = ""
    }
    
}

extension Array where Element == DataSet.Cards {
    func sortByElixirDescending() -> [DataSet.Cards] {
        return self.sorted {
            $0.info.elixir*10 + $0.info.rarity.int > $1.info.elixir*10 + $1.info.rarity.int
        }
    }
    
    func sortByElixirAscending() -> [DataSet.Cards] {
        return self.sorted {
            $0.info.elixir*10 + $0.info.rarity.int < $1.info.elixir*10 + $1.info.rarity.int
        }
    }
    
    func sortByRarityDescending() -> [DataSet.Cards] {
        return self.sorted {
            $0.info.elixir + $0.info.rarity.int*10 > $1.info.elixir + $1.info.rarity.int*10
        }
    }
    
    func sortByRarityAscending() -> [DataSet.Cards] {
        return self.sorted {
            $0.info.elixir + $0.info.rarity.int*10 < $1.info.elixir + $1.info.rarity.int*10
        }
    }
    
}
