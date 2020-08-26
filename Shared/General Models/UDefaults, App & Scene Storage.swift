import Foundation
import SwiftUI

typealias UD = UserDefaults
let groupRoyaleAlchemist1 = "group.Royale-Alchemist.1"

extension UD {
    static func standardValue(forKey key: StandardKeys) -> Any? {
        return UD.standard.value(forKey: key.rawValue)
    }
    
    static func standardSet(_ value: Any?, forKey key: StandardKeys) {
        UD.standard.set(value, forKey: key.rawValue)
    }
}

extension UD {
    static func sharedValue(forKey key: SharedKeys) -> Any? {
        return UD(suiteName: groupRoyaleAlchemist1)!.value(forKey: key.rawValue)
    }
    
    static func sharedSet(_ value: Any?, forKey key: SharedKeys) {
        UD(suiteName: groupRoyaleAlchemist1)!.set(value, forKey: key.rawValue)
    }
}

extension UD {
    static func standardValue(forKey key: AppDelegateKeys) -> Any? {
        return UD.standard.value(forKey: key.rawValue)
    }
    
    static func standardSet(_ value: Any?, forKey key: AppDelegateKeys) {
        UD.standard.set(value, forKey: key.rawValue)
    }
}

extension UD {
    enum AppDelegateKeys: String {
        case askedForNotificationsSetupBool = "askedForNotificationsSetupBool"
    }
}

extension UD {
    enum StandardKeys: String {
        case firstTimeUserOpenedTheAppEver = "firstTimeUserOpenedTheAppEver"
        case SIWAUsername = "SIWAUsername"
        case SIWAEmail = "SIWAEmail"
        case SIWAAPIID = "SIWAAPIID"
        case SIWAAccessToken = "SIWAAccessToken"
        case tabBarSelection = "tabBarSelection"
        case grandChallengeAverageWins = "grandChallengeAverageWins"
        case classicChallengeAverageWins = "classicChallengeAverageWins"
        case deckWalletMode = "deckWalletMode"
        case deckWalletCategoryIndex = "deckWalletCategoryIndex"
        case deckWalletCreateDeckCards = "deckWalletCreateDeckCards"
        case deckWalletCreateDeckColumnsCount = "deckWalletCreateDeckColumnsCount"
        case deckWalletCreateDeckSettingsSortMode = "deckWalletCreateDeckSettingsSortMode"
        case deckWalletCreateDeckSettingsOrderMode = "deckWalletCreateDeckSettingsOrderMode"
        case deckWalletCreateDeckCategoryIndex = "deckWalletCreateDeckCategoryIndex"
        case leaderboardsLeaderboardMode = "leaderboardsLeaderboardMode"
        case leaderboardsLastSearchedLeaderboardRegions = "leaderboardsLastSearchedLeaderboardRegions"
        case statsTagOrNamePickerIndex = "statsTagOrNamePickerIndex"
        case statsPlayerOrClanPickerIndex = "statsPlayerOrClanPickerIndex"
        case playersSavedPlayersData = "playersSavedPlayerData"
        case playerCardsColumnPickerIndex = "playerCardsColumnsPickerIndex"
        case playerCardsSortPickerIndex = "playerCardsSortPickerIndex"
        case playerCardsOrderPickerIndex = "playerCardsOrderPickerIndex"
        case playerSegmentedPickerIndex = "playerSegmentedPickerIndex"
        case statsPlayersOrClansSearch = "statsPlayersOrClansSearch"
        case clansSavedClansData = "clansSavedClansData"
        case clansNameSearchName = "clansNameSearchName"
        case clansNameSearchRegionKey = "clansNameSearchRegionKey"
        case clansNameSearchMinMembers = "clansNameSearchMinMembers"
        case clansNameSearchMaxMembers = "clansNameSearchMaxMembers"
        case clansNameSearchMinScore = "clansNameSearchMinScore"
        case clansNameSearchLimit = "clansNameSearchLimit"
        
        // these are just for the record. you can use them and make the process
        // of getting values from userdefaults more automated,
        // but as of now i'm fine with manually casting each of them to their
        // respective Type
        private var type: String {
            switch self {
            case .firstTimeUserOpenedTheAppEver: return "Bool"
            case .SIWAUsername: return "String"
            case .SIWAEmail: return "String"
            case .SIWAAPIID: return "String" // then convert to UUID
            case .SIWAAccessToken: return "String"
            case .tabBarSelection: return "String"
            case .grandChallengeAverageWins: return "Int"
            case .classicChallengeAverageWins: return "Int"
            case .deckWalletMode: return "DeckWalletMode"
            case .deckWalletCategoryIndex: return "Int"
            case .deckWalletCreateDeckCards: return "[String]"
            case .deckWalletCreateDeckSettingsSortMode: return "String"
            case .deckWalletCreateDeckSettingsOrderMode: return "String"
            case .deckWalletCreateDeckColumnsCount: return "Int"
            case .deckWalletCreateDeckCategoryIndex: return "Int"
            case .leaderboardsLeaderboardMode: return "String"
            case .leaderboardsLastSearchedLeaderboardRegions: return "String"
            case .statsTagOrNamePickerIndex: return "Int"
            case .statsPlayerOrClanPickerIndex: return "Int"
            case .playersSavedPlayersData: return "GeneralModels.Players.SearchedPlayers"
            case .playerCardsColumnPickerIndex: return "Int"
            case .playerCardsSortPickerIndex: return "Int"
            case .playerCardsOrderPickerIndex: return "Int"
            case .playerSegmentedPickerIndex: return "Int"
            case .statsPlayersOrClansSearch: return "Int"
            case .clansSavedClansData: return "GeneralModels.Clans.SearchedClans"
            case .clansNameSearchName: return "String"
            case .clansNameSearchRegionKey: return "String"
            case .clansNameSearchMinMembers: return "Double"
            case .clansNameSearchMaxMembers: return "Double"
            case .clansNameSearchMinScore: return "Double"
            case .clansNameSearchLimit: return "Double"
            }
        }
    }
}

extension UD {
    enum SharedKeys: String {
        case deviceId = "deviceId"
        case serverRequestNumber = "serverRequestNumber"
        case chestsWidgetOldRetrievedChest = "chestsWidgetOldRetrievedChest"
        case chestsWidgetOldRequestMaxChestIndex = "chestsWidgetOldRequestMaxChestIndex"
        case chestsWidgetOldNextDateInMinutes = "chestsWidgetOldNextDateInMinutes"
        case chestsWidgetOldChestsIndices = "chestsWidgetOldChestIndices"
        case chestsWidgetOldChestsNames = "chestsWidgetOldChestsNames"
        case playerTag = "palyerTag"
        case allCardKeys = "allCardKeys"
        case allCardIds = "allCardIds"
        case allCardElixirs = "allCardElixirs"
        case extensionDecksCardNames = "extensionDecksCardNames"
        case extensionDecksCategoryNames = "extensionDecksCategoryNames"
        case extensionDecksDeckNames = "extensionDecksDeckNames"
        case deckWalletCategoryNames = "deckWalletCategoryNames"
        
        // these are just for the record. you can use them and make the process
        // of getting values from userdefaults more automated,
        // but as of now i'm fine with manually casting each of them to their
        // respective Type
        private var type: String {
            switch self {
            case .deviceId: return "UUID"
            case .serverRequestNumber: return "Int"
            case .chestsWidgetOldRetrievedChest: return "String"
            case .chestsWidgetOldRequestMaxChestIndex: return "Int"
            case .chestsWidgetOldNextDateInMinutes: return "Int"
            case .chestsWidgetOldChestsIndices: return "[Int]"
            case .chestsWidgetOldChestsNames: return "[String]"
            case .playerTag: return "String"
            case .allCardIds: return "[Int]"
            case .allCardKeys: return "[String]"
            case .allCardElixirs: return "[Int]"
            case .extensionDecksCardNames: return  "[[String]]"
            case .extensionDecksCategoryNames: return  "[String]"
            case .extensionDecksDeckNames: return  "[String]"
            case .deckWalletCategoryNames: return "[String]"
            }
        }
    }
}
