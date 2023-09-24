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
    /*@IBOutlet var steerImageView: UIImageView!
     @IBOutlet var dataImageView: UIImageView!
     @IBOutlet var selImageView: UIImageView!
     @IBOutlet var deprImageView: UIImageView!
     @IBOutlet var intenImageView: UIImageView!
     @IBOutlet var masterCautionButton: UIButton!*/
    
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
        /*let caution = content["caution"] ?? ""
         
         DispatchQueue.main.async {
         self.masterCautionButton.isSelected = (caution == "1")
         }*/
    }
}
