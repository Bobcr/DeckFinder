import Foundation
import UIKit
import SwiftUI
//import UserNotifications
import CoreData


class AppDelegate: NSObject, UIApplicationDelegate {
    
    var appearance: EnvObjs.Appearance?
    var moc: NSManagedObjectContext?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        UINavigationBar.appearance().barTintColor = .init(.custom(.gray(id: .c5)))
        doRegularChecks()
        takeCareOfDeckExtensionUDValues()
        if let moc = self.moc {
            Self.takeCareOfExtensionDecks(moc: moc)
        }
        
        return true
    }
    
    func takeCareOfDeckExtensionUDValues() {
        let allCardsInfos = DataSet.Cards.allCases.map{$0.info}
        UD.sharedSet(allCardsInfos.map{$0.id}, forKey: .allCardIds)
        UD.sharedSet(allCardsInfos.map{$0.key}, forKey: .allCardKeys)
        UD.sharedSet(allCardsInfos.map{$0.elixir}, forKey: .allCardElixirs)
    }
    
    static func takeCareOfExtensionDecks(moc: NSManagedObjectContext) {
        func nilAll() {
            UD.sharedSet(nil, forKey: .extensionDecksCardNames)
            UD.sharedSet(nil, forKey: .extensionDecksDeckNames)
            UD.sharedSet(nil, forKey: .extensionDecksCategoryNames)
        }
        
        guard let cardNames =
                UD.sharedValue(forKey: .extensionDecksCardNames) as? [[String]],
              let deckNames =
                UD.sharedValue(forKey: .extensionDecksDeckNames) as? [String],
              let categoryNames =
                UD.sharedValue(forKey: .extensionDecksCategoryNames) as? [String],
              assertEqual(cardNames.count, categoryNames.count, with: deckNames.count) else {
            
            nilAll()
            return
        }
        
        let allDecks = DeckWallet.getAll(moc: moc)
        
        struct Deck {
            var cards: [String]
            var name: String
            var category: String
        }
        
        var decks = cardNames.indices.map { index in
            Deck.init(cards: cardNames[index],
                      name: deckNames[index],
                      category: categoryNames[index])
        }
        decks = decks.filter { deck in
            (decks.filter{$0.cards.sorted() == deck.cards.sorted()}).count <= 1
        }
        
        for deck in decks {
            // delete old instance of the deck if there is one
            var oldDeckName: String? = nil
            if let first = (allDecks.first{$0.cardNames?.sorted() == deck.cards.sorted()}) {
                oldDeckName = first.deckTitle
                moc.delete(first)
            }
            
            // add the new deck
            let newDeck = DeckWallet.init(context: moc)
            newDeck.cardNames = deck.cards
            newDeck.deckTitle = deck.name == "" ? (oldDeckName ?? "") : deck.name
            newDeck.deckCategory = deck.category
            try? moc.save()
        }
        
        nilAll()
    }
    
    private func doRegularChecks() {
        if let oldCategoryNames = UD.standard.value(forKey: "deckWalletCategoryNames") as? [String] {
            UD.sharedSet(oldCategoryNames, forKey: .deckWalletCategoryNames)
            UD.standard.set(nil, forKey: "deckWalletCategoryNames")
        }
        if let oldServerSearchNumbers = UD.standard.value(forKey: "serverRequestNumber") as? Int {
            UD.sharedSet(oldServerSearchNumbers, forKey: .serverRequestNumber)
            UD.standard.set(nil, forKey: "serverRequestNumber")
        }
     }
    
    //MARK: - These below things are related to push notifications and are not used yet
    
//    func application(_ application: UIApplication,
//                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil)
//    -> Bool {
//
//        UNUserNotificationCenter.current().delegate = self
//        askForPushNotificationsInTheFirstLaunch()
//
//        return true
//    }
//
//    func registerForPushNotifications() {
//        let notifications = UNUserNotificationCenter.current()
//
//        notifications.requestAuthorization(options: [.alert, .sound, .badge]) {
//            [weak self] granted, error in
//
//            guard granted else { return }
//
//            let notifications = UNUserNotificationCenter.current()
//            let notificationCategories = Set(UNCategories.allCases.map{$0.notificationCategory})
//            notifications.setNotificationCategories(notificationCategories)
//            self?.getNotificationSettings()
//        }
//    }
//
//    func getNotificationSettings() {
//        UNUserNotificationCenter.current().getNotificationSettings { settings in
//
//            guard settings.authorizationStatus == .authorized else { return }
//            DispatchQueue.main.async {
//                UIApplication.shared.registerForRemoteNotifications()
//            }
//        }
//    }
//
//    func askForPushNotificationsInTheFirstLaunch() {
//        if !(UD.standardValue(forKey: .askedForNotificationsSetupBool) as? Bool == true) {
//            appearance.alert = .init(title: "Notifications Only Once a Week!\n(or maybe less?)",
//                                     message: "We promise we will only use notifications for important stuff.",
//                                     primaryButton: .default(Text("OK :)")) {
//                                        UD.standardSet(true, forKey: .askedForNotificationsSetupBool)
//                                        self.registerForPushNotifications()
//                                     })
//        }
//    }
//
//    func application(_ application: UIApplication,
//                     didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
//        let tokenParts = deviceToken.map { data in String(format: "%02.2hhx", data) }
//        let token = tokenParts.joined()
//        print("Device Token: \(token)")
//    }
//
//    func application(_ application: UIApplication,
//                     didReceiveRemoteNotification userInfo: [AnyHashable: Any],
//                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
//
//        guard let aps = userInfo["aps"] as? [String: Any] else {
//            print("failed")
//            completionHandler(.failed)
//            return
//        }
//
//        appearance.alert = .init(title: aps.description,
//                                 message: nil)
//        completionHandler(.newData)
//    }

}

//
//private func decodeUserNotification(userInfo: [AnyHashable: Any]) -> APSDTO? {
//
//    let decoder = JSONDecoder()
//
//    guard let notificationData = try? JSONSerialization.data(withJSONObject: userInfo["aps"] as Any),
//        let decodedNotifiction = try? decoder.decode(APSDTO.self, from: notificationData) else {
//        print("NIIILED")
//        return nil
//    }
//
//    print(decodedNotifiction)
//    return decodedNotifiction
//}
//
//extension AppDelegate: UNUserNotificationCenterDelegate {
//    func userNotificationCenter(_ center: UNUserNotificationCenter,
//                                didReceive response: UNNotificationResponse,
//                                withCompletionHandler completionHandler: @escaping () -> Void) {
//
//        print("DelegateCalled")
//        let userInfo = response.notification.request.content.userInfo
//
//        if let decodedNotification = decodeUserNotification(userInfo: userInfo),
//              let categoryString = decodedNotification.category,
//              let category = UNCategories.find(rawValue: categoryString) {
//
//            category.action()
//        }
//
//        completionHandler()
//    }
//}
//
//
//enum UNCategories: String, CaseIterable {
//    case update = "update"
//
//    private enum UNActions: String {
//        case update = "updateAction"
//
//        var action: UNNotificationAction {
//            switch self {
//            case .update: return .init(identifier: self.rawValue,
//                                       title: "Update!",
//                                       options: [.foreground])
//            }
//        }
//    }
//
//    var notificationCategory: UNNotificationCategory {
//        switch self {
//        case .update: return .init(identifier: self.rawValue,
//                                   actions: [UNActions.update.action],
//                                   intentIdentifiers: [],
//                                   options: .init())
//        }
//    }
//
//    var action: () -> Void {
//        switch self {
//        case .update: return {
//            if let url = URL(string: "https://itunes.apple.com/app/id1503996169") {
//                UIApplication.shared.open(url)
//            }
//        }
//        }
//    }
//
//    static func find(rawValue: String) -> Self? {
//        let all = Self.allCases
//        return all.first{$0.rawValue == rawValue}
//    }
//}
//
//struct APSDTO: Decodable {
//    var alert: APSAlert?
//    var badge: Int?
//    var sound: String?
//    var mutableContent: Int
//    var contentAvailable: Int
//    var category: String?
//
//    struct APSAlert: Decodable {
//        var title: String?
//        var subtitle: String?
//        var body: String?
//        var launchImage: String?
//
//        enum CodingKeys: String, CodingKey {
//            case title, subtitle, body
//            case launchImage = "launch-image"
//        }
//    }
//
//    enum CodingKeys: String, CodingKey {
//        case alert, badge, sound, category
//        case mutableContent = "mutable-content"
//        case contentAvailable = "content-available"
//    }
//}
