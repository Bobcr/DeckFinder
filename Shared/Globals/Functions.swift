import Foundation
import SwiftUI


func assertEqual<T>(_ values: T?..., with compareValue: T?) -> Bool
where T: Equatable {
    
    for value in values {
        if value != compareValue {
            return false
        }
    }
    
    return true
}

func assertNoNil(_ values: Any?...) -> Bool {
    for value in values {
        if value == nil {
            return false
        }
    }
    
    return true
}

func assertAllNil(_ values: Any?...) -> Bool {
    for value in values {
        if value != nil {
            return false
        }
    }
    
    return true
}
