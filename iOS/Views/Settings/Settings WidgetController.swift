import SwiftUI
import WidgetKit

extension SettingsBaseView {
    @ViewBuilder
    func makeWidgetController() -> some View {
        VStack(spacing: 0) {
            Text("Home Screen Widgets")
                .customFont(size: 24, weight: .medium)
                .customPadding(.bottom, 4)
                .foregroundColor(.custom(.green()))
            
            Button(action: tryToRefreshAllWidgets) {
                HStack(spacing: 0) {
                    Spacer()
                    
                    Text("Refresh All Widgets")
                        .customFont(size: 22, weight: .semibold)
                        .customPadding(.vertical, 3)
                    
                    Spacer()
                }
                .customPadding(t: 3, l: 4, b: 3, tr: 4)
                .foregroundColor(.white)
                .background(Color.custom(.orange()))
                .customCornerRadius(8)
                .customPadding(t: 3, l: 4, b: 3, tr: 4)
            }
            .buttonStyle(SpringButtonStyle())
        }
        .customFrame(maxWidth: .infinity)
        .customPadding(6)
        .background(Color.custom(.white()))
        .customCornerRadius(8)
        .customPadding(t: 6, l: 10, b: 6, tr: 10)
        .shadow(color: .custom(.blackShadow(), opacity: 0.2), radius: 4, x: 0, y: 0)
    }
    
    private func tryToRefreshAllWidgets() {
        WidgetCenter.shared.getCurrentConfigurations { result in
            switch result {
            case .success(let widgetsInfo):
                
                let userIsUsingOneOrMoreWidgets = widgetsInfo
                    .map {
                        $0.configuration
                            .debugDescription
                            .contains("playerTag = <null>")
                    }
                    .contains(false)
                
                if userIsUsingOneOrMoreWidgets {
                    WidgetCenter.shared.reloadAllTimelines()
                    DispatchQueue.main.async {
                        appearance.alert = .init(
                            title: "Royale Alchemist will try to reload all your widgets",
                            message: nil)
                    }
                }
                else {
                    failed()
                }
            default:
                failed()
            }
        }
    }
    
    private func failed() {
        DispatchQueue.main.async {
            appearance.alert = .init(
                title: "Could not find any home-screen widgets in use.",
                message: nil)
        }
    }
}
