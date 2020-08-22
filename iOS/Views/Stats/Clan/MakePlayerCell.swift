import SwiftUI

extension ClanBaseView {
    
    @ViewBuilder
    func makePlayerCell(idx: Int) -> some View {
        
        let clanProfile = datas.clanProfile
        let members = clanProfile.memberList
        
        HStack(spacing: 0) {
            let item = members[idx]
            
            Text("#\(idx+1)")
                .customFont(size: 18)
                .customPadding(.leading, 2)
                .foregroundColor(.custom(.black()))
            
            let rankDeltaInfo = rankDeltaTextAndColor(rank: idx+1,
                                                      previousRank: item.previousClanRank)
            
            Text(rankDeltaInfo.text)
                .customFont(size: 14)
                .customPadding(.horizontal, 2)
                .foregroundColor(rankDeltaInfo.color)
                .customFrame(width: 23)
                .lineLimit(1)
                .minimumScaleFactor(0.001)
            
            VStack(alignment: .leading, spacing: 0) {
                Text(item.name)
                    .customFont(size: 19)
                    .foregroundColor(.custom(.black()))
                    .lineLimit(1)
                    .minimumScaleFactor(0.001)
                
                HStack(spacing: 0) {
                    Image(DataSet.Arena.find(trophies: item.trophies).imageName)
                        .resizable()
                        .scaledToFit()
                        .customPadding(.horizontal, 2)
                    
                    Text(item.trophies)
                        .customFont(size: 18, weight: .medium)
                        .foregroundColor(.custom(.secondary()))
                    
                    Text("🏆")
                        .customFont(size: 17.3, weight: .medium)
                        .customPadding(.horizontal, 2)
                }
            }
            .customPadding(t: 2, l: 0, b: 2, tr: 4)
            .lineLimit(1)
            .minimumScaleFactor(0.5)
            
            Spacer(minLength: 0)
            
            HStack(spacing: 0) {
                
                Divider()
                
                VStack(spacing: 0) {
                    
                    HStack(spacing: 0) {
                        Text(item.donations != 0 ? "+\(item.donations)" : "0")
                            .customFont(size: 16, weight: .medium)
                            .foregroundColor(.custom(.green()))
                        
                        Image("donation")
                            .resizable()
                            .scaledToFit()
                            .customFrame(height: 20)
                            .customPadding(.leading, 1)
                    }
                    .customPadding(t: 2, l: 4, b: 2, tr: 4)
                    
                    HStack(spacing: 0) {
                        Text(item.donationsReceived != 0 ? "-\(item.donationsReceived)" : "0")
                            .customFont(size: 16, weight: .medium)
                            .foregroundColor(.custom(.orange()))
                        
                        Image("donation")
                            .resizable()
                            .scaledToFit()
                            .customFrame(height: 20)
                            .customPadding(.leading, 1)
                    }
                    .customPadding(t: 2, l: 4, b: 2, tr: 4)
                }
                
                Divider()
                
                VStack(alignment: .trailing, spacing: 0) {
                    
                    let roleInfo = roleTextAndColor(role: item.role)
                    Text(roleInfo.text)
                        .customFont(size: 16, weight: .medium)
                        .customPadding(t: 2, l: 4, b: 2, tr: 3)
                        .foregroundColor(roleInfo.color)
                    
                    Text(Funcs.timeDifferenceUsingAPIDate(to: item.lastSeen))
                        .customFont(size: 16, weight: .medium)
                        .customPadding(t: 2, l: 4, b: 2, tr: 3)
                        .foregroundColor(.custom(.black()))
                }
            }
            
        }
        .customFrame(height: 50)
        .customPadding(.horizontal, 4)
        .background(Color.custom(.white()))
        .customCornerRadius(8)
        .customPadding(t: 4, l: 8, b: 4, tr: 8)
        .shadow(color: .custom(.blackShadow(), opacity: 0.2), radius: 4, x: 0, y: 0)
        .frame(width: screen.width)
        .menu { makeMenu(idx: idx) }
    }
    
    private func rankDeltaTextAndColor(rank: Int, previousRank: Int) -> (text: String, color: Color) {
        let rankDelta = previousRank - rank
        guard previousRank != 0 else {
            return ("new", color: .custom(.green()))
        }
        
        switch rankDelta {
        case let x where x > 0: return ("+\(rankDelta)", .custom(.green()))
        case let x where x < 0: return ("\(rankDelta)", .custom(.red()))
        default: return ("–", .custom(.gray()))
        }
    }
    
    private func roleTextAndColor(role: String) -> (text: String, color: Color) {
        switch role {
        case "member": return ("Member", .custom(.blue()))
        case "elder": return ("Elder", .custom(.orange()))
        case "coLeader": return ("CoLeader", .custom(.purple()))
        case "leader": return ("Leader", .custom(.red()))
        default: return ("Member", .custom(.blue()))
        }
    }
    
    @ViewBuilder
    private func makeMenu(idx: Int) -> some View {
        
        let clanProfile = datas.clanProfile
        let item = clanProfile.memberList[idx]
        
        let tag = item.tag
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
        
        Divider()
        
        Button("Donations: \(item.donations)", image: Image("donation")) { }
        Button("Recieved: \(item.donationsReceived)", image: Image("donation")) { }
        Button("Delta: \(item.donations - item.donationsReceived)", image: Image("donation")) { }
    }
}
