import Foundation

extension Array: DecodeConvertible {
    // this is for API requests, won't be needed in any other places
    func actionsToBeTakenAfterCompletion(datas: DatasEnvObj, arg: String) {
        if Element.self == OAPI.Models.PlayerBattle.self,
           let data = self as? [OAPI.Models.PlayerBattle] {
            datas.playerBattles.set(to: data.populate())
        }
        else if Element.self == RAAPI.Models.Leaderboards.DecodeItem.self,
                let data = self as? [RAAPI.Models.Leaderboards.DecodeItem] {
            let data = data.convertToLeaderboards(arg: arg)
            datas.raLeaderboards.set(to: data)
        }
        else if Element.self == RAAPI.Models.PlayerNameSearch.DecodeModel.self,
                let data = self as? [RAAPI.Models.PlayerNameSearch.DecodeModel] {
            let nameSearchData = data.convertToPlayerNameSearch()
            datas.playerNameSearch.set(to: nameSearchData)
        }
        else if Element.self == DeckWalletCategory.self,
                let _ = self as? [DeckWalletCategory] {
            return
        }
    }
}

extension Array where Element == OAPI.Models.PlayerProfile.ProfileCard {
    func removeUnknownCards() -> Self {
        return self.filter{$0.enumValue != .unknownCard}
    }
}


extension Array {
    func removeAtIndex(index: Int) -> Self {
        
        var newArray = Self()
        
        if self.count > index {
            for idx in self.indices {
                if idx != index {
                    newArray.append(self[idx])
                }
            }
            
            return newArray
        }
        else {
            return self
        }
    }
    
    func addAtIndex(value: Element, index: Int) -> Self {
        
        var newArray: Array  = []
        var addedCount = 0
        
        if self.count+1 > index {
            for idx in 0...self.count {
                
                if idx != index {
                    newArray.append(self[idx-addedCount])
                }
                else {
                    newArray.append(value)
                    addedCount += 1
                }
            }
            
            return newArray
        }
        else {
            return []
        }
    }
}
