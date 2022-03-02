//
//  AJS37CMSViewController.swift
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

class AJS37CMSViewController: PanelViewController {
    @IBOutlet var jammerModeImageView: UIImageView!
    @IBOutlet var jammerBandImageView: UIImageView!
    @IBOutlet var cmsModeImageView: UIImageView!
    @IBOutlet var streakImageView: UIImageView!
    @IBOutlet var rwrImageView: UIImageView!
    @IBOutlet var chflImageView: UIImageView!
    
    static let cmsModeImagesNames = [
        //0.0: nil, // default image
        1.0: "AJS37/AJS37-CMS-rotator1_0",
        2.0: "AJS37/AJS37-CMS-rotator1_1",
        3.0: "AJS37/AJS37-CMS-rotator1_2",
        4.0: "AJS37/AJS37-CMS-rotator1_3",
    ]
    
    static let chflImagesNames = [
        //0.0: nil, // default image
        1.0: "AJS37/AJS37-CMS-rotator2_RF",
        2.0: "AJS37/AJS37-CMS-rotator2_F",
    ]
    
    static let rwrModeImagesNames = [
        //0.0: nil, // default image
        1.0: "AJS37/AJS37-CMS-rotator3_1",
        2.0: "AJS37/AJS37-CMS-rotator3_2",
    ]
    
    static let jammerModeImagesNames = [
        //0.0: nil, // default image
        1.0: "AJS37/AJS37-CMS-rotator5_1",
        2.0: "AJS37/AJS37-CMS-rotator5_2",
        3.0: "AJS37/AJS37-CMS-rotator5_3",
        4.0: "AJS37/AJS37-CMS-rotator5_4",
    ]
    
    static let jammerBandImagesNames = [
        //0.0: nil, // default image
        1.0: "AJS37/AJS37-CMS-rotator6_1",
        2.0: "AJS37/AJS37-CMS-rotator6_2",
        3.0: "AJS37/AJS37-CMS-rotator6_3",
        4.0: "AJS37/AJS37-CMS-rotator6_4",
    ]
    
    override func initActions() {
        actions = [
            Action(type: .rotatorCCW, deviceId: 28, commandId: 3024, argument: 0.0, increment: 0.1, minimum: 0.0, maximum: 0.4), // Jammer Mode - switch (0)
            Action(type: .rotatorCW, deviceId: 28, commandId: 3024, argument: 0.0, increment: 0.1, minimum: 0.0, maximum: 0.4), // Jammer Mode + switch (1)
            Action(type: .rotatorCCW, deviceId: 28, commandId: 3025, argument: 0.0, increment: 0.1, minimum: 0.0, maximum: 0.4), // Jammer Band - switch (2)
            Action(type: .rotatorCW, deviceId: 28, commandId: 3025, argument: 0.0, increment: 0.1, minimum: 0.0, maximum: 0.4), // Jammer Band + switch (3)
            Action(type: .rotatorCCW, deviceId: 28, commandId: 3026, argument: 0.0, increment: 0.1, minimum: 0.0, maximum: 0.4), // CMS Mode - switch (4)
            Action(type: .rotatorCW, deviceId: 28, commandId: 3026, argument: 0.0, increment: 0.1, minimum: 0.0, maximum: 0.4), // CMS Mode + switch (5)
            Action(type: .rotatorCCW, deviceId: 24, commandId: 3004, argument: 0.0, increment: 0.1, minimum: 0.0, maximum: 0.2), // RWR Mode - switch (6)
            Action(type: .rotatorCW, deviceId: 24, commandId: 3004, argument: 0.0, increment: 0.1, minimum: 0.0, maximum: 0.2), // RWR Mode + switch (7)
            Action(type: .rotatorCCW, deviceId: 28, commandId: 3028, argument: 0.0, increment: 0.1, minimum: 0.0, maximum: 0.2), // CH-FL - switch (8)
            Action(type: .rotatorCW, deviceId: 28, commandId: 3028, argument: 0.0, increment: 0.1, minimum: 0.0, maximum: 0.2), // CH-FL + switch (9)
            Action(type: .pushButton, deviceId: 28, commandId: 3027, argument: 0.0), // CMS Streak - switch (10)
            Action(type: .pushButton, deviceId: 28, commandId: 3027, argument: 0.1), // CMS Streak + switch (11)
        ]
    }
    
    override func updateDisplays(with content: [String: String]) {
        let cmsSwitchStates = (content["cmsswitches"] ?? "").split(separator: " ")
        let jammerMode = (Double(cmsSwitchStates[0])! * 10.0).rounded()
        let jammerBand = (Double(cmsSwitchStates[1])! * 10.0).rounded()
        let cmsMode = (Double(cmsSwitchStates[2])! * 10.0).rounded()
        let rwrMode = (Double(cmsSwitchStates[3])! * 10.0).rounded()
        let chfl = (Double(cmsSwitchStates[4])! * 10.0).rounded()
        let streak = (Double(cmsSwitchStates[5])! * 10.0).rounded()
                
        actions[0].argument = jammerMode / 10.0
        actions[1].argument = jammerMode / 10.0
        actions[2].argument = jammerBand / 10.0
        actions[3].argument = jammerBand / 10.0
        actions[4].argument = cmsMode / 10.0
        actions[5].argument = cmsMode / 10.0
        actions[6].argument = rwrMode / 10.0
        actions[7].argument = rwrMode / 10.0
        actions[8].argument = chfl / 10.0
        actions[9].argument = chfl / 10.0
        
        DispatchQueue.main.async {
            if let jammerImageName = AJS37CMSViewController.jammerModeImagesNames[jammerMode] {
                self.jammerModeImageView.image = UIImage(named: jammerImageName)
            } else {
                self.jammerModeImageView.image = nil
            }
            if let jammerBandImageName = AJS37CMSViewController.jammerBandImagesNames[jammerBand] {
                self.jammerBandImageView.image = UIImage(named: jammerBandImageName)
            } else {
                self.jammerBandImageView.image = nil
            }
            if let cmsModeImageName = AJS37CMSViewController.cmsModeImagesNames[cmsMode] {
                self.cmsModeImageView.image = UIImage(named: cmsModeImageName)
            } else {
                self.cmsModeImageView.image = nil
            }
            if let rwrModeImageName = AJS37CMSViewController.rwrModeImagesNames[rwrMode] {
                self.rwrImageView.image = UIImage(named: rwrModeImageName)
            } else {
                self.rwrImageView.image = nil
            }
            if let chflImageName = AJS37CMSViewController.chflImagesNames[chfl] {
                self.chflImageView.image = UIImage(named: chflImageName)
            } else {
                self.chflImageView.image = nil
            }
            if streak > 0 {
                self.streakImageView.image = UIImage(named: "AJS37/AJS37-CMS-rotator4")
            } else {
                self.streakImageView.image = nil
            }
        }
    }
}
