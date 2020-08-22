import Foundation
import CoreData

extension Funcs {
    static func after(seconds: Double, action: @escaping () -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: action)
    }
    
    static func convertAPITimeToDate(dateString: String) -> Date? {
        var dateString = dateString
        
        if dateString != "" {
            dateString.removeLast(5)
            dateString = dateString.insertAtIndex("-", at: 4)
            dateString = dateString.insertAtIndex("-", at: 7)
            dateString = dateString.insertAtIndex(":", at: 13)
            dateString = dateString.insertAtIndex(":", at: 16)
            dateString = dateString.replacingOccurrences(of: "T", with: " ")
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        let date = formatter.date(from: dateString)
        
        return date
    }
    
    static func timeDifferenceUsingAPIDate(to dateString: String,
                                           shortLength: Bool = true,
                                           emitAgo: Bool = false) -> String {
        
        let now = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let dateOfInterest = convertAPITimeToDate(dateString: dateString) ?? now
        let dateString = timeDifferenceString(date: dateOfInterest, shortLength: shortLength)
        
        if emitAgo {
            return dateString.replacingOccurrences(of: " ago", with: "")
        }
        else {
            return dateString
        }
    }
    
    static func timeDifference(date: Date,
                               shortLength: Bool = true,
                               emitAgo: Bool = false) -> String {
        
        let dateString = timeDifferenceString(date: date, shortLength: shortLength)
        
        if emitAgo {
            return dateString.replacingOccurrences(of: " ago", with: "")
        }
        else {
            return dateString
        }
    }
    
    private static func timeDifferenceString(date: Date, shortLength: Bool) -> String {
        
        let now = Date()
        var timeInterval = now.timeIntervalSince(date)
        timeInterval = timeInterval > 0 ? timeInterval : -timeInterval
        
        var elapsedTime = timeInterval > 0 ? timeInterval : -timeInterval
        
        let minuteSecs: Double = 60
        let hourSecs: Double = 60 * 60
        let daySecs: Double = 60 * 60 * 24
        let weekSecs: Double = 60 * 60 * 24 * 7
        let monthSecs: Double = 60 * 60 * 24 * 30.5
        let yearSecs: Double = 60 * 60 * 24 * 365
        
        let years = Int(elapsedTime / yearSecs)
        elapsedTime -= Double(years)*yearSecs
        let yearsT = years == 0 ? "" : "\(years)yr "
        
        let months = Int(elapsedTime / monthSecs)
        elapsedTime -= Double(months)*monthSecs
        let monthsT = months == 0 ? "" : "\(months)mo "
        
        let weeks = Int(elapsedTime / weekSecs)
        elapsedTime -= Double(weeks)*weekSecs
        let weeksT = weeks == 0 ? "" : "\(weeks)w "
        
        let days = Int(elapsedTime / daySecs)
        elapsedTime -= Double(days)*daySecs
        let daysT = days == 0 ? "" : "\(Int(days))d "
        
        let hours = Int(elapsedTime / hourSecs)
        elapsedTime -= Double(hours)*hourSecs
        let hoursT = hours == 0 ? "" : "\(Int(hours))h "
        
        let minutes = Int(elapsedTime / minuteSecs)
        elapsedTime -= Double(minutes)*minuteSecs
        let minutesT = minutes == 0 ? "" : "\(Int(minutes))m "
        
        let seconds = Int(elapsedTime)
        elapsedTime -= Double(seconds)
        let secondsT = seconds == 0 ? "" : "\(Int(seconds))s "
        
        var allTimes = [
            yearsT,
            monthsT,
            weeksT,
            daysT,
            hoursT,
            minutesT,
            secondsT
        ]
        
        allTimes.removeAll { $0 == "" }
        
        switch allTimes.count {
        case 0: return "Now"
        case 1: return "\(allTimes[0])ago"
        case let x where x < 3 || shortLength:
            return "\(allTimes[0])\(allTimes[1])ago"
        default:
            return "\(allTimes[0])\(allTimes[1])\(allTimes[2])ago"
        }
        
    }
}
