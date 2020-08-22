import Foundation

extension UserAPI {
    typealias DeckWalletCategories = [DeckWalletCategory]
}

extension UserAPI {
    struct DontDecode: Codable, DecodeConvertible {
        init(){ }
        func actionsToBeTakenAfterCompletion(datas: DatasEnvObj, arg: String) {
//            datas.boolean.set(to: !datas.boolean.wrappedValue)
        }
    }
}
