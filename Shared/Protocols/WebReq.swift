import Foundation

protocol WebGettable {
    associatedtype TypeToDecodeTo
    where TypeToDecodeTo: DecodeConvertible & Codable
    
    func urlString() -> String?
}

protocol WebPostable {
    associatedtype TypeToDecodeTo
    where TypeToDecodeTo: DecodeConvertible & Codable
    associatedtype Postable: Encodable
    
    func postableValue() -> Postable?
    func urlString() -> String?
    static var headerMode: UserAPI.HeaderMode { get }
}
