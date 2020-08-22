import Foundation

private typealias SearchedClans = GeneralModels.Clans.SearchedClans

extension GeneralModels.Clans {
    struct SearchedClans: Codable, Equatable {
        
        var name: String
        var tag: String
        var badgeName: String
        var score: Int
        var searchCount: Int
    }
}

extension SearchedClans {
    static func save(searchedClans: [Self]) {
        
        let encoder = JSONEncoder()
        
        if let encodedData = try? encoder.encode(searchedClans) {
            UD.standardSet(encodedData, forKey: .clansSavedClansData)
        }
    }
}

extension SearchedClans {
    static func getAll() -> [Self] {
        
        if let savedData = UD.standardValue(forKey: .clansSavedClansData) as? Data {
            let decoder = JSONDecoder()
            
            if let decodedData = try? decoder.decode([Self].self, from: savedData) {
                return decodedData
            }
        }
        
        return []
    }
}

extension SearchedClans {
    static func add(searchedClan: Self) {
        
        var searchedClan = searchedClan
        var all = getAll()
        var searchCount = 1
        
        if let firstIndex = (all.firstIndex { $0.tag == searchedClan.tag }) {
            searchCount = all[firstIndex].searchCount + 1
            all.remove(at: firstIndex)
        }
        
        searchedClan.searchCount = searchCount
        all.append(searchedClan)
        
        if all.count > 200 {
            all = all.dropLast()
        }
        
        save(searchedClans: all)
    }
}

extension SearchedClans {
    static func delete(tag: String) {
        
        var all = getAll()
        
        if let firstIndex = (all.firstIndex { $0.tag == tag }) {
            all.remove(at: firstIndex)
        }
        
        save(searchedClans: all)
    }
}

extension SearchedClans {
    func delete() {
        Self.delete(tag: self.tag)
    }
}
