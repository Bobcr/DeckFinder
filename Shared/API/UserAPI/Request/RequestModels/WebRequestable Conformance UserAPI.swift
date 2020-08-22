import Foundation

extension Requests.LoginUser: WebPostable {
    typealias TypeToDecodeTo = UserAPI.LoginResponse
    
    func postableValue() -> UserAPI.SIWADTO? {
        return self.siwaDTO
    }
    
    func urlString() -> String? {
        return UserAPI.baseUrl + "siwa/authenticate"
    }
    
    static var headerMode: UserAPI.HeaderMode = .basic
}

extension Requests.SignOutUser: WebPostable {
    typealias TypeToDecodeTo = UserAPI.DontDecode
    
    func postableValue() -> UserAPI.SIWADTO? {
        return nil
    }
    
    func urlString() -> String? {
        return UserAPI.baseUrl + "signOut"
    }
    
    static var headerMode: UserAPI.HeaderMode = .bearer
}

extension Requests.DeleteUser: WebPostable {
    typealias TypeToDecodeTo = UserAPI.DontDecode
    
    func postableValue() -> UserAPI.SIWADTO? {
        return nil
    }
    
    func urlString() -> String? {
        return UserAPI.baseUrl + "delete?appleIdentifier=\(appleIdentifier)"
    }
    
    static var headerMode: UserAPI.HeaderMode = .bearer
}

extension Requests.DeleteUserDecks: WebPostable {
    typealias TypeToDecodeTo = UserAPI.DeckWalletCategories
    
    func postableValue() -> UserAPI.DeckWalletCategories? {
        return nil
    }

    func urlString() -> String? {
        return UserAPI.baseUrl + "delete/decks"
    }
    
    static var headerMode: UserAPI.HeaderMode = .bearer
}

extension Requests.SaveUserDecks: WebPostable {
    typealias TypeToDecodeTo = UserAPI.DontDecode
    
    func postableValue() -> UserAPI.DeckWalletCategories? {
        return self.deckCategories
    }
    
    func urlString() -> String? {
        return UserAPI.baseUrl + "post/decks/\(mode.rawValue)"
    }
    
    static var headerMode: UserAPI.HeaderMode = .bearer
}

extension Requests.GetUserDecks: WebPostable {
    typealias TypeToDecodeTo = UserAPI.DeckWalletCategories
    
    func postableValue() -> UserAPI.DeckWalletCategories? {
        return nil
    }
    
    func urlString() -> String? {
        return UserAPI.baseUrl + "get/decks"
    }
    
    static var headerMode: UserAPI.HeaderMode = .bearer
}

extension Requests.CheckForUserDecksUpdate: WebPostable {
    typealias TypeToDecodeTo = String
    
    func postableValue() -> UserAPI.DeckWalletCategories? {
        return self.deckCategories
    }
    
    func urlString() -> String? {
        return UserAPI.baseUrl + "/decks/checkForUpdate"
    }
    
    static var headerMode: UserAPI.HeaderMode = .bearer
}

extension String: DecodeConvertible {
    func actionsToBeTakenAfterCompletion(datas: DatasEnvObj, arg: String) { }
}
