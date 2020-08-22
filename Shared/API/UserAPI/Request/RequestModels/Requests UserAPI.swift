import SwiftUI

extension Requests {
    struct LoginUser: EnvironmentFriendly {
        var datas: DatasEnvObj
        var appearance: AppearanceEnvObj
        var siwaDTO: UserAPI.SIWADTO
    }
}

extension Requests {
    struct SignOutUser: EnvironmentFriendly {
        var datas: DatasEnvObj
        var appearance: AppearanceEnvObj
    }
}

extension Requests {
    struct DeleteUser: EnvironmentFriendly {
        var datas: DatasEnvObj
        var appearance: AppearanceEnvObj
        var appleIdentifier: String
    }
}

extension Requests {
    struct DeleteUserDecks: EnvironmentFriendly {
        var datas: DatasEnvObj
        var appearance: AppearanceEnvObj
    }
}

extension Requests {
    struct SaveUserDecks: EnvironmentFriendly {
        
        enum SaveUserDecksMode: String {
            case add = "add"
            case replace = "replace"
        }
        
        var datas: DatasEnvObj
        var appearance: AppearanceEnvObj
        var deckCategories: UserAPI.DeckWalletCategories
        var mode: SaveUserDecksMode
    }
}

extension Requests {
    struct GetUserDecks: EnvironmentFriendly {
        var datas: DatasEnvObj
        var appearance: AppearanceEnvObj
    }
}

extension Requests {
    struct CheckForUserDecksUpdate: EnvironmentFriendly {
        var datas: DatasEnvObj
        var appearance: AppearanceEnvObj
        var deckCategories: UserAPI.DeckWalletCategories
    }
}
