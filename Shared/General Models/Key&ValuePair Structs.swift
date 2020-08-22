import SwiftUI

struct StringStringPair {
    var key: String
    var value: String
}

struct StringArrayOfStringPair: Hashable {
    var key: String
    var values: [String]
}
