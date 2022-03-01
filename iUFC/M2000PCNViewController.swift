//
//  M2000ViewController.swift
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

class M2000PCNViewController: PanelViewController {
    @IBOutlet var effButton: UIButton!
    @IBOutlet var insButton: UIButton!
    @IBOutlet var prepButton: UIButton!
    @IBOutlet var destButton: UIButton!
    @IBOutlet var badButton: UIButton!
    @IBOutlet var recButton: UIButton!
    @IBOutlet var valButton: UIButton!
    @IBOutlet var mrcButton: UIButton!
    @IBOutlet var rotatorImageView: UIImageView!
    @IBOutlet var blDigitsLabel: UILabel!
    @IBOutlet var brDigitsLabel: UILabel!
    @IBOutlet var ulDigitsLabel: UILabel!
    @IBOutlet var urDigitsLabel: UILabel!
    @IBOutlet var ulPointsLabel: UILabel!
    @IBOutlet var urPointsLabel: UILabel!
    @IBOutlet var ulNorthLabel: UILabel!
    @IBOutlet var ulSouthLabel: UILabel!
    @IBOutlet var urEastLabel: UILabel!
    @IBOutlet var urWestLabel: UILabel!
    
    // TBD
    static let rotatorToImageView = [
        0.0: "M2000C/M2000-PCN-rotary1",
        1.0: "M2000C/M2000-PCN-rotary2",
        2.0: "M2000C/M2000-PCN-rotary3",
        3.0: "M2000C/M2000-PCN-rotary4",
        4.0: "M2000C/M2000-PCN-rotary5",
        5.0: "M2000C/M2000-PCN-rotary6",
        6.0: "M2000C/M2000-PCN-rotary7",
        7.0: "M2000C/M2000-PCN-rotary8",
        8.0: "M2000C/M2000-PCN-rotary9",
        9.0: "M2000C/M2000-PCN-rotary10",
        10.0: "M2000C/M2000-PCN-rotary11",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func initActions() {
        actions = [
            Action(type: .pushButton, deviceId: 9, commandId: 3593), // NUM0 (0)
            Action(type: .pushButton, deviceId: 9, commandId: 3584), // NUM1 (1)
            Action(type: .pushButton, deviceId: 9, commandId: 3585), // NUM2 (2)
            Action(type: .pushButton, deviceId: 9, commandId: 3586), // NUM3 (3)
            Action(type: .pushButton, deviceId: 9, commandId: 3587), // NUM4 (4)
            Action(type: .pushButton, deviceId: 9, commandId: 3588), // NUM5 (5)
            Action(type: .pushButton, deviceId: 9, commandId: 3589), // NUM6 (6)
            Action(type: .pushButton, deviceId: 9, commandId: 3590), // NUM7 (7)
            Action(type: .pushButton, deviceId: 9, commandId: 3591), // NUM8 (8)
            Action(type: .pushButton, deviceId: 9, commandId: 3592), // NUM9 (9)
            Action(type: .pushButton, deviceId: 9, commandId: 3594), // EFF (10) indicator 595
            Action(type: .pushButton, deviceId: 9, commandId: 3596), // INS (11) indicator 597
            Action(type: .pushButton, deviceId: 9, commandId: 3570), // PREP (12) indicator 571
            Action(type: .pushButton, deviceId: 9, commandId: 3572), // DEST (13) indicator 573
            Action(type: .pushButton, deviceId: 9, commandId: 3576), // BAD (14) indicator 577
            Action(type: .pushButton, deviceId: 9, commandId: 3578), // REC (15) indicator 579
            Action(type: .pushButton, deviceId: 9, commandId: 3580), // VAL (16) indicator 581
            Action(type: .pushButton, deviceId: 9, commandId: 3582), // MRC (17) indicator 583
            Action(type: .rotatorCCW, deviceId: 9, commandId: 3574, argument: 0.0, increment: 0.1, minimum: 0.0, maximum: 1.0), // PCN Selector CCW (18)  indicator 574
            Action(type: .rotatorCW, deviceId: 9, commandId: 3574, argument: 0.0, increment: 0.1, minimum: 0.0, maximum: 1.0), // PCN Selector CW (19)
        ]
    }
    
    override func updateDisplays(with content: [String: String]) {
        let buttons: [UIButton] = [
            effButton,
            insButton,
            prepButton,
            destButton,
            badButton,
            recButton,
            valButton,
            mrcButton
        ]
        
        let lights = (content["lights"] ?? "").split(separator: " ")
        
        let blDigits = content["PCN_BL_DIGITS"] ?? ""
        let brDigits = content["PCN_BR_DIGITS"] ?? ""
        let ulDigits = content["PCN_UL_DIGITS"] ?? ""
        let urDigits = content["PCN_UR_DIGITS"] ?? ""
        let ulPoints = content["PCN_UL_POINTS"] ?? ""
        let urPoints = content["PCN_UR_POINTS"] ?? ""
        let ulNorth = (content["PCN_UL_N"] ?? "") + (content["PCN_UL_P"] ?? "")
        let ulSouth = (content["PCN_UL_S"] ?? "") + (content["PCN_UL_M"] ?? "")
        let urEast = (content["PCN_UR_E"] ?? "") + (content["PCN_UR_P"] ?? "")
        let urWest = (content["PCN_UR_W"] ?? "") + (content["PCN_UR_M"] ?? "")
        
        var rotatorImage: UIImage? = nil
        if let rotator = content["rotator"] {
            if let rotatorAsNumber = Double(rotator) {
                let roundedRotator = (rotatorAsNumber * 10.0).rounded()
                actions[18].argument = roundedRotator / 10.0
                actions[19].argument = roundedRotator / 10.0
                if let rotatorImageName = M2000PCNViewController.rotatorToImageView[roundedRotator] {
                    rotatorImage = UIImage(named: rotatorImageName)
                }
            }
        }
        
        DispatchQueue.main.async {
            self.rotatorImageView.image = rotatorImage
            
            self.blDigitsLabel.text = blDigits
            self.brDigitsLabel.text = brDigits
            self.ulDigitsLabel.text = ulDigits
            self.urDigitsLabel.text = urDigits
            self.ulPointsLabel.text = ulPoints
            self.urPointsLabel.text = urPoints
            self.ulNorthLabel.text = ulNorth
            self.ulSouthLabel.text = ulSouth
            self.urEastLabel.text = urEast
            self.urWestLabel.text = urWest
            
            var i = 0
            for light in lights {
                buttons[i].isSelected = (light == "1")
                i += 1
            }
        }
    }
}
