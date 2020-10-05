import SwiftUI

extension ClanBaseView.ProfileView {
    @ViewBuilder
    func makeClanHeader() -> some View {
        
        let profile = datas.clanProfile
        
        VStack(spacing: 0) {
            
            HStack(spacing: 0) {
                    Image(profile.badgeName)
                        .resizable()
                        .scaledToFit()
                        .customFrame(height: 100)
                        .customPadding(t: 2, l: 2, b: 2, tr: 3)
                
                VStack(alignment: .leading, spacing: 0) {
                    Text(profile.name)
                        .customFont(size: 20, weight: .medium)
                        .foregroundColor(.custom(.green()))
                        .customPadding(t: 2, l: 3, b: 2, tr: 2)
                    
                    Text(profile.description)
                        .customFont(size: 16, weight: .medium)
                        .foregroundColor(.custom(.black()))
                        .customPadding(t: 2, l: 3, b: 2, tr: 2)
                        .minimumScaleFactor(0.1)
                        .multilineTextAlignment(.leading)
                }
                
                Spacer(minLength: 0)
            }
            
            let pairs: [StringStringPair] = [
                .init(key: "Trophies:",
                      value: "\(profile.clanScore)🏆"),
                .init(key: "Donations:",
                      value: "\(profile.donationsPerWeek)"),
                .init(key: "Type:",
                      value: "\(profile.type)"),
                .init(key: "Members:",
                      value: "\(profile.members)/50"),
                .init(key: "War Trophies:",
                      value: "\(profile.clanWarTrophies)"),
                .init(key: "To Join:",
                      value: "\(profile.requiredTrophies)🏆"),
                .init(key: "Location:",
                      value: "\(profile.location.name)"),
                .init(key: "Tag:",
                      value: "\(profile.tag)")]
            
            CustomGrid.init(isLazy: false,
                            allItemsCount: 8,
                            rows: 4) { idx in
                HStack(spacing: 0) {
                    let pair = pairs[idx]
                    
                    Text(pair.key)
                        .customFont(size: 16, weight: .semibold)
                        .foregroundColor(.custom(.black()))
                        .customPadding(t: 1, l: 2, b: 1, tr: 2)
                    
                    Text(pair.value)
                        .customFont(size: 16, weight: .medium)
                        .foregroundColor(.custom(.black()))
                        .customPadding(t: 1, l: 4, b: 1, tr: 2)
                    
                    if idx == 4 { // for war trophies
                        Image("purple-cup")
                            .resizable()
                            .scaledToFit()
                            .customFrame(height: 21)
                    }
                }
                .lineLimit(1)
                .minimumScaleFactor(0.1)
                .fixedSize(.vertical)
                .customFrame(maxWidth: screen.width, alignment: .leading)
            }
            .customPadding(.top, 4)
        }
        .customPadding(t: 4, l: 4, b: 4, tr: 4)
        .background(Color.custom(.white()))
        .customCornerRadius(8)
        .customPadding(t: 6, l: 8, b: 4, tr: 8)
        .shadow(color: .custom(.blackShadow(), opacity: 0.2), radius: 4, x: 0, y: 0)
        .frame(width: screen.width)
        .menu(menuItems: makeClanMenu)
    }
    
    @ViewBuilder
    private func makeClanMenu() -> some View {
        
        let clanTag = datas.clanProfile.tag
        
        if let clanURL = URL(string: Funcs.Clan
                                .linkStringForOpenningInGame(tag: clanTag)) {
            Button("Open clan in game", imageSystemName: "square.and.arrow.up") {
                openURL.callAsFunction(clanURL)
            }
        }
        
        Button("Clan: \(clanTag)", imageSystemName: "doc.on.doc") {
            UIPasteboard.general.string = clanTag
        }
    }
}
