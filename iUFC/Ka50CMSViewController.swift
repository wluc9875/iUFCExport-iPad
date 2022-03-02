//
//  Ka50CMSViewController.swift
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

class Ka50CMSViewController: PanelViewController {
    @IBOutlet var sideImageView: UIImageView!
    @IBOutlet var modeButton: UIButton!
    @IBOutlet var digitsLabel: UILabel!
    @IBOutlet var leftSideLabel: UILabel!
    @IBOutlet var rightSideLabel: UILabel!
    
    static let sideImagesNames = [
        //0.0: nil, // default image
        1.0: "ka50/KA50-CMS-sideB",
        2.0: "ka50/KA50-CMS-sideR",
    ]
    
    override func initActions() {
        actions = [
            Action(type: .rotatorCCW, deviceId: 22, commandId: 3001, argument: 0.0, increment: 0.1, minimum: 0.0, maximum: 0.2), // DISP SIDE- (0)
            Action(type: .rotatorCW, deviceId: 22, commandId: 3001, argument: 0.0, increment: 0.1, minimum: 0.0, maximum: 0.2), // DISP SIDE+ (1)
            Action(type: .toggleButton, deviceId: 22, commandId: 3003, argument: 1.0), // MODE switch (2)
            Action(type: .pushButton, deviceId: 22, commandId: 3004, argument: 1.0), // BURST switch (3)
            Action(type: .pushButton, deviceId: 22, commandId: 3006, argument: 1.0), // INTERVAL switch (4)
            Action(type: .pushButton, deviceId: 22, commandId: 3005, argument: 1.0), // SERIES switch (5)
            Action(type: .pushButton, deviceId: 22, commandId: 3008, argument: 1.0), // RESET switch (6)
            Action(type: .pushButton, deviceId: 22, commandId: 3009, argument: 1.0), // STOP switch (7)
            Action(type: .pushButton, deviceId: 22, commandId: 3007, argument: 1.0), // START switch (8)
        ]
    }
    
    override func updateDisplays(with content: [String: String]) {
        let cmsSwitchStates = (content["cmsswitches"] ?? "").split(separator: " ")
        let dispSide = (Double(cmsSwitchStates[0])! * 10.0).rounded()
        let lightL = (Double(cmsSwitchStates[1])! * 10.0).rounded()
        let lightR = (Double(cmsSwitchStates[2])! * 10.0).rounded()
        let modePosition = (Double(cmsSwitchStates[3])! * 10.0).rounded()
        
        let digits = content["txt_digits"] ?? ""
        
        actions[0].argument = dispSide / 10.0
        actions[1].argument = dispSide / 10.0
        actions[2].argument = modePosition / 10.0
        
        DispatchQueue.main.async {
            if let sideImageName = Ka50CMSViewController.sideImagesNames[dispSide] {
                self.sideImageView.image = UIImage(named: sideImageName)
            } else {
                self.sideImageView.image = nil
            }
            self.modeButton.isSelected = modePosition > 0

            self.digitsLabel.text = digits
            self.leftSideLabel.isHidden = !(lightL > 0)
            self.rightSideLabel.isHidden = !(lightR > 0)
        }
    }
}
