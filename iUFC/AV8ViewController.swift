//
//  AV8ViewController.swift
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

class AV8ViewController: PanelViewController {
    @IBOutlet var oduLabel1: UILabel!
    @IBOutlet var oduLabel2: UILabel!
    @IBOutlet var oduLabel3: UILabel!
    @IBOutlet var oduLabel4: UILabel!
    @IBOutlet var oduLabel5: UILabel!
    @IBOutlet var scratchpadLeftLabel: UILabel!
    @IBOutlet var scratchpadRightLabel: UILabel!
    @IBOutlet var com1Label: UILabel!
    @IBOutlet var com2Label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func initActions() {
        actions = [
            // UFC
            Action(type: .pushButton, deviceId: 23, commandId: 3315), // UFC Button 0 (0)
            Action(type: .pushButton, deviceId: 23, commandId: 3302), // UFC Button 1 (1)
            Action(type: .pushButton, deviceId: 23, commandId: 3303), // UFC Button 2 (2)
            Action(type: .pushButton, deviceId: 23, commandId: 3304), // UFC Button 3 (3)
            Action(type: .pushButton, deviceId: 23, commandId: 3306), // UFC Button 4 (4)
            Action(type: .pushButton, deviceId: 23, commandId: 3307), // UFC Button 5 (5)
            Action(type: .pushButton, deviceId: 23, commandId: 3308), // UFC Button 6 (6)
            Action(type: .pushButton, deviceId: 23, commandId: 3310), // UFC Button 7 (7)
            Action(type: .pushButton, deviceId: 23, commandId: 3311), // UFC Button 8 (8)
            Action(type: .pushButton, deviceId: 23, commandId: 3312), // UFC Button 9 (9)
            Action(type: .pushButton, deviceId: 23, commandId: 3314), // UFC Button ENT (10)
            Action(type: .pushButton, deviceId: 23, commandId: 3316), // UFC Button . (11)
            Action(type: .pushButton, deviceId: 23, commandId: 3305), // UFC Button CLR (12)
            Action(type: .pushButton, deviceId: 23, commandId: 3309), // UFC Button SVE (13)
            Action(type: .pushButton, deviceId: 23, commandId: 3313), // UFC Button - (14)
            Action(type: .pushButton, deviceId: 23, commandId: 3317), // UFC Button ON/OFF (15)
            Action(type: .pushButton, deviceId: 23, commandId: 3318), // UFC Button IFF (16)
            Action(type: .pushButton, deviceId: 23, commandId: 3319), // UFC Button TCN (17)
            Action(type: .pushButton, deviceId: 23, commandId: 3320), // UFC Button AWL (18)
            Action(type: .pushButton, deviceId: 23, commandId: 3321), // UFC Button WPN (19)
            Action(type: .pushButton, deviceId: 23, commandId: 3322), // UFC Button WOF (20)
            Action(type: .pushButton, deviceId: 23, commandId: 3323), // UFC Button BCN (21)
            Action(type: .pushButton, deviceId: 23, commandId: 3324), // UFC Button ALT (22)
            Action(type: .pushButton, deviceId: 23, commandId: 3325), // UFC Button EMCON (23)
            Action(type: .pushButton, deviceId: 23, commandId: 3294), // UFC Button TMR (24)
            Action(type: .pushButton, deviceId: 23, commandId: 3296), // UFC Button TOO (25)
            Action(type: .pushButton, deviceId: 23, commandId: 3297), // UFC Button I/P (26)
            
            // ODU
            Action(type: .pushButton, deviceId: 24, commandId: 3250), // ODU 1 (27)
            Action(type: .pushButton, deviceId: 24, commandId: 3251), // ODU 2 (28)
            Action(type: .pushButton, deviceId: 24, commandId: 3252), // ODU 3 (29)
            Action(type: .pushButton, deviceId: 24, commandId: 3248), // ODU 4 (30)
            Action(type: .pushButton, deviceId: 24, commandId: 3249), // ODU 5 (31)
            
            // COMMS
            Action(type: .pushButton, deviceId: 23, commandId: 3178), // UFC Comm 1 Channel Selector Pull (32)
            Action(type: .pushButton, deviceId: 23, commandId: 3179), // UFC Comm 2 Channel Selector Pull (33)
            Action(type: .pushButton, deviceId: 23, commandId: 3300, argument: 0.015), // UFC COM1 Increase (34)
            Action(type: .pushButton, deviceId: 23, commandId: 3300, argument: -0.015), // UFC COM1 Increase (35)
            Action(type: .pushButton, deviceId: 23, commandId: 3301, argument: 0.015), // UFC COM1 Increase (36)
            Action(type: .pushButton, deviceId: 23, commandId: 3301, argument: -0.015), // UFC COM1 Increase (37)
        ]
    }
    
    override func updateDisplays(with content: [String: String]) {
        var scratchpadRight = content["ufc_right_position"] ?? ""
        scratchpadRight = scratchpadRight.replacingOccurrences(of: "@", with: "°")
        var comm1 = content["ufc_chnl_1_m"] ?? ""
        if !comm1.isEmpty {comm1.removeFirst()}
        var comm2 = content["ufc_chnl_2_m"] ?? ""
        if !comm2.isEmpty {comm2.removeFirst()}
        let odu1Text = content["ODU_Option_1_Text"] ?? ""
        let odu2Text = content["ODU_Option_2_Text"] ?? ""
        var odu3Text = content["ODU_Option_3_Text"] ?? ""
        let odu4Text = content["ODU_Option_4_Text"] ?? ""
        let odu5Text = content["ODU_Option_5_Text"] ?? ""
        // remove Razbam garbage from ODU 3 (only happens in BCN context)
        if odu1Text == "STBY" && odu2Text == "NORM" {
            odu3Text = ""
        }
        
        DispatchQueue.main.async {
            self.oduLabel1.text = "\(content["ODU_Option_1_Slc"] ?? "") \(odu1Text)"
            self.oduLabel2.text = "\(content["ODU_Option_2_Slc"] ?? "") \(odu2Text)"
            self.oduLabel3.text = "\(content["ODU_Option_3_Slc"] ?? "") \(odu3Text)"
            self.oduLabel4.text = "\(content["ODU_Option_4_Slc"] ?? "") \(odu4Text)"
            self.oduLabel5.text = "\(content["ODU_Option_5_Slc"] ?? "") \(odu5Text)"
            self.scratchpadLeftLabel.text = content["ufc_left_position"] ?? ""
            self.scratchpadRightLabel.text = scratchpadRight
            self.com1Label.text = comm1
            self.com2Label.text = comm2
        }
    }
}
