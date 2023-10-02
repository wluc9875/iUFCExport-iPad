//
//  F15EUFCViewController.swift
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

class F15EUFCViewController: PanelViewController {
    @IBOutlet var sc01Label: UILabel!
    @IBOutlet var sc02Label: UILabel!
    @IBOutlet var sc03Label: UILabel!
    @IBOutlet var sc04Label: UILabel!
    @IBOutlet var sc05Label: UILabel!
    @IBOutlet var sc05ALabel: UILabel!
    @IBOutlet var sc06Label: UILabel!
    @IBOutlet var sc07Label: UILabel!
    @IBOutlet var sc08Label: UILabel!
    @IBOutlet var sc08ALabel: UILabel!
    @IBOutlet var sc09Label: UILabel!
    @IBOutlet var sc10Label: UILabel!
    @IBOutlet var sc11Label: UILabel!
    @IBOutlet var sc12Label: UILabel!
    @IBOutlet var cc01Label: UILabel!
    @IBOutlet var cc02Label: UILabel!
    @IBOutlet var cc03Label: UILabel!
    @IBOutlet var cc04Label: UILabel!
    
    override func initActions() {
        actions = [
            Action(type: .pushButton, deviceId: 56, commandId: 3020), // 1 Key (0)
            Action(type: .pushButton, deviceId: 56, commandId: 3021), // 2 Key (1)
            Action(type: .pushButton, deviceId: 56, commandId: 3022), // 3 Key (2)
            Action(type: .pushButton, deviceId: 56, commandId: 3025), // 4 Key (3)
            Action(type: .pushButton, deviceId: 56, commandId: 3026), // 5 Key (4)
            Action(type: .pushButton, deviceId: 56, commandId: 3027), // 6 Key (5)
            Action(type: .pushButton, deviceId: 56, commandId: 3030), // 7 Key (6)
            Action(type: .pushButton, deviceId: 56, commandId: 3031), // 8 Key (7)
            Action(type: .pushButton, deviceId: 56, commandId: 3032), // 9 Key (8)
            Action(type: .pushButton, deviceId: 56, commandId: 3036), // 0 Key (9)
            Action(type: .pushButton, deviceId: 56, commandId: 3019), // LEFT GREC (10)
            Action(type: .pushButton, deviceId: 56, commandId: 3023), // RIGHT GREC (11)
            Action(type: .pushButton, deviceId: 56, commandId: 3024), // MARK (12)
            Action(type: .pushButton, deviceId: 56, commandId: 3028), // I/P (13)
            Action(type: .pushButton, deviceId: 56, commandId: 3029), // DECIMAL (14)
            Action(type: .pushButton, deviceId: 56, commandId: 3033), // SHIFT (15)
            Action(type: .pushButton, deviceId: 56, commandId: 3034), // A/P (16)
            Action(type: .pushButton, deviceId: 56, commandId: 3035), // CLEAR (17)
            Action(type: .pushButton, deviceId: 56, commandId: 3037), // DATA (18)
            Action(type: .pushButton, deviceId: 56, commandId: 3038), // MENU (19)
            Action(type: .pushButton, deviceId: 56, commandId: 3018), // EMIS LMT (20)
            
            Action(type: .pushButton, deviceId: 56, commandId: 3001), // Push Button 1") (21)
            Action(type: .pushButton, deviceId: 56, commandId: 3002), // Push Button 2") (22)
            Action(type: .pushButton, deviceId: 56, commandId: 3003), // Push Button 3") (23)
            Action(type: .pushButton, deviceId: 56, commandId: 3004), // Push Button 4") (24)
            Action(type: .pushButton, deviceId: 56, commandId: 3005), // Push Button 5") (25)
            Action(type: .pushButton, deviceId: 56, commandId: 3010), // Push Button 10") (26)
            Action(type: .pushButton, deviceId: 56, commandId: 3009), // Push Button 9") (27)
            Action(type: .pushButton, deviceId: 56, commandId: 3008), // Push Button 8") (28)
            Action(type: .pushButton, deviceId: 56, commandId: 3007), // Push Button 7") (29)
            Action(type: .pushButton, deviceId: 56, commandId: 3006), // Push Button 6") (30)
            
            Action(type: .pushButton, deviceId: 56, commandId: 3055), // LEFT UHF PRESET (31)
            Action(type: .pushButton, deviceId: 56, commandId: 3011, argument: -1), // LEFT UHF CHANNEL DECREASE (32)
            Action(type: .pushButton, deviceId: 56, commandId: 3011, argument: 1), // LEFT UHF CHANNEL INCREASE (33)
            Action(type: .pushButton, deviceId: 56, commandId: 3056), // RIGHT UHF PRESET (34)
            Action(type: .pushButton, deviceId: 56, commandId: 3012, argument: -1), // RIGHT UHF CHANNEL DECREASE (35)
            Action(type: .pushButton, deviceId: 56, commandId: 3012, argument: 1), // RIGHT UHF CHANNEL INCREASE (36)
        ]
    }
    
    override func updateDisplays(with content: [String: String]) {
        DispatchQueue.main.async {
            self.sc01Label.text = content["UFC_SC_01"]
            self.sc02Label.text = content["UFC_SC_02"]
            self.sc03Label.text = content["UFC_SC_03"]
            self.sc04Label.text = content["UFC_SC_04"]
            let sc05Text = content["UFC_SC_05"] ?? ""
            self.sc05Label.text = sc05Text
            self.sc05ALabel.text = content["UFC_SC_05A"]
            self.sc06Label.text = content["UFC_SC_06"]
            self.sc07Label.text = content["UFC_SC_07"]
            var sc08Text = (content["UFC_SC_08"] ?? "").trimmingCharacters(in: .whitespaces)
            if sc08Text.count < 8 {
                sc08Text = sc08Text + "_"
            }
            self.sc08Label.text = sc08Text
            self.sc08ALabel.text = content["UFC_SC_08A"]
            self.sc09Label.text = content["UFC_SC_09"]
            self.sc10Label.text = content["UFC_SC_10"]
            self.sc11Label.text = content["UFC_SC_11"]
            self.sc12Label.text = content["UFC_SC_12"]
            self.cc01Label.text = content["UFC_CC_01"]
            self.cc02Label.text = content["UFC_CC_02"]
            self.cc03Label.text = content["UFC_CC_03"]
            self.cc04Label.text = content["UFC_CC_04"]
        }
    }
}
