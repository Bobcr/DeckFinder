import SwiftUI

extension PlayerBaseView.BattlesView {
    @ViewBuilder
    func makeHeader(idx: Int) -> some View {
        let battle = datas.playerBattles[idx]
        
        VStack(spacing: 0) {
            Text(battle.title)
                .customFont(size: 22, weight: .bold, id: .s2)
                .customPadding(t: 2, l: 6, b: 1, tr: 6, id: .s2)
                .foregroundColor(.custom(.black()))
            
            HStack(spacing: 0) {
                ZStack {
                    HStack(spacing: 0) {
                        let teamResultTextAndColor =
                            Funcs.Battle.teamResult(battle: battle)
                        
                        Text(teamResultTextAndColor.text)
                            .customFont(size: 18, id: .s2)
                            .foregroundColor(teamResultTextAndColor.color)
                            .customPadding(t: 2, l: 3, b: 1, tr: 3, id: .s2)
                            .border(teamResultTextAndColor.color, width: .custom(2, id: .s2))
                            .customCornerRadius(2)
                        
                        Spacer(minLength: 0)
                        
                        let oppResultTextAndColor =
                            Funcs.Battle.opponentResult(battle: battle)
                        
                        Text(oppResultTextAndColor.text)
                            .customFont(size: 18, id: .s2)
                            .foregroundColor(oppResultTextAndColor.color)
                            .customPadding(t: 2, l: 3, b: 1, tr: 3, id: .s2)
                            .border(oppResultTextAndColor.color, width: .custom(2, id: .s2))
                            .customCornerRadius(2)
                    }
                    
                    HStack(spacing: 0) {
                        Text(battle.team[0].crowns)
                            .customFont(size: 20)
                            .foregroundColor(.custom(.gray()))
                            .customFrame(width: 16, id: .s2)
                        
                        Image("crown-blue")
                            .resizable()
                            .scaledToFit()
                            .customFrame(height: 28, id: .s2)
                            .customPadding(.horizontal, 2, id: .s2)
                        
                        Image(Funcs.Battle.titleImageName(battle: battle))
                            .resizable()
                            .scaledToFit()
                            .customFrame(height: 37, id: .s2)
                        
                        Image("crown-red")
                            .resizable()
                            .scaledToFit()
                            .customFrame(height: 28, id: .s2)
                            .customPadding(.horizontal, 2, id: .s2)
                        
                        Text(battle.opponent[0].crowns)
                            .customFont(size: 20, id: .s2)
                            .foregroundColor(.custom(.gray()))
                            .customFrame(width: 16, id: .s2)
                    }
                    
                }
                .frame(width: screen.width-CGFloat.custom(20)) // bad menues
            }
        }
        .menu {
            Button("export Battle as Image", imageSystemName: "square.and.arrow.up") {
                
                var battleView: some View {
                    VStack(spacing: 0) {
                        makeHeader(idx: idx)
                            .customPadding(.horizontal, 4)
                        
                        CustomGrid.init(isLazy: false, allItemsCount: 2, columns: 2) { battlerIndex in
                            let teamSize = datas.playerBattles[idx].team.count
                            
                            CustomGrid.init(isLazy: false, allItemsCount: teamSize, columns: 1) { ind in
                                
                                makeBattler(idx: idx,
                                            ind: ind,
                                            battler: BattlerType.allCases[battlerIndex])
                                    .frame(width: screen.width/2-6)
                                
                                if battlerIndex == 0 {
                                    Divider()
                                        .foregroundColor(.custom(.gray(id: .c3)))
                                }
                                
                            }
                        }
                        
                        makeFooter(idx: idx)
                            .customPadding(l: 4, b: 2, tr: 4)
                    }
                    .background(Color.custom(.white()))
                    .customCornerRadius(8)
                    .customPadding(t: 4, l: 3, b: 4, tr: 3)
                    .shadow(color: .custom(.blackShadow(), opacity: 0.2), radius: 2)
                    .fixedSize(horizontal: false, vertical: true)
                    .environmentObject(datas)
                    .environmentObject(appearance)
                }
                
                let image = battleView.asImage()
                appearance.shareSheetItems = [.init(name: "Player Battle", image: image)]
                appearance.shareSheetPresentation = true
            }
        }
    }
}
