import SwiftUI

extension PlayerBaseView.StatsView {
    func makeAccountInfo() -> some View {
        VStack(spacing: 0) {
            
            let profile = datas.playerProfile
            let ageBadge = profile.badges.first { $0.name.lowercased().contains("year") }
            let progressOfAgeBadge = ageBadge?.progress
            let accCreationDate = progressOfAgeBadge != nil ?
                Calendar.current.date(byAdding: .day, value: -progressOfAgeBadge!, to: Date()) : nil
            
            let accCreationDateString = (accCreationDate?.description)?.dropLast(15)
            let accAge: String = {
                if let creationDate = accCreationDate {
                    return Funcs.timeDifference(date: creationDate,
                                                shortLength: false,
                                                emitAgo: true)
                }
                return "Less than a year"
            }()
            
            let statsPairs: [StringArrayOfStringPair] = [
                .init(key: "Level", values: ["\(profile.expLevel)"]),
                .init(key: "Creation Date", values: [String(accCreationDateString ?? "Unknown")]),
                .init(key: "Age", values: [accAge])
            ]
            let imageIndices: [(index: Int, image: Image)] = [
                (0, Image("xpLevel"))
            ]
            
            makeStatsList(title: "Account",
                          pairs: statsPairs,
                          imageIndices: imageIndices)
            
        }
        .customPadding(t: 4, l: 3, b: 4, tr: 3)
        .background(Color.custom(.white()))
        .customCornerRadius(8)
        .customPadding(t: 5, l: 8, b: 5, tr: 8)
        .shadow(color: .custom(.blackShadow(), opacity: 0.2), radius: 2)
    }
}
