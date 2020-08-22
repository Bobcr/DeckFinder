import Foundation

extension OAPI.Models {
    struct PlayerChests: Codable, EmptyInitializable {
        @DecodeNilable var items: [Chest] = .init()
    }
}

extension OAPI.Models.PlayerChests {
    struct Chest: Codable, EmptyInitializable {
        @DecodeNilable var index: Int = .init()
        @DecodeNilable var name: String = .init()
    }
}

extension OAPI.Models.PlayerChests: DecodeConvertible {
    func actionsToBeTakenAfterCompletion(datas: DatasEnvObj, arg: String) {
        datas.playerChests.set(to: self)
    }
}
