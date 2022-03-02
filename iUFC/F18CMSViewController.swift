//
//  F18CMSViewController.swift
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

class F18CMSViewController: PanelViewController {
    @IBOutlet var dispImageView: UIImageView!
    @IBOutlet var ecmImageView: UIImageView!
    
    static let dispImagesNames = [
        //0.0: nil, // default image
        1.0: "F18/F18-CMS-dispenser1",
        2.0: "F18/F18-CMS-dispenser2",
    ]
    
    static let ecmImagesNames = [
        //0.0: nil, // default image
        1.0: "F18/F18-CMS-ecm1",
        2.0: "F18/F18-CMS-ecm2",
        3.0: "F18/F18-CMS-ecm3",
        4.0: "F18/F18-CMS-ecm4",
    ]
    
    override func initActions() {
        actions = [
            Action(type: .pushButton, deviceId: 54, commandId: 3003, argument: 1.0), // JETT switch (0)
            Action(type: .rotatorCCW, deviceId: 54, commandId: 3001, argument: 0.0, increment: 0.1, minimum: 0.0, maximum: 0.2), // DISP- switch (1)
            Action(type: .rotatorCW, deviceId: 54, commandId: 3001, argument: 0.0, increment: 0.1, minimum: 0.0, maximum: 0.2), // DISP+ switch (2)
            Action(type: .pushButton, deviceId: 66, commandId: 3002, argument: -1.0), // ECM- switch (3)
            Action(type: .pushButton, deviceId: 66, commandId: 3002, argument: 1.0), // ECM+ switch (4)
        ]
    }
    
    override func updateDisplays(with content: [String: String]) {
        let cmsSwitchStates = (content["cmsswitches"] ?? "").split(separator: " ")
        let dispPosition = (Double(cmsSwitchStates[0])! * 10.0).rounded()
        let ecmPosition = (Double(cmsSwitchStates[1])! * 10.0).rounded()
        
        actions[1].argument = dispPosition / 10.0
        actions[2].argument = dispPosition / 10.0
        
        DispatchQueue.main.async {
            if let dispImageName = F18CMSViewController.dispImagesNames[dispPosition] {
                self.dispImageView.image = UIImage(named: dispImageName)
            } else {
                self.dispImageView.image = nil
            }
            if let ecmImageName = F18CMSViewController.ecmImagesNames[ecmPosition] {
                self.ecmImageView.image = UIImage(named: ecmImageName)
            } else {
                self.ecmImageView.image = nil
            }
        }
    }
}
