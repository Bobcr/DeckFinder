import SwiftUI

extension ClanBaseView.CurrentWarView {
    @ViewBuilder
    func makePlayers(idx: Int) -> some View {
        let clan = datas.clanCurrentWar.clans[idx]
        let participants = clan.participants
        
        CustomGrid(allItemsCount: participants.count, columns: 1) { idx in
            let item = participants[idx]
            
            HStack(spacing: 0) {
                
                Text("#\(idx+1)")
                    .customFont(size: 18)
                    .customPadding(.leading, 2)
                    .foregroundColor(.custom(.black()))
                
                Text(item.name)
                    .customFont(size: 20)
                    .foregroundColor(.custom(.indigo()))
                    .customPadding(t: 2, l: 4, b: 2, tr: 4)
                    .lineLimit(1)
                    .minimumScaleFactor(0.3)
                
                Spacer(minLength: 0)
                
                HStack(spacing: 0) {
                    Text("\(item.repairPoints)")
                        .foregroundColor(.custom(.black()))
                        .customFont(size: 18, weight: .medium)
                    
                    Image("repair-hammer")
                        .resizable()
                        .scaledToFit()
                        .customFrame(height: 26)
                        .customPadding(.leading, 1)
                }
                
                Divider()
                    .customPadding(.horizontal, 3)
                
                HStack(spacing: 0) {
                    Text("\(item.fame)")
                        .customFont(size: 18, weight: .medium)
                        .customPadding(.trailing, 1)
                        .foregroundColor(.custom(.black()))
                    
                    Image("fame")
                        .resizable()
                        .scaledToFit()
                        .customFrame(height: 24)
                        .customPadding(.trailing, 2)
                }
            }
            .customFrame(height: 50)
            .customPadding(.horizontal, 4)
            .background(Color.custom(.white()))
            .customCornerRadius(8)
            .customPadding(t: 4, l: 10, b: 4, tr: 10)
            .shadow(color: .custom(.blackShadow(), opacity: 0.2), radius: 4, x: 0, y: 0)
            .frame(width: screen.width - .custom(28))
            .customPadding(t: 2, l: 6, b: 2, tr: 6)
            .menu { makePlayerContextMenu(player: item) }
        }
    }
    
    @ViewBuilder
    private func makePlayerContextMenu(player: OAPI.Models.ClanCurrentWar.Participant) -> some View {
        let tag = player.tag
        
        Button("Player profile", imageSystemName: "arrowshape.turn.up.right") {
            Present.statsViewWithInstantSearch(appearance: $appearance,
                                               mode: .players,
                                               tag: tag)
        }
        
        if let playerURL = URL(string: Funcs.Player.linkStringForOpenningInGame(tag: tag)) {
            Button("Open player in game", imageSystemName: "square.and.arrow.up") {
                openURL.callAsFunction(playerURL)
            }
        }
        
        Button("Player: \(tag)", imageSystemName: "doc.on.doc") {
            UIPasteboard.general.string = tag
        }
    }
}
