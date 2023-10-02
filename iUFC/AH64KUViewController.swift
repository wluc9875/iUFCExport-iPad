//
//  AH64KUViewController.swift
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

class AH64KUViewController: PanelViewController {
    @IBOutlet var kuLabel: UILabel!
    
    override func initActions() {
        actions = [
            Action(type: .pushButton, deviceId: 29, commandId: 3007), // A Key (0)
            Action(type: .pushButton, deviceId: 29, commandId: 3008), // B Key (1)
            Action(type: .pushButton, deviceId: 29, commandId: 3009), // C Key (2)
            Action(type: .pushButton, deviceId: 29, commandId: 3010), // D Key (3)
            Action(type: .pushButton, deviceId: 29, commandId: 3011), // E Key (4)
            Action(type: .pushButton, deviceId: 29, commandId: 3012), // F Key (5)
            Action(type: .pushButton, deviceId: 29, commandId: 3013), // G Key (6)
            Action(type: .pushButton, deviceId: 29, commandId: 3014), // H Key (7)
            Action(type: .pushButton, deviceId: 29, commandId: 3015), // I Key (8)
            Action(type: .pushButton, deviceId: 29, commandId: 3016), // J Key (9)
            Action(type: .pushButton, deviceId: 29, commandId: 3017), // K Key (10)
            Action(type: .pushButton, deviceId: 29, commandId: 3018), // L Key (11)
            Action(type: .pushButton, deviceId: 29, commandId: 3019), // M Key (12)
            Action(type: .pushButton, deviceId: 29, commandId: 3020), // N Key (13)
            Action(type: .pushButton, deviceId: 29, commandId: 3021), // O Key (14)
            Action(type: .pushButton, deviceId: 29, commandId: 3022), // P Key (15)
            Action(type: .pushButton, deviceId: 29, commandId: 3023), // Q Key (16)
            Action(type: .pushButton, deviceId: 29, commandId: 3024), // R Key (17)
            Action(type: .pushButton, deviceId: 29, commandId: 3025), // S Key (18)
            Action(type: .pushButton, deviceId: 29, commandId: 3026), // T Key (19)
            Action(type: .pushButton, deviceId: 29, commandId: 3027), // U Key (20)
            Action(type: .pushButton, deviceId: 29, commandId: 3028), // V Key (21)
            Action(type: .pushButton, deviceId: 29, commandId: 3029), // W Key (22)
            Action(type: .pushButton, deviceId: 29, commandId: 3030), // X Key (23)
            Action(type: .pushButton, deviceId: 29, commandId: 3031), // Y Key (24)
            Action(type: .pushButton, deviceId: 29, commandId: 3032), // Z Key (25)
            Action(type: .pushButton, deviceId: 29, commandId: 3045), // SLASH Key (26)
            Action(type: .pushButton, deviceId: 29, commandId: 3033), // 1 Key (27)
            Action(type: .pushButton, deviceId: 29, commandId: 3034), // 2 Key (28)
            Action(type: .pushButton, deviceId: 29, commandId: 3035), // 3 Key (29)
            Action(type: .pushButton, deviceId: 29, commandId: 3036), // 4 Key (30)
            Action(type: .pushButton, deviceId: 29, commandId: 3037), // 5 Key (31)
            Action(type: .pushButton, deviceId: 29, commandId: 3038), // 6 Key (32)
            Action(type: .pushButton, deviceId: 29, commandId: 3039), // 7 Key (33)
            Action(type: .pushButton, deviceId: 29, commandId: 3040), // 8 Key (34)
            Action(type: .pushButton, deviceId: 29, commandId: 3041), // 9 Key (35)
            Action(type: .pushButton, deviceId: 29, commandId: 3043), // 0 Key (36)
            Action(type: .pushButton, deviceId: 29, commandId: 3042), // DECIMAL Key (37)
            Action(type: .pushButton, deviceId: 29, commandId: 3044), // SIGN Key (38)
            Action(type: .pushButton, deviceId: 29, commandId: 3002), // BKS Key (39)
            Action(type: .pushButton, deviceId: 29, commandId: 3003), // SPC Key (40)
            Action(type: .pushButton, deviceId: 29, commandId: 3049), // MULTIPLY Key (41)
            Action(type: .pushButton, deviceId: 29, commandId: 3048), // DIVIDE Key (42)
            Action(type: .pushButton, deviceId: 29, commandId: 3046), // PLUS Key (43)
            Action(type: .pushButton, deviceId: 29, commandId: 3047), // MINUS Key (44)
            Action(type: .pushButton, deviceId: 29, commandId: 3001), // CLR Key (45)
            Action(type: .pushButton, deviceId: 29, commandId: 3004), // LEFT Key (46)
            Action(type: .pushButton, deviceId: 29, commandId: 3005), // RIGHT Key (47)
            Action(type: .pushButton, deviceId: 29, commandId: 3006), // ENTER Key (48)
        ]
    }
    
    override func updateDisplays(with content: [String: String]) {        
        DispatchQueue.main.async {
            self.kuLabel.text = content["Standby_text"]
        }
    }
}
