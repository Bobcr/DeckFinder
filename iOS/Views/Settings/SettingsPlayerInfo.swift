import SwiftUI

extension SettingsBaseView {
    func makePlayerInfo() -> some View {
        VStack(spacing: 0) {
            Text("Player info")
                .customFont(size: 24, weight: .medium)
                .customPadding(.bottom, 6)
                .foregroundColor(.custom(.green()))
            
            makePlayerTagFieldAndButton()
            makeGrandChallengeSlider()
            makeClassicChallengeSlider()
        }
        .customFrame(maxWidth: .infinity)
        .customPadding(6)
        .background(Color.custom(.white()))
        .customCornerRadius(8)
        .customPadding(t: 6, l: 10, b: 6, tr: 10)
        .shadow(color: .custom(.blackShadow(), opacity: 0.2), radius: 4, x: 0, y: 0)
    }
    
    @ViewBuilder
    private func makePlayerTagFieldAndButton() -> some View {
        TextField("Enter your player tag", text: $textFieldPlayerTag)
            .foregroundColor(.custom(.black(id: .c2)))
            .customPadding(t: 4, l: 10, b: 4, tr: 10)
            .background(Color.custom(.yellow()))
            .customCornerRadius(8)
            .customFont(size: 22, weight: .medium)
            .autocapitalization(.allCharacters)
        
        let isValidateButtonDisabled = stateOfValidateButton()
        
        Button(isValidateButtonDisabled ?
                "Player Tag Is Validated" :
                "Validate Player Tag",
               action: validateButtonAction)
            .customPadding(t: 4, l: 6, b: 4, tr: 6)
            .background(Color.custom(isValidateButtonDisabled ? .gray() : .blue()))
            .customCornerRadius(6)
            .foregroundColor(.custom(.white()))
            .customPadding(t: 8, l: 6, b: 4, tr: 6)
            .customFont(size: 20)
            .disabled(isValidateButtonDisabled)
    }
    
    @ViewBuilder
    private func makeGrandChallengeSlider() -> some View {
        HStack(spacing: 0) {
            Spacer()
            
            Image("challenge-grand")
                .resizable()
                .customFrame(width: 34, height: 34)
                .customPadding(.trailing, 4)
            
            let gcText = "Avg. Grand Challenge Wins:"
            
            Text(gcSlider == -999 ? "\(gcText) not set" :
                    "\(gcText) \(Int(gcSlider)) wins")
                .customFont(size: 18, weight: .medium)
            
            Spacer()
        }
        .customPadding(t: 10, b: 6)
        
        Slider(value: $gcSlider, in: 0...12, step: 1) { _ in
            UD.standardSet(gcSlider, forKey: .grandChallengeAverageWins)
        }
        .customPadding(l: 20, b: 6, tr: 20)
    }
    
    @ViewBuilder
    private func makeClassicChallengeSlider() -> some View {
        HStack(spacing: 0) {
            Spacer()
            
            Image("challenge-classic")
                .resizable()
                .customFrame(width: 34, height: 34)
                .customPadding(.trailing, 4)
            
            let ccText = "Avg. Classic Challenge Wins:"
            
            Text(ccSlider == -999 ? "\(ccText) not set" :
                    "\(ccText) \(Int(ccSlider)) wins")
                .customFont(size: 18, weight: .medium)
            
            Spacer()
        }
        .customPadding(t: 10, b: 6)
        
        Slider(value: $ccSlider, in: 0...12, step: 1) {_ in
            UD.standardSet(ccSlider, forKey: .classicChallengeAverageWins)
        }
        .customPadding(l: 20, b: 6, tr: 20)
    }
    
    private func stateOfValidateButton() -> Bool {
        let udTag = UD.sharedValue(forKey: .playerTag) as? String
        if let tag = udTag {
            return tag.asTag() == textFieldPlayerTag.asTag()
        }
        else {
            return false
        }
    }
    
    private func validateButtonAction() {
        Requests.PlayerProfile(datas: $datas,
                               appearance: $appearance,
                               tag: textFieldPlayerTag)
            .request { status in
                if status == .succeeded {
                    Present.notificationMessage(appearance: $appearance,
                                                message: "Tag Validation Successful!")
                    
                    let tag = textFieldPlayerTag.asTag()
                    UD.sharedSet(tag, forKey: .playerTag)
                    textFieldPlayerTag = tag
                }
                datas.playerProfile = .init()
            }
    }
}
