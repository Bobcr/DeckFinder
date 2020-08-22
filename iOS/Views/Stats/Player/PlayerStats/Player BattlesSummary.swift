import SwiftUI

extension PlayerBaseView.StatsView {
    @ViewBuilder
    func makeBattlesSummary() -> some View {
        let battles = datas.playerBattles
        
        if !battles.isEmpty {
            VStack(spacing: 0) {
                Text("Battles Summary")
                    .foregroundColor(.custom(.green()))
                    .customFont(size: 28, weight: .medium)
                    .customPadding(t: 3, b: 5)
                
                let columns = Device.isPhone ? 9 : 13
                CustomGrid.init(allItemsCount: battles.count,
                                columns: columns) { idx in
                    
                    let battle = battles[idx]
                    let columnsFloat = CGFloat(columns)
                    let width = screen.width - 22
                    let squareWidth = (width - CGFloat.custom(columnsFloat + 0) * 4) / columnsFloat
                    let teamCrowns = battle.team[0].crowns
                    let opponentCrowns = battle.opponent[0].crowns
                    let squareColor: Color = {
                        if teamCrowns == opponentCrowns { return .custom(.gray(id: .c2)) }
                        else if teamCrowns > opponentCrowns { return .custom(.green()) }
                        else { return .custom(.red()) }
                    }()
                    let imageName = Funcs.Battle.titleImageName(battle: battle)
                    
                    RoundedRectangle.init(cornerRadius: .custom(6))
                        .frame(width: squareWidth, height: squareWidth)
                        .foregroundColor(squareColor)
                        .customPadding(2)
                        .overlay(
                            Image(imageName)
                                .resizable()
                                .scaledToFit()
                                .customPadding(4)
                        )
                        .menu {
                            Button(battle.title) { }
                            Button("#\(idx+1) Battle") { }
                            
                            Divider()
                            
                            ForEach(battle.team.indices, id: \.self) { idx in
                                let battler = battle.team[idx]
                                let profileName = datas.playerProfile.name
                                
                                if battler.name != profileName {
                                    Button("With \(battler.name)") { }
                                        .menu { playerContextMenu(battler: battler) }
                                }
                            }
                            
                            ForEach(battle.opponent.indices, id: \.self) { idx in
                                let battler = battle.opponent[idx]
                                Button("Vs \(battler.name)") { }
                                    .menu { playerContextMenu(battler: battler) }
                            }
                            
                            Divider()
                            
                            Button("\(teamCrowns) crown Vs \(opponentCrowns) crown") { }
                            
                            let teamPrincessTowerHp = battle.team[0].princessTowersHitPoints
                                .reduce(0){$0+$1}
                            let teamHitpoints = battle.team[0].kingTowerHitPoints + teamPrincessTowerHp
                            
                            let oppPrincessTowerHp = battle.opponent[0].princessTowersHitPoints
                                .reduce(0){$0+$1}
                            let oppHitpoints = battle.opponent[0].kingTowerHitPoints + oppPrincessTowerHp
                            
                            Button("\(teamHitpoints) hp Vs \(oppHitpoints) hp") { }
                        }
                }
                
            }
            .customPadding(t: 4, l: 3, b: 4, tr: 3)
            .background(Color.custom(.white()))
            .customCornerRadius(8)
            .customPadding(t: 5, l: 8, b: 5, tr: 8)
            .shadow(color: .custom(.blackShadow(), opacity: 0.2), radius: 2)
        }
    }
    
    @ViewBuilder
    private func playerContextMenu(battler: OAPI.Models.PlayerBattle.Battler) -> some View {
        
        let tag = battler.tag
        
        Button(battler.name) { }
        
        Divider()
        
        Button("Player profile", imageSystemName: "arrowshape.turn.up.right") {
            appearance.statsInstantSearch = (mode: .players, tag: tag)
        }
        
        if let playerURL = URL(string: Funcs.Player.linkStringForOpenningInGame(tag: tag)) {
            Button("Open player in game", imageSystemName: "square.and.arrow.up") {
                openURL.callAsFunction(playerURL)
            }
        }
        
        Button("Player: \(tag)", imageSystemName: "doc.on.doc") {
            UIPasteboard.general.string = tag
        }
        
        Divider()
        
        let clanTag = battler.clan.tag
        Button("Clan profile", imageSystemName: "arrowshape.turn.up.right") {
            Present.statsViewWithInstantSearch(appearance: $appearance,
                                               mode: .clans,
                                               tag: clanTag)
        }
        
        if let playerURL = URL(string: Funcs.Clan.linkStringForOpenningInGame(tag: clanTag)) {
            Button("Open clan in game", imageSystemName: "square.and.arrow.up") {
                openURL.callAsFunction(playerURL)
            }
        }
        
        Button("Clan: \(clanTag)", imageSystemName: "doc.on.doc") {
            UIPasteboard.general.string = tag
        }
    }
    
}
