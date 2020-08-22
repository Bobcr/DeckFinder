import Foundation

private typealias SearchedPlayers = GeneralModels.Players.SearchedPlayers

extension GeneralModels.Players {
    struct SearchedPlayers: Codable, Equatable {
        
        var name: String
        var tag: String
        var clanName: String
        var clanTag: String
        var clanBadgeName: String
        var searchCount: Int
    }
}

extension SearchedPlayers {
    static func save(searchedPlayers: [Self]) {
        
        let encoder = JSONEncoder()
        
        if let encodedData = try? encoder.encode(searchedPlayers) {
            UD.standardSet(encodedData, forKey: .playersSavedPlayersData)
        }
    }
}

extension SearchedPlayers {
    static func getAll() -> [Self] {
        
        if let savedData = UD.standardValue(forKey: .playersSavedPlayersData) as? Data {
            let decoder = JSONDecoder()
            
            if let decodedData = try? decoder.decode([Self].self, from: savedData) {
                return decodedData
            }
        }
        
        return []
    }
}

extension SearchedPlayers {
    static func add(searchedPlayer: Self) {
        
        var searchedPlayer = searchedPlayer
        var all = getAll()
        var searchCount = 1
        
        if let firstIndex = (all.firstIndex { $0.tag == searchedPlayer.tag }) {
            searchCount = all[firstIndex].searchCount + 1
            all.remove(at: firstIndex)
        }
        
        searchedPlayer.searchCount = searchCount
        all.append(searchedPlayer)
        
        if all.count > 200 {
            all = all.dropLast()
        }
        
        save(searchedPlayers: all)
    }
}

extension SearchedPlayers {
    static func delete(tag: String) {
        
        var all = getAll()
        
        if let firstIndex = (all.firstIndex { $0.tag == tag }) {
            all.remove(at: firstIndex)
        }
        
        save(searchedPlayers: all)
    }
}

extension SearchedPlayers {
    func delete() {
        Self.delete(tag: self.tag)
    }
}
