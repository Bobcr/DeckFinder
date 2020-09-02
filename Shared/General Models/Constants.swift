import Foundation

extension Constants {
    static let appBundleId = "com.bm.RoyaleAlchemist"
    static let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    static let appBuildNumber = Bundle.main.infoDictionary?["CFBundleVersion"] as? String
}
