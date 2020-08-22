import Foundation

extension Requests.LoginUser {
    func request(showsAlerts: Bool = true,
                 managesProgressView: Bool = true,
                 errorTexts: ([Int: String]) -> ([Int: String]) = { _ in UserAPI.errorTexts },
                 completion: @escaping (UserAPI.Requester<Self>.Status) -> Void) {
        
        UserAPI.Requester.init(self, showAlerts: showsAlerts,
                               errorTexts: errorTexts, manageProgressView: managesProgressView)
            .request(completion: completion)
    }
}

extension Requests.SignOutUser {
    func request(showsAlerts: Bool = true,
                 managesProgressView: Bool = true,
                 completion: @escaping (UserAPI.Requester<Self>.Status) -> Void) {
        
        UserAPI.Requester.init(self, showAlerts: showsAlerts, manageProgressView: managesProgressView)
            .request(completion: completion)
    }
}

extension Requests.DeleteUser {
    func request(showsAlerts: Bool = true,
                 managesProgressView: Bool = true,
                 completion: @escaping (UserAPI.Requester<Self>.Status) -> Void) {
        
        UserAPI.Requester.init(self, showAlerts: showsAlerts, manageProgressView: managesProgressView)
            .request(completion: completion)
    }
}


extension Requests.DeleteUserDecks {
    func request(showsAlerts: Bool = true,
                 managesProgressView: Bool = true,
                 completion: @escaping (UserAPI.Requester<Self>.Status) -> Void) {
        
        UserAPI.Requester.init(self, showAlerts: showsAlerts, manageProgressView: managesProgressView)
            .request(completion: completion)
    }
}

extension Requests.SaveUserDecks {
    func request(showsAlerts: Bool = true,
                 managesProgressView: Bool = true,
                 completion: @escaping (UserAPI.Requester<Self>.Status) -> Void) {
        
        UserAPI.Requester.init(self, showAlerts: showsAlerts, manageProgressView: managesProgressView)
            .request(completion: completion)
    }
}

extension Requests.GetUserDecks {
    func request(showsAlerts: Bool = true,
                 managesProgressView: Bool = true,
                 completion: @escaping (UserAPI.Requester<Self>.Status) -> Void) {
        
        UserAPI.Requester.init(self, showAlerts: showsAlerts, manageProgressView: managesProgressView)
            .request(completion: completion)
    }
}

extension Requests.CheckForUserDecksUpdate {
    func request(showsAlerts: Bool = true,
                 managesProgressView: Bool = true,
                 completion: @escaping (UserAPI.Requester<Self>.Status) -> Void) {
        
        UserAPI.Requester.init(self, showAlerts: showsAlerts, manageProgressView: managesProgressView)
            .request(completion: completion)
    }
}
