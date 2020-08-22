import Foundation

protocol EmptyInitializable {
    init()
}

extension String: EmptyInitializable { }
extension Bool: EmptyInitializable { }
extension Int: EmptyInitializable { }
extension Array: EmptyInitializable { }
