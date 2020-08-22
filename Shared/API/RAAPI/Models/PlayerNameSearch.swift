import Foundation

extension RAAPI.Models {
    struct PlayerNameSearch {
        var name = ""
        var tag = ""
        var clanName = ""
        var clanTag = ""
        var clanBadgeName = ""
        var searchCount = 0
    }
}

extension RAAPI.Models.PlayerNameSearch {
    struct DecodeModel: Codable {
        var name = ""
        var tag = ""
        var clanName = ""
        var clanTag = ""
        var clanBadgeId = 0
        var searchCount = 0
    }
}

extension Array where Element == RAAPI.Models.PlayerNameSearch.DecodeModel {
    func convertToPlayerNameSearch() -> [RAAPI.Models.PlayerNameSearch] {
        return self.map { .init(name: $0.name,
                                tag: $0.tag,
                                clanName: $0.clanName,
                                clanTag: $0.clanTag,
                                clanBadgeName: Funcs.Clan.badgeName(badgeId: $0.clanBadgeId),
                                searchCount: $0.searchCount) }
    }
}


