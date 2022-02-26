//
//  Ka50ViewController.swift
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

class Ka50ViewController: PlaneViewController {
    @IBOutlet var line1Label: UILabel!
    @IBOutlet var line2Label: UILabel!
    @IBOutlet var point1Label: UILabel!
    @IBOutlet var point2Label: UILabel!
    @IBOutlet var rotatorImageView: UIImageView!
    @IBOutlet var modeImageView: UIImageView!
    @IBOutlet var dataLinkImageView: UIImageView!
    @IBOutlet var waypointButton: UIButton!
    @IBOutlet var inuResetButton: UIButton!
    @IBOutlet var fixButton: UIButton!
    @IBOutlet var preciseINUButton: UIButton!
    @IBOutlet var airfieldButton: UIButton!
    @IBOutlet var normalINUButton: UIButton!
    @IBOutlet var targetButton: UIButton!
    @IBOutlet var enterButton: UIButton!
    @IBOutlet var clearButton: UIButton!
    @IBOutlet var initialPointButton: UIButton!
    @IBOutlet var selfCoordButton: UIButton!
    @IBOutlet var dataDHButton: UIButton!
    @IBOutlet var windButton: UIButton!
    @IBOutlet var theadButton: UIButton!
    @IBOutlet var bearingButton: UIButton!
    
    static let rotatorToImageView = [
        //0.0: nil, // default image
        0.1: "ka50/KA50-PVI-rotary-1",
        0.2: "ka50/KA50-PVI-rotary-2",
        0.3: "ka50/KA50-PVI-rotary-3",
        0.4: "ka50/KA50-PVI-rotary-4",
        0.5: "ka50/KA50-PVI-rotary-5",
        0.6: "ka50/KA50-PVI-rotary-6",
    ]
    
    override func initActions() {
        actions = [
            Action(type: .pushButton, deviceId: 20, commandId: 3001), // NUM0 (0)
            Action(type: .pushButton, deviceId: 20, commandId: 3002), // NUM0 (1)
            Action(type: .pushButton, deviceId: 20, commandId: 3003), // NUM0 (2)
            Action(type: .pushButton, deviceId: 20, commandId: 3004), // NUM0 (3)
            Action(type: .pushButton, deviceId: 20, commandId: 3005), // NUM0 (4)
            Action(type: .pushButton, deviceId: 20, commandId: 3006), // NUM0 (5)
            Action(type: .pushButton, deviceId: 20, commandId: 3007), // NUM0 (6)
            Action(type: .pushButton, deviceId: 20, commandId: 3008), // NUM0 (7)
            Action(type: .pushButton, deviceId: 20, commandId: 3009), // NUM0 (8)
            Action(type: .pushButton, deviceId: 20, commandId: 3010), // NUM0 (9)
            Action(type: .pushButton, deviceId: 20, commandId: 3018), // ENTER (10)
            Action(type: .pushButton, deviceId: 20, commandId: 3019), // CLEAR (11)
            Action(type: .pushButton, deviceId: 20, commandId: 3011), // WPT (12)
            Action(type: .pushButton, deviceId: 20, commandId: 3013), // FIX PNT (13)
            Action(type: .pushButton, deviceId: 20, commandId: 3015), // AIRFIELD (14)
            Action(type: .pushButton, deviceId: 20, commandId: 3017), // NAV TGT (15)
            Action(type: .pushButton, deviceId: 20, commandId: 3012), // INU RESET (16)
            Action(type: .pushButton, deviceId: 20, commandId: 3014), // INU PREC (17)
            Action(type: .pushButton, deviceId: 20, commandId: 3016), // INU NORM (18)
            Action(type: .pushButton, deviceId: 20, commandId: 3020), // INIT PNT (19)
            Action(type: .pushButton, deviceId: 20, commandId: 3021), // SELF COOR (20)
            Action(type: .pushButton, deviceId: 20, commandId: 3022), // DTA DH (21)
            Action(type: .pushButton, deviceId: 20, commandId: 3023), // WIND DI/SP (22)
            Action(type: .pushButton, deviceId: 20, commandId: 3024), // THEAD TIME/DIS (23)
            Action(type: .pushButton, deviceId: 20, commandId: 3025), // BRG/RA TGT PNT (24)
            Action(type: .rotatorCCW, deviceId: 20, commandId: 3026, argument: 0.0, increment: 0.1, minimum: 0.0, maximum: 0.6), // MASTER MODE CCW (25)
            Action(type: .rotatorCW, deviceId: 20, commandId: 3027, argument: 0.0, increment: 0.1, minimum: 0.0, maximum: 0.6), // MASTER MODE CW (26)
            Action(type: .pushButton, deviceId: 20, commandId: 3028), // FIXMETHOD UP (27)
            Action(type: .pushButton, deviceId: 20, commandId: 3028, argument: 0.0), // FIXMETHOD DOWN (28)
            Action(type: .pushButton, deviceId: 25, commandId: 3016), // DATALINK POWER ON (29)
            Action(type: .pushButton, deviceId: 25, commandId: 3016, argument: 0.0), // DATALINK POWER OFF (30)
        ]
    }
    
    override func updateDisplays(with content: [String: String]) {
        let buttons: [UIButton] = [
            waypointButton,
            inuResetButton,
            fixButton,
            preciseINUButton,
            airfieldButton,
            normalINUButton,
            targetButton,
            enterButton,
            clearButton,
            initialPointButton,
            selfCoordButton,
            dataDHButton,
            windButton,
            theadButton,
            bearingButton
        ]
        
        let lights = (content["lights"] ?? "").split(separator: " ")
        
        var line1 = (content["txt_VIT_sign"] ?? "")
        var i = 0
        for char in (content["txt_VIT"] ?? "") {
            line1.append(char)
            if (i == 2) {
                line1.append(content["txt_VIT_apostrophe1"] ?? "")
            }
            if (i == 4) {
                line1.append(content["txt_VIT_apostrophe2"] ?? "")
            }
            i += 1
        }
        var line2 = (content["txt_NIT_sign"] ?? "")
        i = 0
        for char in (content["txt_NIT"] ?? "") {
            line2.append(char)
            if (i == 2) {
                line2.append(content["txt_NIT_apostrophe1"] ?? "")
            }
            if (i == 4) {
                line2.append(content["txt_NIT_apostrophe2"] ?? "")
            }
            i += 1
        }
        let point1 = (content["txt_OIT_PPM"] ?? "")
        let point2 = (content["txt_OIT_NOT"] ?? "")
        
        var rotatorImage: UIImage? = nil
        if let rotator = content["rotator"] {
            if let rotatorAsNumber = Double(rotator) {
                let roundedRotator = (rotatorAsNumber * 10.0).rounded() / 10.0
                actions[25].argument = roundedRotator
                actions[26].argument = roundedRotator
                if let rotatorImageName = Ka50ViewController.rotatorToImageView[roundedRotator] {
                    rotatorImage = UIImage(named: rotatorImageName)
                }
            }
        }
        
        DispatchQueue.main.async {
            self.line1Label.text = line1
            self.line2Label.text = line2
            self.point1Label.text = point1
            self.point2Label.text = point2
            self.rotatorImageView.image = rotatorImage
            self.modeImageView.isHighlighted = (content["fixmethod"] == "1")
            self.dataLinkImageView.isHighlighted = (content["datalink"] == "1")
            var i = 0
            for light in lights {
                buttons[i].isSelected = (light != "0")
                i += 1
            }
        }
    }
}
