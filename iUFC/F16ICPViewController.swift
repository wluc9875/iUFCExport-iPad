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
import Network

class F16ICPViewController: PlaneViewController {    
    @IBOutlet var flirImageView: UIImageView!
    @IBOutlet var dedImageView: UIImageView!
    @IBOutlet var driftImageView: UIImageView!
    @IBOutlet var flirGainImageView: UIImageView!
    @IBOutlet var dcsImageView: UIImageView!
    
    override func initActions() {
        actions = [
            Action(type: .pushButton, deviceId: 17, commandId: 3002), // ICP Button 0 (0)
            Action(type: .pushButton, deviceId: 17, commandId: 3003), // ICP Button 1 (1)
            Action(type: .pushButton, deviceId: 17, commandId: 3004), // ICP Button 2 (2)
            Action(type: .pushButton, deviceId: 17, commandId: 3005), // ICP Button 3 (3)
            Action(type: .pushButton, deviceId: 17, commandId: 3006), // ICP Button 4 (4)
            Action(type: .pushButton, deviceId: 17, commandId: 3007), // ICP Button 5 (5)
            Action(type: .pushButton, deviceId: 17, commandId: 3008), // ICP Button 6 (6)
            Action(type: .pushButton, deviceId: 17, commandId: 3009), // ICP Button 7 (7)
            Action(type: .pushButton, deviceId: 17, commandId: 3010), // ICP Button 8 (8)
            Action(type: .pushButton, deviceId: 17, commandId: 3011), // ICP Button 9 (9)
            Action(type: .pushButton, deviceId: 17, commandId: 3012), // ICP Button COM1 (10)
            Action(type: .pushButton, deviceId: 17, commandId: 3013), // ICP Button COM2 (11)
            Action(type: .pushButton, deviceId: 17, commandId: 3014), // ICP Button IFF (12)
            Action(type: .pushButton, deviceId: 17, commandId: 3015), // ICP Button LIST (13)
            Action(type: .pushButton, deviceId: 17, commandId: 3018), // ICP Button A-A (14)
            Action(type: .pushButton, deviceId: 17, commandId: 3019), // ICP Button A-G (15)
            Action(type: .pushButton, deviceId: 17, commandId: 3017), // ICP Button RCL (16)
            Action(type: .pushButton, deviceId: 17, commandId: 3016), // ICP Button ENTR (17)
            Action(type: .pushButton, deviceId: 17, commandId: 3024), // ICP Button WX (18)
            Action(type: .pushButton, deviceId: 17, commandId: 3025), // ICP Button FLIR Up (19)
            Action(type: .pushButton, deviceId: 17, commandId: 3026, argument: -1.0), // ICP Button FLIR Down (20)
            Action(type: .pushButton, deviceId: 17, commandId: 3030), // ICP DED Increment (21)
            Action(type: .pushButton, deviceId: 17, commandId: 3031, argument: -1.0), // ICP DED Decrement (22)
            Action(type: .pushButton, deviceId: 17, commandId: 3028), // ICP Drift C/O (23)
            Action(type: .pushButton, deviceId: 17, commandId: 3029, argument: -1.0), // ICP Warn Reset (24)
            Action(type: .pushButton, deviceId: 17, commandId: 3032, argument: -1.0), // ICP Data Control Switch RTN (25)
            Action(type: .pushButton, deviceId: 17, commandId: 3033), // ICP Data Control Switch SEQ (26)
            Action(type: .pushButton, deviceId: 17, commandId: 3034), // ICP Data Control Switch Up (27)
            Action(type: .pushButton, deviceId: 17, commandId: 3035, argument: -1.0), // ICP Data Control Switch Down (28)
            Action(type: .pushButton, deviceId: 17, commandId: 3027, argument: 1.0), // ICP FLIR GAIN (29)
            Action(type: .pushButton, deviceId: 17, commandId: 3027, argument: 0.0), // ICP FLIR LVL (30)
            Action(type: .pushButton, deviceId: 17, commandId: 3027, argument: -1.0), // ICP FLIR AUTO (31)
            Action(type: .pushButton, deviceId: 17, commandId: 3040, argument: 1), // SYM Increase (32)
            Action(type: .pushButton, deviceId: 17, commandId: 3040, argument: -1), // SYM Decrease (33)
            Action(type: .pushButton, deviceId: 17, commandId: 3042, argument: 1), // DEPR RETL Increase (34)
            Action(type: .pushButton, deviceId: 17, commandId: 3042, argument: -1), // DEPR RETL Decrease (35)
            Action(type: .pushButton, deviceId: 17, commandId: 3044, argument: 1), // BRT Increase (36)
            Action(type: .pushButton, deviceId: 17, commandId: 3044, argument: -1), // BRT Decrease (37)
            Action(type: .pushButton, deviceId: 17, commandId: 3046, argument: 1), // CONT Increase (38)
            Action(type: .pushButton, deviceId: 17, commandId: 3046, argument: -1), // CONT Decrease (39)
            Action(type: .pushButton, deviceId: 17, commandId: 3028, argument: 0.0), // ICP Drift Normal (40)
        ]
        
        originalSwitchImages = [
            19: "",
            20: "",
            21: "",
            22: "",
            24: "",
            25: "",
            26: "",
            27: "",
            28: ""
        ]
        
        alternateSwitchImages = [
            19: "f16/FLIR_INC",
            20: "f16/FLIR_DEC",
            21: "f16/DED_INC",
            22: "f16/DED_DEC",
            24: "f16/WARN_RESET",
            25: "f16/DCS_RTN",
            26: "f16/DCS_SEQ",
            27: "f16/DCS_INC",
            28: "f16/DCS_DEC",
        ]
        
        actionToViewDict = [
            19: flirImageView,
            20: flirImageView,
            21: dedImageView,
            22: dedImageView,
            24: driftImageView,
            25: dcsImageView,
            26: dcsImageView,
            27: dcsImageView,
            28: dcsImageView,
        ]
    }
    
    override func updateDisplays(with content: [String: String]) {
        DispatchQueue.main.async {
            switch content["flirgain"] {
            case "1":
                self.flirGainImageView.image = UIImage(named: "f16/FLIR_GAIN")
            case "-1":
                self.flirGainImageView.image = UIImage(named: "f16/FLIR_AUTO")
            default:
                self.flirGainImageView.image = nil
            }
            switch content["driftco"] {
            case "1":
                self.driftImageView.image = UIImage(named: "f16/DRIFT_CO")
            case "0":
                self.driftImageView.image = nil
            default:
                break
            }
        }
    }
}

