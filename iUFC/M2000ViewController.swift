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

class M2000ViewController: PlaneViewController {
    @IBOutlet var effButton: UIButton!
    @IBOutlet var insButton: UIButton!
    @IBOutlet var prepButton: UIButton!
    @IBOutlet var destButton: UIButton!
    @IBOutlet var badButton: UIButton!
    @IBOutlet var recButton: UIButton!
    @IBOutlet var valButton: UIButton!
    @IBOutlet var mrcButton: UIButton!
    @IBOutlet var rotatorImageView: UIImageView!
    
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
            Action(type: .pushButton, deviceId: 9, commandId: 3594), // EFF (10) device 595
            Action(type: .pushButton, deviceId: 9, commandId: 3596), // INS (11) device 597
            Action(type: .pushButton, deviceId: 9, commandId: 3570), // PREP (12) device 571
            Action(type: .pushButton, deviceId: 9, commandId: 3572), // DEST (13) device 573
            Action(type: .pushButton, deviceId: 9, commandId: 3576), // BAD (14) device 577
            Action(type: .pushButton, deviceId: 9, commandId: 3578), // REC (15) device 579
            Action(type: .pushButton, deviceId: 9, commandId: 3580), // VAL (16) device 581
            Action(type: .pushButton, deviceId: 9, commandId: 3582), // MRC (17) device 583
            Action(type: .pushButton, deviceId: 9, commandId: 3574, argument: -1), // PCN Selector CCW (18)  device 574
            Action(type: .pushButton, deviceId: 9, commandId: 3574, argument: 1), // PCN Selector CW (19)
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
        
        var rotatorImage: UIImage? = nil
        if let rotator = content["rotator"] {
            if let rotatorAsNumber = Double(rotator) {
                let roundedRotator = (rotatorAsNumber * 10.0).rounded()
                // TODO: find a better way to handle rotator with no CW or CCW command
                if (roundedRotator >= 1) {
                    actions[18] = Action(type: .pushButton, deviceId: 9, commandId: 3574, argument: roundedRotator / 10.0 - 0.1)
                }
                if (roundedRotator <= 9) {
                    actions[19] = Action(type: .pushButton, deviceId: 9, commandId: 3574, argument: roundedRotator / 10.0 + 0.1)
                }
                if let rotatorImageName = M2000ViewController.rotatorToImageView[roundedRotator] {
                    rotatorImage = UIImage(named: rotatorImageName)
                }
            }
        }
        
        DispatchQueue.main.async {
            self.rotatorImageView.image = rotatorImage
            var i = 0
            for light in lights {
                buttons[i].isSelected = (light == "1")
                i += 1
            }
        }
    }
}
