import SwiftUI

extension ClanBaseView {
    struct NameSearchMenu: View {
        
        @ObservedObject var menuValues: OverlayMenuDatas.ClanSearchMenu
        @Binding var textFieldString: String
        @Binding var actionMenuIsVisible: Bool
        var activationDatePath: ReferenceWritableKeyPath<EnvObjs.ZIndex, Date?>? = nil
        
        @State var navigationLinkTriggerer: Bool?
        @State var resultsSheetPresentation: Bool = false
        
        @EnvironmentObject var datas: EnvObjs.Datas
        @EnvironmentObject var appearance: EnvObjs.Appearance
        
        var body: some View {
            NavigationLink(destination: LeaderboardsBaseView.ChooseRegionView
                            .init(region: $menuValues.region,
                                  openedThroughLeaderboardsView: false),
                           tag: true,
                           selection: $navigationLinkTriggerer) { EmptyView() }
            
            OverlayMenuStack.init(isPresented: $menuValues.menuIsVisible,
                                  activationDatePath: activationDatePath,
                                  hasDragGesture: false) {
                VStack(spacing: 0) {
                    OverlayMenuItem.slider(title: "Min. Trophies: \(Int(menuValues.minScore))",
                                           sliderValue: $menuValues.minScore,
                                           in: 500...80000,
                                           step: 500) { _ in
                        UD.standardSet(menuValues.minScore, forKey: .clansNameSearchMinScore)
                    }
                    
                    OverlayMenuItem.slider(title: "Max. Members: \(Int(menuValues.maxMembers))",
                                           sliderValue: $menuValues.maxMembers,
                                           in: 3...50,
                                           step: 1) { _ in
                        UD.standardSet(menuValues.maxMembers, forKey: .clansNameSearchMaxMembers)
                    }
                    
                    OverlayMenuItem.slider(title: "Min. Members: \(Int(menuValues.minMembers))",
                                           sliderValue: $menuValues.minMembers,
                                           in: 3...50,
                                           step: 1) { _ in
                        UD.standardSet(menuValues.minMembers, forKey: .clansNameSearchMinMembers)
                    }
                    
                    OverlayMenuItem.slider(title: "Search Limit: \(Int(menuValues.limit))",
                                           sliderValue: $menuValues.limit,
                                           in: 10...500,
                                           step: 10) { _ in
                        UD.standardSet(menuValues.limit, forKey: .clansNameSearchLimit)
                    }
                    
                    OverlayMenuItem.button(title: "Location: \(menuValues.region.value.name)",
                                           bgColor: .custom(.blue())) {
                        navigationLinkTriggerer = true
                    }
                    OverlayMenuItem.button(title: "Search", action: searchForClanWithName)
                    OverlayMenuItem.dismissButton(isPresented: $menuValues.menuIsVisible)
                }
                .onChange(of: menuValues.region) { newRegion in
                    UD.standardSet(newRegion.value.key, forKey: .clansNameSearchRegionKey)
                }
                .sheet(isPresented: $resultsSheetPresentation) {
                    NameSearchResultsSheet()
                        .environmentObject(datas)
                        .environmentObject(appearance)
                }
            }
        }
        
        private func searchForClanWithName() {
            guard menuValues.maxMembers >= menuValues.minMembers else {
                appearance.alert = .init(title: "Input is invalid",
                                         message: "Min. Members cannot be more than Max. Members",
                                         primaryButton: .cancel(Text("OK")),
                                         secondaryButton: .default(Text("Fix it!")) {
                                            withAnimation {
                                                menuValues.minMembers = 3
                                                UD.standardSet(menuValues.minMembers,
                                                               forKey: .clansNameSearchMinMembers)
                                                menuValues.maxMembers = 50
                                                UD.standardSet(menuValues.maxMembers,
                                                               forKey: .clansNameSearchMaxMembers)
                                            }
                                         })
                return
            }
            
            guard textFieldString.count > 2 else {
                appearance.alert = .init(title: "Input is invalid",
                                         message: "Entered clan name must have 3 or more characters")
                return
            }
            
            withAnimation {
                menuValues.menuIsVisible = false
                Funcs.after(seconds: 0.3) {
                    actionMenuIsVisible = false
                }
            }
            Requests.ClanNameSearch.init(datas: $datas,
                                         appearance: $appearance,
                                         name: textFieldString,
                                         locationId: menuValues.region.value.id,
                                         minMembers: Int(menuValues.minMembers),
                                         maxMembers: Int(menuValues.maxMembers),
                                         minScore: Int(menuValues.minScore),
                                         limit: Int(menuValues.limit))
                .request { status in
                    switch status {
                    case .succeeded:
                        resultsSheetPresentation = true
                    case .failed: break
                    }
                }
        }
    }
}

//struct ClanNameSearchMenu_Previews: PreviewProvider {
//    static var previews: some View {
//        ClanBaseView.NameSearchMenu(menuValues: .constant(.init()),
//                                    textFieldString: .constant(""))
//            .environmentObject(EnvObjs.ZIndex())
//    }
//}
