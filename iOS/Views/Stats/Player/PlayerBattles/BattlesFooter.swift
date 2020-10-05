import SwiftUI

extension PlayerBaseView.BattlesView {
    @ViewBuilder
    func makeFooter(idx: Int) -> some View {
        let battle = datas.playerBattles[idx]
        let battleDateString = datas.playerBattles[idx].battleTime
        let battleRelativeString = Funcs.timeDifferenceUsingAPIDate(to: battleDateString)
        
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                HStack(spacing: 0) {
                    Image("hp")
                        .resizable()
                        .scaledToFit()
                        .customFrame(height: 24, id: .s2)
                    
                    let teamPrincessTowerHp = battle.team[0].princessTowersHitPoints
                        .reduce(0){$0+$1}
                    let teamHitpoints = battle.team[0].kingTowerHitPoints+teamPrincessTowerHp
                    
                    Text("\(teamHitpoints)")
                        .fixedSize(.horizontal)
                        .customFont(size: 16.5, id: .s2)
                        .foregroundColor(.custom(.gray()))
                        .customPadding(l: 1, tr: 4, id: .s2)
                }
                .menu { playerHPContextMenu(battle: battle) }
                
                Spacer(minLength: 0)
                
                HStack(spacing: 0) {
                    let oppPrincessTowerHp = battle.opponent[0].princessTowersHitPoints
                        .reduce(0){$0+$1}
                    let oppHitpoints = battle.opponent[0].kingTowerHitPoints+oppPrincessTowerHp
                    
                    Text("\(oppHitpoints)")
                        .fixedSize(.horizontal)
                        .customFont(size: 16.5, id: .s2)
                        .foregroundColor(.custom(.gray()))
                        .customPadding(l: 4, tr: 1, id: .s2)
                    
                    Image("hp")
                        .resizable()
                        .scaledToFit()
                        .customFrame(height: 24, id: .s2)
                }
                .menu { opponentHPContextMenu(battle: battle) }
                
            }
            
            HStack(spacing: 0) {
                let textAndColor = battleResultTextAndColor(battle: battle)
                Text(textAndColor.text)
                    .customFont(size: 17, id: .s2)
                    .foregroundColor(textAndColor.color)
                
                Spacer(minLength: 0)
                
                //                    Text(battleDate, style: .relative)
                Text(battleRelativeString)
                    .customFont(size: 17, id: .s2)
                    .foregroundColor(.custom(.gray()))
                    .lineLimit(1)
                    .minimumScaleFactor(0.1)
                //                        .frame(width: screen.width/4, alignment: .trailing)
            }
            
        }
    }
    
    @ViewBuilder
    private func playerHPContextMenu(battle: OAPI.Models.PlayerBattle) -> some View {
        Button(action: {}) {
            Text(battle.team[0].kingTowerHitPoints)
            Spacer(minLength: 0)
            Image("king-tower")
                .resizable()
                .scaledToFit()
        }
        Button(action: {}) {
            Text(battle.team[0].princessTowersHitPoints[0])
            Spacer(minLength: 0)
            Image("princess-tower")
                .resizable()
                .scaledToFit()
        }
        Button(action: {}) {
            Text(battle.team[0].princessTowersHitPoints[1])
            Spacer(minLength: 0)
            Image("princess-tower")
                .resizable()
                .scaledToFit()
        }
    }
    
    @ViewBuilder
    private func opponentHPContextMenu(battle: OAPI.Models.PlayerBattle) -> some View {
        Button(action: {}) {
            Text(battle.opponent[0].kingTowerHitPoints)
            Spacer(minLength: 0)
            Image("king-tower")
                .resizable()
                .scaledToFit()
        }
        Button(action: {}) {
            Text(battle.opponent[0].princessTowersHitPoints[0])
            Spacer(minLength: 0)
            Image("princess-tower")
                .resizable()
                .scaledToFit()
        }
        Button(action: {}) {
            Text(battle.opponent[0].princessTowersHitPoints[1])
            Spacer(minLength: 0)
            Image("princess-tower")
                .resizable()
                .scaledToFit()
        }
    }
    
}

private func battleResultTextAndColor(battle: OAPI.Models.PlayerBattle)
-> (text: String, color: Color) {
    let oppCrowns = battle.opponent[0].crowns
    let teamCrowns = battle.team[0].crowns
    
    if oppCrowns == teamCrowns {
        return (text: "Draw", color: .custom(.gray()))
    }
    else if teamCrowns > oppCrowns {
        return (text: "Victory", color: .custom(.green()))
    }
    else {
        return (text: "Defeat", color: .custom(.red()))
    }
}
