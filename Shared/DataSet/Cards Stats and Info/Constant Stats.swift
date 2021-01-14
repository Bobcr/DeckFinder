import Foundation

extension DataSet.Cards {
    var constantStats: ConstantStats {
        switch self {
        case .unknownCard: return ConstantStats()
        case .skeletons: return ConstantStats(elixir: 1, hitSpeed: 1, targets: "Ground", speed: "Fast", range: "Melee: Short", count: 3)
        case .iceSpirit: return ConstantStats(elixir: 1, targets: "Air & Ground", speed: "Very Fast", range: "2.5", freezeDuration: 1)
        case .mirror: return ConstantStats()
        case .healSpirit: return ConstantStats(elixir: 1, targets: "Air & Ground", speed: "Very Fast", range: "2.5")
        case .goblins: return ConstantStats(elixir: 2, hitSpeed: 1.1, targets: "Ground", speed: "Very Fast", range: "Melee: Short", count: 3)
        case .spearGoblins: return ConstantStats(elixir: 2, hitSpeed: 1.7, targets: "Air & Ground", speed: "Very Fast", range: "5", count: 3)
        case .fireSpirits: return ConstantStats(elixir: 2, targets: "Air & Ground", speed: "Very Fast", range: "2", count: 3)
        case .iceGolem: return ConstantStats(elixir: 2, hitSpeed: 2.5, targets: "Buildings", speed: "Slow", range: "Melee: Short")
        case .bats: return ConstantStats(elixir: 2, hitSpeed: 1.3, targets: "Air & Ground", speed: "Very Fast", range: "Melee: Medium", count: 5)
        case .rage: return ConstantStats(elixir: 2, radius: 5, boost: "+35%")
        case .zap: return ConstantStats(elixir: 2, stunDuration: 0.5, radius: 2.5)
        case .theLog: return ConstantStats(elixir: 2, targets: "Ground", range: "10.1", width: 3.9)
        case .barbarianBarrel: return ConstantStats(elixir: 2, targets: "Ground", range: "5", width: 2.6)
        case .giantSnowball: return ConstantStats(elixir: 2, radius: 2.5, slowdownDuration: 2.5)
        case .knight: return ConstantStats(elixir: 3, hitSpeed: 1.2, targets: "Ground", speed: "Medium", range: "Melee: Medium")
        case .archers: return ConstantStats(elixir: 3, hitSpeed: 1.2, targets: "Air & Ground", speed: "Medium", range: "5", count: 2)
        case .minions: return ConstantStats(elixir: 3, hitSpeed: 1, targets: "Air & Ground", speed: "Fast", range: "Melee: Long", count: 3)
        case .skeletonArmy: return ConstantStats(elixir: 3, subTroopsCount: 15)
        case .bomber: return ConstantStats(elixir: 3, hitSpeed: 1.8, targets: "Ground", speed: "Medium", range: "5")
        case .iceWizard: return ConstantStats(elixir: 3, hitSpeed: 1.7, targets: "Air & Ground", speed: "Medium", range: "5.5", slowdownDuration: 2.5)
        case .firecracker: return ConstantStats(elixir: 3, hitSpeed: 3, targets: "Air & Ground", speed: "Fast", range: "6")
        case .guards: return ConstantStats(elixir: 3, hitSpeed: 1, targets: "Ground", speed: "Fast", range: "Melee: Long", count: 3)
        case .princess: return ConstantStats(elixir: 3, hitSpeed: 3, targets: "Air & Ground", speed: "Medium", range: "9")
        case .miner: return ConstantStats(elixir: 3, hitSpeed: 1.2, targets: "Ground", speed: "Fast", range: "Melee: Medium")
        case .megaMinion: return ConstantStats(elixir: 3, hitSpeed: 1.6, targets: "Air & Ground", speed: "Medium", range: "Melee: Long")
        case .dartGoblin: return ConstantStats(elixir: 3, hitSpeed: 0.7, targets: "Air & Ground", speed: "Very Fast", range: "6.5")
        case .goblinGang: return ConstantStats(elixir: 3, subTroopsCount: 5)
        case .bandit: return ConstantStats(elixir: 3, hitSpeed: 1, targets: "Ground", speed: "Fast", range: "Melee: Short", dashRange: "3.5_6")
        case .royalGhost: return ConstantStats(elixir: 3, hitSpeed: 1.8, targets: "Ground", speed: "Fast", range: "Melee: Medium")
        case .skeletonBarrel: return ConstantStats(elixir: 3, targets: "Buildings", speed: "Fast", subTroopsCount: 7)
        case .wallBreakers: return ConstantStats(elixir: 2, targets: "Buildings", speed: "Very Fast", range: "Melee: Short", count: 2)
        case .cannon: return ConstantStats(elixir: 3, hitSpeed: 1, targets: "Ground", range: "5.5", lifetime: 30)
        case .tombstone: return ConstantStats(elixir: 3, lifetime: 40, spawnSpeed: 3.1)
        case .arrows: return ConstantStats(elixir: 3, radius: 4)
        case .goblinBarrel: return ConstantStats(elixir: 3, radius: 1.5, subTroopsCount: 3)
        case .tornado: return ConstantStats(elixir: 3, radius: 5.5, targets: "Troops", duration: 1)
        case .clone: return ConstantStats(elixir: 3, radius: 3, cloneHitpoints: 1, cloneShieldHitpoints: 1)
        case .earthquake: return ConstantStats(elixir: 3, slowdown: "_50%")
        case .elixirGolem: return ConstantStats(elixir: 3, hitSpeed: 1.3, targets: "Buildings", speed: "Slow", range: "Melee: Short")
        case .valkyrie: return ConstantStats(elixir: 4, hitSpeed: 1.5, targets: "Ground", speed: "Medium", range: "Melee: Medium")
        case .musketeer: return ConstantStats(elixir: 4, hitSpeed: 1.1, targets: "Air & Ground", speed: "Medium", range: "6")
        case .babyDragon: return ConstantStats(elixir: 4, hitSpeed: 1.5, targets: "Air & Ground", speed: "Fast", range: "3.5")
        case .miniPekka: return ConstantStats(elixir: 4, hitSpeed: 1.7, targets: "Ground", speed: "Fast", range: "Melee: Short")
        case .hogRider: return ConstantStats(elixir: 4, hitSpeed: 1.6, targets: "Buildings", speed: "Very Fast", range: "Mellee: Short")
        case .darkPrince: return ConstantStats(elixir: 4, hitSpeed: 1.3, targets: "Ground", speed: "Medium", range: "Melee: Medium")
        case .lumberjack: return ConstantStats(elixir: 4, hitSpeed: 0.8, targets: "Ground", speed: "Very Fast", range: "Melee: Short")
        case .battleRam: return ConstantStats(elixir: 4, targets: "Buildings", speed: "Medium", range: "Melee: Short")
        case .infernoDragon: return ConstantStats(elixir: 4, hitSpeed: 0.4, targets: "Air & Ground", speed: "Medium", range: "3.5")
        case .electroWizard: return ConstantStats(elixir: 4, stunDuration: 0.5, hitSpeed: 1.8, targets: "Air & Ground", range: "5")
        case .hunter: return ConstantStats(elixir: 4, hitSpeed: 2.2, targets: "Air & Ground", speed: "Medium", range: "4", projectileRange: 6.5)
        case .nightWitch: return ConstantStats(elixir: 4, hitSpeed: 1.5, targets: "Ground", speed: "Medium", range: "Melee: Long", spawnSpeed: 7)
        case .zappies: return ConstantStats(elixir: 4, stunDuration: 0.5, hitSpeed: 2.1, targets: "Air & Ground", speed: "Medium", range: "4.5", count: 3)
        case .flyingMachine: return ConstantStats(elixir: 4, hitSpeed: 1.1, targets: "Air & Ground", speed: "Fast", range: "6")
        case .fisherman: return ConstantStats(elixir: 3, hitSpeed: 1.3, targets: "Ground", speed: "Medium", range: "Melee: Medium", rangedAttackRange: "3.5_6")
        case .magicArcher: return ConstantStats(elixir: 4, hitSpeed: 1.1, targets: "Air & Ground", speed: "Medium", range: "7", projectileRange: 11)
        case .mortar: return ConstantStats(elixir: 4, hitSpeed: 5, targets: "Ground", range: "11.5", lifetime: 30, deployTime: 3.5)
        case .bombTower: return ConstantStats(elixir: 4, hitSpeed: 1.6, targets: "Ground", range: "6", lifetime: 25)
        case .tesla: return ConstantStats(elixir: 4, hitSpeed: 1.1, targets: "Air & Ground", range: "5.5", lifetime: 35)
        case .furnace: return ConstantStats(elixir: 4, lifetime: 50, spawnSpeed: 10)
        case .goblinCage: return ConstantStats(elixir: 4, lifetime: 20, subTroopsCount: 1)
        case .fireball: return ConstantStats(elixir: 4, radius: 2.5)
        case .freeze: return ConstantStats(elixir: 4, radius: 3, freezeDuration: 4)
        case .poison: return ConstantStats(elixir: 4, radius: 3.5, duration: 8)
        case .battleHealer: return ConstantStats(elixir: 4, hitSpeed: 1.5, targets: "Ground", speed: "Medium", range: "Melee: Long")
        case .giant: return ConstantStats(elixir: 5, hitSpeed: 1.5, targets: "Buildings", speed: "Slow")
        case .balloon: return ConstantStats(elixir: 5, hitSpeed: 3, targets: "Buidlings", speed: "Medium", range: "Melee: Short")
        case .witch: return ConstantStats(elixir: 5, hitSpeed: 1.1, targets: "Air & Ground", speed: "Medium", range: "5", spawnSpeed: 7)
        case .barbarians: return ConstantStats(elixir: 5, hitSpeed: 1.4, targets: "Ground", speed: "Medium", range: "Melee: Short", count: 5)
        case .prince: return ConstantStats(elixir: 5, hitSpeed: 1.4, targets: "Ground", speed: "Medium", range: "Melee: Long")
        case .wizard: return ConstantStats(elixir: 5, hitSpeed: 1.4, targets: "Air & Ground", speed: "Medium", range: "5.5")
        case .minionHorde: return ConstantStats(elixir: 5, hitSpeed: 1, targets: "Air & Ground", speed: "Fast", range: "Melee: Long", count: 6)
        case .bowler: return ConstantStats(elixir: 5, hitSpeed: 2.5, targets: "Ground", speed: "Slow", range: "4", projectileRange: 7.5)
        case .executioner: return ConstantStats(elixir: 5, hitSpeed: 2.4, targets: "Air & Ground", speed: "Medium", range: "4.5", projectileRange: 6.5)
        case .ramRider: return ConstantStats(elixir: 5, hitSpeed: 1.8, targets: "Buildings", speed: "Medium", range: "Melee: Short", subTroopsCount: 1)
        case .rascals: return ConstantStats(elixir: 5, subTroopsCount: 3)
        case .cannonCart: return ConstantStats(elixir: 5, hitSpeed: 1, targets: "Ground", speed: "Fast", range: "5.5")
        case .royalHogs: return ConstantStats(elixir: 5, hitSpeed: 1.2, targets: "Buildings", speed: "Very Fast", range: "Melee: Short", count: 4)
        case .electroDragon: return ConstantStats(elixir: 5, stunDuration: 0.5, hitSpeed: 2.1, targets: "Air & Ground", speed: "Medium", range: "3.5")
        case .goblinHut: return ConstantStats(elixir: 5, lifetime: 40, spawnSpeed: 4.5)
        case .infernoTower: return ConstantStats(elixir: 5, hitSpeed: 0.4, targets: "Air & Ground", range: "6", lifetime: 30)
        case .graveyard: return ConstantStats(elixir: 5, radius: 4, duration: 10, spawnSpeed: 0.5)
        case .giantSkeleton: return ConstantStats(elixir: 6, hitSpeed: 1.5, targets: "Ground", speed: "Medium", range: "Melee: Short")
        case .royalGiant: return ConstantStats(elixir: 6, hitSpeed: 1.7, targets: "Buildings", speed: "Slow", range: "5")
        case .sparky: return ConstantStats(elixir: 6, hitSpeed: 4, targets: "Ground", speed: "Slow", range: "5")
        case .eliteBarbarians: return ConstantStats(elixir: 6, hitSpeed: 1.5, targets: "Ground", speed: "Fast", range: "Melee: Medium", count: 2)
        case .goblinGiant: return ConstantStats(elixir: 6, hitSpeed: 1.5, targets: "Buildings", speed: "Medium", range: "Melee: Medium", subTroopsCount: 2)
        case .elixirCollector: return ConstantStats(elixir: 6, lifetime: 70, productionSpeed: 8.5)
        case .xBow: return ConstantStats(elixir: 6, hitSpeed: 0.3, targets: "Ground", range: "11.5", lifetime: 30, deployTime: 3.5)
        case .rocket: return ConstantStats(elixir: 6, radius: 2)
        case .lightning: return ConstantStats(elixir: 6, stunDuration: 0.5, radius: 3.5, count: 3)
        case .pekka: return ConstantStats(elixir: 6, hitSpeed: 1.8, targets: "Ground", speed: "Slow", range: "Melee: Medium")
        case .lavaHound: return ConstantStats(elixir: 6, hitSpeed: 1.3, targets: "Buildings", speed: "Slow", range: "2")
        case .royalRecruits: return ConstantStats(elixir: 7, hitSpeed: 1.3, targets: "Ground", speed: "Medium", range: "Melee: Long", count: 6)
        case .megaKnight: return ConstantStats(elixir: 7, hitSpeed: 1.7, targets: "Ground", speed: "Medium", range: "Melee: Medium", dashRange: "3.5_5")
        case .barbarianHut: return ConstantStats(elixir: 7, lifetime: 60, spawnSpeed: 14)
        case .golem: return ConstantStats(elixir: 8, hitSpeed: 2.5, targets: "Buildings", speed: "Slow", range: "Melee: Short", deployTime: 3)
        case .threeMusketeers: return ConstantStats(elixir: 9, hitSpeed: 1.1, targets: "Air & Ground", speed: "Medium", range: "6", deployTime: 2, count: 3)
        case .royalDelivery: return ConstantStats(elixir: 3, radius: 3, duration: 2, subTroopsCount: 1)
        case .skeletonDragons: return ConstantStats(elixir: 4, hitSpeed: 1.9, speed: "Fast", range: "3.5", count: 2)
        case .electroGiant: return ConstantStats(elixir: 8, stunDuration: 0.5, radius: 2.5, hitSpeed: 2.1, targets: "Buildings", speed: "Slow")
        case .electroSpirit: return ConstantStats(elixir: 1, stunDuration: 0.5, targets: "Air & Ground", speed: "Very Fast", range: "2.5")
        case .motherWitch: return ConstantStats(elixir: 4, hitSpeed: 1.2, targets: "Air & Ground", speed: "Medium", range: "5.5", duration: 5)
        }
    }
}

// these are to change constant stats to a user-readeable form
// that i can make the UI with

extension DataSet.CardConstantStats {
    func convertToKeyValuePairs() -> [StringStringPair] {
        let values = constantStatsValues(stats: self)
        let keys = constantStatsKeys(stats: self)
        
        var keyValuePairs = [StringStringPair]()
        
        for (idx, value) in values.enumerated() {
            keyValuePairs.append(.init(key: keys[idx], value: value))
        }
        
        return keyValuePairs
    }
}

private func constantStatsValues(stats: DataSet.CardConstantStats) -> [String] {
    
    var values = [Int(stats.elixir).description]
    
    let appendDoubleToArray: (Double) -> () = {
        if $0 != 0 {
            if $0.truncatingRemainder(dividingBy: 1) == 0 {
                values.append("\(Int($0))")
            }
            else {
                values.append("\($0)")
            }
        }
    }
    
    appendDoubleToArray(stats.stunDuration)
    appendDoubleToArray(stats.radius)
    appendDoubleToArray(stats.hitSpeed)
    values.append(stats.targets)
    values.append(stats.speed)
    values.append(stats.range)
    appendDoubleToArray(stats.projectileRange)
    appendDoubleToArray(stats.duration)
    values.append(stats.dashRange)
    appendDoubleToArray(stats.freezeDuration)
    appendDoubleToArray(stats.slowdownDuration)
    appendDoubleToArray(stats.lifetime)
    appendDoubleToArray(stats.spawnSpeed)
    appendDoubleToArray(stats.productionSpeed)
    appendDoubleToArray(stats.width)
    values.append(stats.boost)
    appendDoubleToArray(stats.deployTime)
    values.append(stats.rangedAttackRange)
    appendDoubleToArray(stats.count)
    appendDoubleToArray(stats.subTroopsCount)
    appendDoubleToArray(stats.cloneHitpoints)
    appendDoubleToArray(stats.cloneShieldHitpoints)
    values.append(stats.slowdown)
    
    values.removeAll{ $0 == "" }
    
    return values
}

private func constantStatsKeys(stats: DataSet.CardConstantStats) -> [String] {
    
    var keys: [String] = []
    
    keys.append("Elixir")
    
    if stats.stunDuration != .init() { keys.append("Stun Duration") }
    if stats.radius != .init() { keys.append("Radius") }
    if stats.hitSpeed != .init() { keys.append("Hit Speed") }
    if stats.targets != .init() { keys.append("Targets") }
    if stats.speed != .init() { keys.append("Speed") }
    if stats.range != .init() { keys.append("Range") }
    if stats.projectileRange != .init() { keys.append("Projectile Range") }
    if stats.duration != .init() { keys.append("Duration") }
    if stats.dashRange != .init() { keys.append("Dash Range") }
    if stats.freezeDuration != .init() { keys.append("Freeze Duration") }
    if stats.slowdownDuration != .init() { keys.append("Slowdown Duration") }
    if stats.lifetime != .init() { keys.append("Lifetime") }
    if stats.spawnSpeed != .init() { keys.append("Spawn Speed") }
    if stats.productionSpeed != .init() { keys.append("Production Speed") }
    if stats.width != .init() { keys.append("Width") }
    if stats.boost != .init() { keys.append("Boost") }
    if stats.deployTime != .init() { keys.append("Deploy Time") }
    if stats.rangedAttackRange != .init() { keys.append("Ranged Attack Range") }
    if stats.count != .init() { keys.append("Count") }
    if stats.subTroopsCount != .init() { keys.append("SubTroops Count") }
    if stats.cloneHitpoints != .init() { keys.append("Clone Hitpoints") }
    if stats.cloneShieldHitpoints != .init() { keys.append("Clone Shield Hitpoints") }
    if stats.slowdown != .init() { keys.append("Slowdown") }
    
    return keys
}

extension DataSet.CardConstantStats {
    func imageIconNames() -> [String] {
        let stats = self
        var imageIconNames = ["elixir"]
        
        if stats.stunDuration != .init() { imageIconNames.append("boost-freeze") }
        if stats.radius != .init() { imageIconNames.append("radius") }
        if stats.hitSpeed != .init() { imageIconNames.append("dmg-speed") }
        if stats.targets != .init() { imageIconNames.append("target") }
        if stats.speed != .init() { imageIconNames.append("speed") }
        if stats.range != .init() { imageIconNames.append("range") }
        if stats.projectileRange != .init() { imageIconNames.append("range") }
        if stats.duration != .init() { imageIconNames.append("deploy-time") }
        if stats.dashRange != .init() { imageIconNames.append("dash-range") }
        if stats.freezeDuration != .init() { imageIconNames.append("boost-freeze") }
        if stats.slowdownDuration != .init() { imageIconNames.append("boost-freeze") }
        if stats.lifetime != .init() { imageIconNames.append("deploy-time") }
        if stats.spawnSpeed != .init() { imageIconNames.append("dmg") }
        if stats.productionSpeed != .init() { imageIconNames.append("deploy-time") }
        if stats.width != .init() { imageIconNames.append("radius") }
        if stats.boost != .init() { imageIconNames.append("strengh") }
        if stats.deployTime != .init() { imageIconNames.append("deploy-time") }
        if stats.rangedAttackRange != .init() { imageIconNames.append("range") }
        if stats.count != .init() { imageIconNames.append("troop-count") }
        if stats.subTroopsCount != .init() { imageIconNames.append("troop-count") }
        if stats.cloneHitpoints != .init() { imageIconNames.append("hp") }
        if stats.cloneShieldHitpoints != .init() { imageIconNames.append("hp") }
        if stats.slowdown != .init() { imageIconNames.append("boost-freeze") }
        
        return imageIconNames
    }
}
