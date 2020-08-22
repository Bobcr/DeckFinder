import Foundation
import SwiftUI
import UIKit

extension String {
    func unsafeUrlHostEncode() -> String {
        guard let encodedValue = self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {
            return ""
        }
        return encodedValue
    }
    
    func urlHostEncode() -> String? {
        let encodedValue = self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        return encodedValue
    }
}

extension String {
    func asTag() -> String {
        let tag = self.replacingOccurrences(of: " ", with: "")
            .replacingOccurrences(of: "#", with: "")
        
        return "#".appending(tag).uppercased()
    }
}

extension RandomAccessCollection {
    func indexed() -> Array<(offset: Int, element: Element)> {
        return Array(enumerated())
    }
}

extension String {
    func remove(at index: Int) -> String {
        var alpha = self.map{$0}
        alpha.remove(at: index)
        var beta = ""
        
        for idx in alpha.indices {
            beta.append(alpha[idx])
        }
        
        return beta
    }
}

extension String {
    func firstTrailingIndexOfSubString(subString: String) -> Optional<Int> {
        let subStringArray = subString.uppercased().map{$0}
        let subStringLength = subString.count
        let stringArray = self.uppercased().map{$0}
        
        if stringArray.count-subStringLength+1 > 0 {
            for idx in 0..<(stringArray.count - subStringLength + 1) {
                
                var alpha = ""
                
                for indi in subStringArray.indices {
                    alpha.append(stringArray[indi+idx])
                }
                
                if alpha == subString.uppercased() {
                    return (idx + subStringLength - 1)
                }
                
            }
        }
        
        return nil
    }
}

extension String {
    func spaceRemover() -> String {
        return self.replacingOccurrences(of: " ", with: "")
    }
}

extension String {
    func insertAtIndex(_ char: String, at: Int) -> String {
        
        var partedString = self.map{$0}
        partedString.insert(contentsOf: char, at: at)
        
        var newWord = ""
        
        for idx in partedString.indices {
            newWord.append(partedString[idx])
        }
        
        return newWord
    }
}

extension String {
    func removeAtIndex(at: Int) -> String {
        
        var alpha = self.map{$0}
        
        alpha.remove(at: at)
        
        var beta = ""
        
        for idx in alpha.indices {
            beta.append(alpha[idx])
        }
        
        return beta
    }
}

extension String {
    // as an example, changes `     tmp  k  ` to `tmp  k`
    func leadingAndTrailingSpacesRemover() -> String {
        
        var selfi = self
        var firstBool = true
        var lastBool = true
        
        while firstBool == true || lastBool == true {
            
            if firstBool {
                if let first = selfi.first {
                    
                    if first == " " {
                        selfi = selfi.removeAtIndex(at: 0)
                    }
                    else {
                        firstBool = false
                    }
                }
                else {
                    firstBool = false
                }
            }
            
            
            if lastBool {
                if let last = selfi.last {
                    
                    if selfi.count > 0 {
                        if last == " " {
                            selfi = selfi.removeAtIndex(at: selfi.count-1)
                        }
                        else {
                            lastBool = false
                        }
                    }
                }
                else {
                    lastBool = false
                }
            }
        }
        
        return selfi
    }
    
}
