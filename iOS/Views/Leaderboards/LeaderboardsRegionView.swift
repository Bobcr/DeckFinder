import SwiftUI

extension LeaderboardsBaseView {
    struct ChooseRegionView: View {
        
        @Environment(\.presentationMode) var presentationMode
        @Binding var region: DataSet.Regions
        @State var udRegions = getUDLastSearchedLeaderboardRegions()
        var openedThroughLeaderboardsView = true
        
        var body: some View {
            
            var allRegions: [DataSet.Regions] {
                let allCases = DataSet.Regions.allCases
                var allCasesPlusUDRegions = udRegions
                allCasesPlusUDRegions.append(contentsOf: allCases)
                
                return allCasesPlusUDRegions
            }
            
            return BGStack {
                ScrollView {
                    if openedThroughLeaderboardsView {
                        makeHeader()
                    }
                    
                    CustomGrid(allItemsCount: allRegions.count, columns: 1) { idx in
                        makeGridCell(allRegions: allRegions, idx: idx)
                    }
                }
            }
            .navigationTitle("Choose Region")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: onAppearAction)
        }
        
        @ViewBuilder
        private func makeGridCell(allRegions: [DataSet.Regions], idx: Int) -> some View {
            let region = allRegions[idx].value
            
            Button(action: { gridCellButtonAction(for: allRegions[idx]) }) {
                HStack(spacing: 0) {
                    
                    Text(region.emoji)
                        .customPadding(.trailing, 6)
                    
                    Text(region.name)
                        .lineLimit(1)
                        .minimumScaleFactor(0.1)
                    
                    Spacer()
                }
                .customPadding(t: 3, l: 6, b: 3, tr: 6)
                .foregroundColor(.custom(.black()))
                .background(Color.custom(.white()))
                .customCornerRadius(6)
                .customFont(size: 24)
                .customPadding(t: 4, l: 12, b: 4, tr: 12)
                .shadow(color: .custom(.blackShadow(), opacity: 0.2), radius: 4, x: 0, y: 0)
            }
        }
        
        private func makeHeader() -> some View {
            VStack(alignment: .leading, spacing: 0) {
                Text("Chosen region will only take effect when")
                
                Text("you search for Players/Clans/War-Clans")
            }
            .foregroundColor(.custom(.gray(id: .c2)))
            .customFont(size: 16)
            .customPadding(t: 20, l: 10, b: 4, tr: 10)
        }
        
        private func gridCellButtonAction(for region: DataSet.Regions) {
            self.region = region
            
            var oldSearchedRegionKeys =
                UD.standardValue(forKey: .leaderboardsLastSearchedLeaderboardRegions)
                as? [String] ?? []
            
            let regionKey = region.value.key
            
            oldSearchedRegionKeys = oldSearchedRegionKeys.filter { $0 != regionKey }
            oldSearchedRegionKeys.append(regionKey)
            
            UD.standardSet(oldSearchedRegionKeys,
                           forKey: .leaderboardsLastSearchedLeaderboardRegions)
            
            presentationMode.wrappedValue.dismiss()
        }
        
        private func onAppearAction() {
            udRegions = getUDLastSearchedLeaderboardRegions()
        }
        
    }
}

struct ChooseRegionView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardsBaseView.ChooseRegionView(region: .constant(.All))
    }
}

private func getUDLastSearchedLeaderboardRegions() -> [DataSet.Regions] {
    
    let udValues = UD.standardValue(forKey: .leaderboardsLastSearchedLeaderboardRegions)
    let udRegionKeys = udValues as? [String] ?? []
    var regions = udRegionKeys.map { DataSet.Regions.find(key: $0) }
    let count = regions.count
    let showUpTo = 10
    
    regions = regions.filter {
        if ($0 == .All ||
            $0 == ._EU ||
            $0 == ._NA ||
            $0 == ._SA ||
            $0 == ._AS ||
            $0 == ._AU ||
            $0 == ._AF ||
                $0 == ._INT) {
            
            return false
        }
        else {
            return true
        }
    }
    
    return Array(regions.dropFirst(max(count-showUpTo, 0)))
}

