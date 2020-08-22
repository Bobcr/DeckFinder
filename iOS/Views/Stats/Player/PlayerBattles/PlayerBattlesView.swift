import SwiftUI

extension PlayerBaseView {
    struct BattlesView: View {
        
        @EnvironmentObject var datas: EnvObjs.Datas
        @EnvironmentObject var appearance: EnvObjs.Appearance
        @Environment(\.managedObjectContext) var moc
        @Environment(\.openURL) var openURL
        
        @Binding var addDeckMenuIsVisible: Bool
        @Binding var addDeckMenuDeckCards: [String]
        
        // for sharing battles as images, not used yet
        var onlyShowBattles: (chunkSize: Int, part: Int)? = nil
        
        var body: some View {
            BGStack {
                CustomGrid.init(allItemsCount: onlyShowBattles?.chunkSize ?? datas.playerBattles.count,
                                rows: onlyShowBattles?.chunkSize ?? datas.playerBattles.count) { idx in
                    
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
                    
                }
                .frame(width: screen.width)
                
            }
            .onAppear(perform: checkConditionForOnlyShowBattles)
        }
        
        private func checkConditionForOnlyShowBattles() {
            if let onlyShowBattles = onlyShowBattles {
                let chunkSize = onlyShowBattles.chunkSize
                let part = onlyShowBattles.part
                
                var newBattles: [OAPI.Models.PlayerBattle] {
                    var returni = [OAPI.Models.PlayerBattle]()
                    for idx in ((0..<chunkSize).map{$0 + chunkSize*(part-1)}) {
                        if idx < datas.playerBattles.count {
                            returni.append(datas.playerBattles[idx])
                        }
                    }
                    
                    return returni
                }
                
                datas.playerBattles = newBattles
            }
        }
    }
}

//struct BattelesView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlayerBaseView.BattlesView()
//            .environmentObject(EnvObjs.Datas.testData)
//    }
//}

extension PlayerBaseView.BattlesView {
    enum BattlerType: CaseIterable {
        case team, opponent
    }
}


