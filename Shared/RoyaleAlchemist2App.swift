import SwiftUI
import CoreData

@main
struct RoyaleAlchemist2App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @ObservedObject var datas = EnvObjs.Datas()
    @ObservedObject var appearance = EnvObjs.Appearance()
    var moc: NSManagedObjectContext
    
    init() {
        let values = getMOCAndAppearance()
        self.datas = EnvObjs.Datas()
        self.appearance = values.appearance
        self.moc = values.moc
        appDelegate.appearance = values.appearance
        appDelegate.moc = values.moc
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .alert(isPresented: $appearance.alert.presentation, content: alertMaker)
                .notificationMessage()
                .progressView()
                .environmentObject(datas)
                .environmentObject(appearance)
                .environment(\.managedObjectContext, moc)
                .sheet(isPresented: $appearance.shareSheetPresentation) {
                    ActivityViewController.init(activityItems: appearance.shareSheetItems)
                }
        }
    }
    
    private func alertMaker() -> Alert {
        if let secondaryButton = appearance.alert.secondaryButton {
            return Alert(title: appearance.alert.title,
                         message: appearance.alert.message,
                         primaryButton: appearance.alert.primaryButton,
                         secondaryButton: secondaryButton)
        }
        else {
            return Alert(title: appearance.alert.title,
                         message: appearance.alert.message,
                         dismissButton: appearance.alert.primaryButton)
        }
    }
}

private func getMOCAndAppearance() -> (moc: NSManagedObjectContext,
                                       appearance: EnvObjs.Appearance) {
    let appearance = EnvObjs.Appearance()
    
    let persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "Core Data Model")
        
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                // the app might want to crash if its in the `DeckWallet` tab,
                // when there is an error in here.
                // so i set selection to Settings to make sure that won't happen.
                UD.standard.setValue("Settings", forKey: "tabBarSelection")
                appearance.alert = .init(title: "Failed Trying To Load Data From Phone's Storage",
                                         message: "error description: \"\(error.localizedDescription)\"")
            }
        }
        
        return container
    }()
    
    return (moc: persistentContainer.viewContext,
            appearance: appearance)
}
