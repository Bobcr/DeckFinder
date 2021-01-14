import SwiftUI

struct DeckWalletBaseView: View {
    
    @State var deckWalletMode = getUDDeckWalletMode()
    @State var deckCategories = [DeckWalletCategory]()
    @State var categoryIndex = UD.standardValue(forKey: .deckWalletCategoryIndex) as? Int ?? 0
    @State var categoryNames = [String]()
    
    @State var overlayMenuPresentation = false
    
    @State var updateDeckMenuIsVisible = false
    @State var updateDeckMenuDeckCards = [String]()
    
    @EnvironmentObject var appearance: EnvObjs.Appearance
    @EnvironmentObject var datas: EnvObjs.Datas
    @Environment(\.managedObjectContext) var moc
    @ObservedObject var zIndex = EnvObjs.ZIndex()
    
    var body: some View {
        NavigationView {
            BGStack {
                CustomScrollView(showsIndicators: false) {
                    
                    DeckWalletHeader(categories: $deckCategories,
                                     categoryIndex: $categoryIndex,
                                     categoryNames: $categoryNames)
                        .customPadding(.top, 4)
                    
                    ZStack(alignment: .top) {
                        ForEach(deckCategories.indices, id: \.self) { idx in
                            switch deckWalletMode {
                            case .compact:
                                DeckWalletCompactView(deckCategories: $deckCategories,
                                                      category: deckCategories[idx],
                                                      categoryIndex: categoryIndex,
                                                      updateDeckMenuIsVisible: $updateDeckMenuIsVisible,
                                                      updateDeckMenuDeckCards: $updateDeckMenuDeckCards)
                                    .offset(x: CGFloat(categoryIndex.distance(to: idx))*screen.width)
                            case .expanded(let columns):
                                DeckWalletExpandedView(deckCategories: $deckCategories,
                                                       category: deckCategories[idx],
                                                       categoryIndex: categoryIndex,
                                                       columns: columns,
                                                       updateDeckMenuIsVisible: $updateDeckMenuIsVisible,
                                                       updateDeckMenuDeckCards: $updateDeckMenuDeckCards)
                                    .offset(x: CGFloat(categoryIndex.distance(to: idx))*screen.width)
                            }
                        }
                    }
                }
                
                CreateDeckView
                    .ActionMenuView(selfIsVisible: $updateDeckMenuIsVisible,
                                    deckCards: $updateDeckMenuDeckCards,
                                    activationDatePath: \.first)
                    .zIndex(Double(zIndex.first?.timeIntervalSince1970 ?? 0))
                
                makeOverlayMenu(activationDatePath: \.second)
                    .zIndex(Double(zIndex.second?.timeIntervalSince1970 ?? 0))
            }
            .environmentObject(zIndex)
            .navigationTitle("Deck Wallet")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(leading: leadingButton(), trailing: trailingButton())
            .gesture(swipeGesture(categoryCount: categoryNames.count))
            .onAppear(perform: onAppearAction)
            .onReceive(moc.publisher(for: \.hasChanges, options: .prior)) { hasChanges in
                if hasChanges { updateDecks() }
            }
            .onReceive(NotificationCenter.default.publisher(for: UD.didChangeNotification)) { _ in
                categoryNames = getUDCategoryNames(currentCategoryNames: deckCategories.map{$0.name})
                let oldCategoryIndex = categoryIndex
                categoryIndex.addOrBounce(value: 0, max: categoryNames.count-1)
                if oldCategoryIndex != categoryIndex {
                    UD.standardSet(categoryIndex, forKey: .deckWalletCategoryIndex)
                }
            }
            .onReceive(NotificationCenter.default
                        .publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
                withAnimation {
                    AppDelegate.takeCareOfExtensionDecks(moc: moc)
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    private func trailingButton() -> some View {
        HStack {
            Button(action: changeDeckWalletModeAction) {
                Image(systemName: "cube.fill")
                    .font(.navigationBarImage)
            }
            
            NavigationLink(destination: DeckWalletBaseView.CreateDeckView()) {
                Text("Create")
                    .font(.navigationBarText)
            }
            
            Spacer(minLength: Device.navigationBarItemSpacing)
        }
    }
    
    private func leadingButton() -> some View {
        HStack(spacing: 0) {
            Spacer(minLength: Device.navigationBarItemSpacing)
            
            Button(action: {
                withAnimation {
                    overlayMenuPresentation = true
                }
            }) {
                Image(systemName: "externaldrive.badge.person.crop")
                    .font(.navigationBarImage)
            }
        }
    }
    
    private func changeDeckWalletModeAction() {
        withAnimation {
            switch deckWalletMode {
            case .compact:
                deckWalletMode = .expanded(columns: 1)
            case .expanded(let columns):
                switch columns {
                case 3: deckWalletMode = .compact
                default:
                    deckWalletMode = .expanded(columns: columns+1)
                }
            }
            UD.standardSet(deckWalletMode.userDefaultable(), forKey: .deckWalletMode)
        }
    }
    
    private func onAppearAction() {
        categoryNames = getUDCategoryNames(currentCategoryNames: deckCategories.map{$0.name})
        deckWalletMode = getUDDeckWalletMode()
        deckCategories = .getMOCCategories(moc: moc, appearance: $appearance)
        categoryIndex = UD.standardValue(forKey: .deckWalletCategoryIndex) as? Int ?? 0
        categoryIndex.addOrBounce(value: 0, max: categoryNames.count-1)
    }
    
    private func updateDecks() {
        // Funcs.after used here so this task doesnt conflict with other animations
        Funcs.after(seconds: 0.3) {
            withAnimation {
                deckCategories = .getMOCCategories(moc: moc, appearance: $appearance)
            }
        }
    }
    
    private func swipeGesture(categoryCount: Int) -> some Gesture {
        return DragGesture()
            .onEnded { value in
                withAnimation {
                    let translation = value.translation
                    
                    if translation.width.absoluteDistance(to: 0) > 35 {
                        if translation.width < 0 {
                            if categoryIndex != categoryCount-1 {
                                categoryIndex += 1
                            }
                        }
                        else {
                            if categoryIndex != 0 {
                                categoryIndex -= 1
                            }
                        }
                    }
                }
                
                UD.standardSet(categoryIndex, forKey: .deckWalletCategoryIndex)
            }
    }
    
}

struct DeckWalletBaseView_Previews: PreviewProvider {
    static var previews: some View {
        DeckWalletBaseView()
            .previewDevice("iPhone 7 Plus")
    }
}

private func getUDCategoryNames(currentCategoryNames: [String]) -> [String] {
    (UD.sharedValue(forKey: .deckWalletCategoryNames) as? [String] ?? ["Default"])
        .sorted {
            (currentCategoryNames.firstIndex(of: $0) ?? 1000) <
                (currentCategoryNames.firstIndex(of: $1) ?? 1000)
        }
}

private func getUDDeckWalletMode() -> DeckWalletMode {
    let deckWalletModeStr = UD.standardValue(forKey: .deckWalletMode) as? String ?? ""
    let deckWalletMode = DeckWalletMode.find(key: deckWalletModeStr)
    return deckWalletMode
}

