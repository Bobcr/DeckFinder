import Foundation

private typealias Mode = LeaderboardsBaseView.Mode

extension LeaderboardsBaseView {
    enum Mode: CaseIterable {
        case players
        case clans
        case warClans
        case globalTourney
        case grandChallengeWins
        case classicChallengeWins
        case starpoints
        case bestTrophies
        case challengeCardsWon
        case warDayWins
        case clanCardsCollected
        case battleCount
        case totalDonations
        case tournamentBattleCount
    }
}

extension Mode: Identifiable, Hashable {
    var id: String {
        switch self {
        case .players: return "players"
        case .clans: return "clans"
        case .warClans: return "warClans"
        case .globalTourney: return "globalTournament"
        case .battleCount: return "battleCount"
        case .challengeCardsWon: return "challengeCardsWon"
        case .totalDonations: return "totalDonations"
        case .clanCardsCollected: return "clanCardsCollected"
        case .warDayWins: return "warDayWins"
        case .bestTrophies: return "bestTrophies"
        case .tournamentBattleCount: return "tournamentBattleCount"
        case .starpoints: return "starpoints"
        case .grandChallengeWins: return "grandChallengeWins"
        case .classicChallengeWins: return "classicChallengeWins"
        }
    }
}

extension Mode {
    var apiEndpointValue: String {
        switch self {
        case .players: return "NotNeeded"
        case .clans: return "NotNeeded"
        case .warClans: return "NotNeeded"
        case .globalTourney: return "NotNeeded"
        case .battleCount: return "battleCount"
        case .challengeCardsWon: return "challengeCardsWon"
        case .totalDonations: return "totalDonations"
        case .clanCardsCollected: return "clanCardsCollected"
        case .warDayWins: return "warDayWins"
        case .bestTrophies: return "bestTrophies"
        case .tournamentBattleCount: return "tournamentBattleCount"
        case .starpoints: return "starpoints"
        case .grandChallengeWins: return "grandChallengeWins"
        case .classicChallengeWins: return "classicChallengeWins"
        }
    }
}

extension Mode {
    var userReadable: String {
        switch self {
        case .players: return "Players"
        case .clans: return "Clans"
        case .warClans: return "War Clans"
        case .globalTourney: return "Global Tournament"
        case .battleCount: return "Battle Count"
        case .challengeCardsWon: return "Challenge Cards Won"
        case .totalDonations: return "Donations"
        case .clanCardsCollected: return "Clan Cards Collected"
        case .warDayWins: return "WarDay Wins"
        case .bestTrophies: return "Most Trophies"
        case .tournamentBattleCount: return "Tournament Battle Count"
        case .starpoints: return "Starpoints"
        case .grandChallengeWins: return "Grand Challenge Wins"
        case .classicChallengeWins: return "Classic Challenge Wins"
        }
    }
    
}

extension Mode {
    var rankValueImageName: String {
        switch self {
        case .players: return "trophy"
        case .clans: return "trophy"
        case .warClans: return "purple-cup"
        case .globalTourney: return "global-tournament"
        case .battleCount: return "sword"
        case .challengeCardsWon: return "cards2"
        case .totalDonations: return "donation"
        case .clanCardsCollected: return "cards-tight"
        case .warDayWins: return "golden-medal"
        case .bestTrophies: return "trophy"
        case .tournamentBattleCount: return "sword"
        case .starpoints: return "star-level"
        case .grandChallengeWins: return "challenge-grand"
        case .classicChallengeWins: return "challenge-classic"
        }
    }
}

extension Mode {
    var representativeImage: String {
        switch self {
        case .players: return "trophy"
        case .clans: return "NoClan"
        case .warClans: return "clan-war-tight"
        case .globalTourney: return "global-tournament"
        case .battleCount: return "sword"
        case .challengeCardsWon: return "cards2"
        case .totalDonations: return "donation"
        case .clanCardsCollected: return "cards-tight"
        case .warDayWins: return "golden-medal"
        case .bestTrophies: return "trophy"
        case .tournamentBattleCount: return "tournament-badge"
        case .starpoints: return "star-level"
        case .grandChallengeWins: return "challenge-grand"
        case .classicChallengeWins: return "challenge-classic"
        }
    }
}

extension Mode {
    static func find(by string: String) -> Self {
        switch string {
        case let x where x.contains("Players"): return .players
        case let x where x.contains("War Clans"): return .warClans
        case let x where x.contains("Clans"): return .clans
        case "Global Tournament": return .globalTourney
        case "Battle Count": return .battleCount
        case "Challenge Cards Won": return .challengeCardsWon
        case "Donations": return .totalDonations
        case "Clan Cards Collected": return .clanCardsCollected
        case "WarDay Wins": return .warDayWins
        case "Most Trophies": return .bestTrophies
        case "Tournament Battle Count": return .tournamentBattleCount
        case "Starpoints": return .starpoints
        case "Grand Challenge Wins": return .grandChallengeWins
        case "Classic Challenge Wins": return .classicChallengeWins
        default: return .starpoints
        }
    }
}
