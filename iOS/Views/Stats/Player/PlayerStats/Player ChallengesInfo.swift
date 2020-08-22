import SwiftUI

extension PlayerBaseView.StatsView {
    func makeChallengesInfo() -> some View {
        VStack(spacing: 0) {
            
            let profile = datas.playerProfile
            let badges = profile.badges
            let achievements = profile.achievements
            
            let makePercentage: (Int, Int) -> String = { smaller, bigger in
                ((Double(smaller)/Double(bigger))*100).maxDigitCount(3) + "%"
            }
            
            let challengeCardsWon = profile.challengeCardsWon
            let maxChallengeWins = profile.challengeMaxWins
            
            let grandChallenge12Wins = (badges.first { $0.name == "Grand12Wins" })?.progress ?? 0
            let grandChallenge12WinsPercentage = makePercentage(grandChallenge12Wins*1100, challengeCardsWon)
            
            let classicChallenge12Wins = (badges.first { $0.name == "Classic12Wins" })?.progress ?? 0
            let classicChallenge12WinsPercentage = makePercentage(classicChallenge12Wins*100, challengeCardsWon)
            
            let tournamentBattleCount = profile.tournamentBattleCount.addGroupingSeparator()
            let tournamentCardsWon = profile.tournamentCardsWon.addGroupingSeparator()
            let tournamentsParticipatedIn =
                (achievements.first { $0.name == "Tournament Player" })?.value.description ?? "Unknown"
            let tournamentsCreated =
                (achievements.first { $0.name == "Tournament Host" })?.value.description ?? "Unknown"
            
            makeStatsList(title: "Challenges & Tournaments",
                          pairs: [
                            .init(key: "Challenge Cards Won", values: [challengeCardsWon.addGroupingSeparator()]),
                            .init(key: "Max Challenge Wins", values: [maxChallengeWins.description]),
                            .init(key: "Grand Challenge 12 Wins", values: [grandChallenge12Wins.description,
                                                                           grandChallenge12WinsPercentage]),
                            .init(key: "Classic Challenge 12 Wins", values: [classicChallenge12Wins.description,
                                                                             classicChallenge12WinsPercentage]),
                            .init(key: "Tournament Battle Count", values: [tournamentBattleCount]),
                            .init(key: "Tournament Cards Won", values: [tournamentCardsWon]),
                            .init(key: "Tournament Participated In", values: [tournamentsParticipatedIn]),
                            .init(key: "Tournament Created", values: [tournamentsCreated])
                          ],
                          dividerIndices: [3])
        }
        .customPadding(t: 4, l: 3, b: 4, tr: 3)
        .background(Color.custom(.white()))
        .customCornerRadius(8)
        .customPadding(t: 5, l: 8, b: 5, tr: 8)
        .shadow(color: .custom(.blackShadow(), opacity: 0.2), radius: 2)
    }
}
