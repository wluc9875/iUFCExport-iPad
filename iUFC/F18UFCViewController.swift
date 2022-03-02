//
//  ViewController.swift
//  iUFC
//
//   Copyright 2021-present Luc Walterthum
//
//   Licensed under the Apache License, Version 2.0 (the "License");
//   you may not use this file except in compliance with the License.
//   You may obtain a copy of the License at
//
//       http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in writing, software
//   distributed under the License is distributed on an "AS IS" BASIS,
//   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//   See the License for the specific language governing permissions and
//   limitations under the License.

import UIKit

class F18UFCViewController: PanelViewController {
    @IBOutlet var osbLabel1: UILabel!
    @IBOutlet var osbLabel2: UILabel!
    @IBOutlet var osbLabel3: UILabel!
    @IBOutlet var osbLabel4: UILabel!
    @IBOutlet var osbLabel5: UILabel!
    @IBOutlet var scratchpadPrefixLabel: UILabel!
    @IBOutlet var scratchpadLabel: UILabel!
    @IBOutlet var com1Label: UILabel!
    @IBOutlet var com2Label: UILabel!
    @IBOutlet var adfImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func initActions() {
        actions = [
            Action(type: .pushButton, deviceId: 25, commandId: 3018), // UFC Button 0 (0)
            Action(type: .pushButton, deviceId: 25, commandId: 3019), // UFC Button 1 (1)
            Action(type: .pushButton, deviceId: 25, commandId: 3020), // UFC Button 2 (2)
            Action(type: .pushButton, deviceId: 25, commandId: 3021), // UFC Button 3 (3)
            Action(type: .pushButton, deviceId: 25, commandId: 3022), // UFC Button 4 (4)
            Action(type: .pushButton, deviceId: 25, commandId: 3023), // UFC Button 5 (5)
            Action(type: .pushButton, deviceId: 25, commandId: 3024), // UFC Button 6 (6)
            Action(type: .pushButton, deviceId: 25, commandId: 3025), // UFC Button 7 (7)
            Action(type: .pushButton, deviceId: 25, commandId: 3026), // UFC Button 8 (8)
            Action(type: .pushButton, deviceId: 25, commandId: 3027), // UFC Button 9 (9)
            Action(type: .pushButton, deviceId: 25, commandId: 3028), // UFC Button CLR (10)
            Action(type: .pushButton, deviceId: 25, commandId: 3029), // UFC Button ENT (11)
            Action(type: .pushButton, deviceId: 25, commandId: 3001), // UFC Button A/P (12)
            Action(type: .pushButton, deviceId: 25, commandId: 3002), // UFC Button IFF (13)
            Action(type: .pushButton, deviceId: 25, commandId: 3003), // UFC Button TCN (14)
            Action(type: .pushButton, deviceId: 25, commandId: 3004), // UFC Button ILS (15)
            Action(type: .pushButton, deviceId: 25, commandId: 3005), // UFC Button D/L (16)
            Action(type: .pushButton, deviceId: 25, commandId: 3006), // UFC Button BCN (17)
            Action(type: .pushButton, deviceId: 25, commandId: 3007), // UFC Button ON/OFF (18)
            Action(type: .pushButton, deviceId: 25, commandId: 3010), // UFC Button OSB 1 (19)
            Action(type: .pushButton, deviceId: 25, commandId: 3011), // UFC Button OSB 2 (20)
            Action(type: .pushButton, deviceId: 25, commandId: 3012), // UFC Button OSB 3 (21)
            Action(type: .pushButton, deviceId: 25, commandId: 3013), // UFC Button OSB 4 (22)
            Action(type: .pushButton, deviceId: 25, commandId: 3014), // UFC Button OSB 5 (23)
            Action(type: .pushButton, deviceId: 25, commandId: 3015), // UFC Button I/P (24)
            Action(type: .pushButton, deviceId: 25, commandId: 3017), // UFC Button EMCON (25)
            
            Action(type: .pushButton, deviceId: 25, commandId: 3033, argument: 0.03), // UFC COM1 Increase (26)
            Action(type: .pushButton, deviceId: 25, commandId: 3008), // UFC COM1 Push (27)
            Action(type: .pushButton, deviceId: 25, commandId: 3033, argument: -0.03), // UFC COM1 Decrease (28)
            Action(type: .pushButton, deviceId: 25, commandId: 3034, argument: 0.03), // UFC COM2 Increase (29)
            Action(type: .pushButton, deviceId: 25, commandId: 3009), // UFC COM2 Push (30)
            Action(type: .pushButton, deviceId: 25, commandId: 3034, argument: -0.03), // UFC COM2 Decrease (31)
            
            Action(type: .pushButton, deviceId: 25, commandId: 3016, argument: 1.0), // ADF 1 (32)
            Action(type: .pushButton, deviceId: 25, commandId: 3016, argument: 0.0), // ADF OFF (33)
            Action(type: .pushButton, deviceId: 25, commandId: 3016, argument: -1.0), // ADF 2 (34)
            Action(type: .pushButton, deviceId: 25, commandId: 3036, argument: -1), // COMM1 VOL Decrease (35)
            Action(type: .pushButton, deviceId: 25, commandId: 3036, argument: 1), // COMM1 VOL Increase (36)
            Action(type: .pushButton, deviceId: 25, commandId: 3038, argument: -1), // COMM2 VOL Decrease (37)
            Action(type: .pushButton, deviceId: 25, commandId: 3038, argument: 1), // COMM2 VOL Increase (38)
            Action(type: .pushButton, deviceId: 25, commandId: 3040, argument: -1), // BRT Decrease (39)
            Action(type: .pushButton, deviceId: 25, commandId: 3040, argument: 1), // BRT Increase (40)
        ]
    }
    
    override func updateDisplays(with content: [String: String]) {
        var optionQueuing1 = content["UFC_OptionCueing1"] ?? ""
        if optionQueuing1.isEmpty {optionQueuing1 = " "}
        var optionQueuing2 = content["UFC_OptionCueing2"] ?? ""
        if optionQueuing2.isEmpty {optionQueuing2 = " "}
        var optionQueuing3 = content["UFC_OptionCueing3"] ?? ""
        if optionQueuing3.isEmpty {optionQueuing3 = " "}
        var optionQueuing4 = content["UFC_OptionCueing4"] ?? ""
        if optionQueuing4.isEmpty {optionQueuing4 = " "}
        var optionQueuing5 = content["UFC_OptionCueing5"] ?? ""
        if optionQueuing5.isEmpty {optionQueuing5 = " "}
        var scratchpadPrefix = (content["UFC_ScratchPadString1Display"] ?? "") + (content["UFC_ScratchPadString2Display"] ?? "")
        scratchpadPrefix = scratchpadPrefix.replacingOccurrences(of: "_", with: "-")
        scratchpadPrefix = scratchpadPrefix.replacingOccurrences(of: "`", with: "1")
        scratchpadPrefix = scratchpadPrefix.replacingOccurrences(of: "~", with: "2")
        var scratchpadText = content["UFC_ScratchPadNumberDisplay"] ?? ""
        scratchpadText = scratchpadText.replacingOccurrences(of: "@", with: "°")
        scratchpadText = scratchpadText.replacingOccurrences(of: ".", with: "o")
        scratchpadText = scratchpadText.replacingOccurrences(of: "pww0w", with: "ERROR")
        var comm1Text = content["UFC_Comm1Display"] ?? ""
        comm1Text = comm1Text.replacingOccurrences(of: "`", with: "1")
        comm1Text = comm1Text.replacingOccurrences(of: "~", with: "2")
        comm1Text = comm1Text.replacingOccurrences(of: "d", with: "\\/")
        var comm2Text = content["UFC_Comm2Display"] ?? ""
        comm2Text = comm2Text.replacingOccurrences(of: "`", with: "1")
        comm2Text = comm2Text.replacingOccurrences(of: "~", with: "2")
        comm2Text = comm2Text.replacingOccurrences(of: "d", with: "\\/")
        
        DispatchQueue.main.async {
            self.osbLabel1.text = optionQueuing1 + (content["UFC_OptionDisplay1"] ?? "")
            self.osbLabel2.text = optionQueuing2 + (content["UFC_OptionDisplay2"] ?? "")
            self.osbLabel3.text = optionQueuing3 + (content["UFC_OptionDisplay3"] ?? "")
            self.osbLabel4.text = optionQueuing4 + (content["UFC_OptionDisplay4"] ?? "")
            self.osbLabel5.text = optionQueuing5 + (content["UFC_OptionDisplay5"] ?? "")
            self.scratchpadPrefixLabel.text = scratchpadPrefix
            self.scratchpadLabel.text = scratchpadText
            self.com1Label.text = comm1Text
            self.com2Label.text = comm2Text
            
            switch content["adf"] {
            case "1":
                self.adfImageView.image = UIImage(named: "F18/ADF1")
            case "-1":
                self.adfImageView.image = UIImage(named: "F18/ADF2")
            default:
                self.adfImageView.image = nil
            }
        }
    }
}

