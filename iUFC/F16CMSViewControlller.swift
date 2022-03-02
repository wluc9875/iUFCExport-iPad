//
//  F16CMSViewController.swift
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

class F16CMSViewControlller: PanelViewController {
    @IBOutlet var prgmRotatorImageView: UIImageView!
    @IBOutlet var modeRotatorImageView: UIImageView!
    @IBOutlet var rwrButton: UIButton!
    @IBOutlet var jmrButton: UIButton!
    @IBOutlet var mwsButton: UIButton!
    @IBOutlet var jettButton: UIButton!
    @IBOutlet var c01Button: UIButton!
    @IBOutlet var c02Button: UIButton!
    @IBOutlet var chButton: UIButton!
    @IBOutlet var flButton: UIButton!
    @IBOutlet var c01Label: UILabel!
    @IBOutlet var c02Label: UILabel!
    @IBOutlet var chLabel: UILabel!
    @IBOutlet var flLabel: UILabel!
    
    static let prgmRotatorImageNames = [
        //0.0: nil, // default image
        1.0: "f16/F16-CMS-prgm1",
        2.0: "f16/F16-CMS-prgm2",
        3.0: "f16/F16-CMS-prgm3",
        4.0: "f16/F16-CMS-prgm4",
    ]
    
    static let modeRotatorImageNames = [
        //0.0: nil, // default image
        1.0: "f16/F16-CMS-mode1",
        2.0: "f16/F16-CMS-mode2",
        3.0: "f16/F16-CMS-mode3",
        4.0: "f16/F16-CMS-mode4",
        5.0: "f16/F16-CMS-mode5"
    ]
    
    override func initActions() {
        actions = [
            Action(type: .toggleButton, deviceId: 32, commandId: 3001), // RWR switch (0)
            Action(type: .toggleButton, deviceId: 32, commandId: 3002), // JMR switch (1)
            Action(type: .toggleButton, deviceId: 32, commandId: 3003), // MWS switch (2)
            Action(type: .toggleButton, deviceId: 32, commandId: 3004), // JETT switch (3)
            Action(type: .toggleButton, deviceId: 32, commandId: 3005), // 01 switch (4)
            Action(type: .toggleButton, deviceId: 32, commandId: 3006), // 02 switch (5)
            Action(type: .toggleButton, deviceId: 32, commandId: 3007), // CH switch (6)
            Action(type: .toggleButton, deviceId: 32, commandId: 3008), // FL switch (7)
            Action(type: .pushButton, deviceId: 32, commandId: 3020, argument: -0.1), // PRGM- switch (8)
            Action(type: .pushButton, deviceId: 32, commandId: 3020, argument: 0.1), // PRGM+ switch (9)
            Action(type: .pushButton, deviceId: 32, commandId: 3021, argument: -0.1), // MODE- switch (10)
            Action(type: .pushButton, deviceId: 32, commandId: 3021, argument: 0.1), // MODE+ switch (11)
        ]
    }
    
    override func updateDisplays(with content: [String: String]) {
        let cmsSwitchStates = (content["cmsswitches"] ?? "").split(separator: " ")
        let rwrOn = (cmsSwitchStates[0] == "1")
        actions[0].argument = rwrOn ? 1.0 : 0.0
        let jmrOn = (cmsSwitchStates[1] == "1")
        actions[1].argument = jmrOn ? 1.0 : 0.0
        let mwsOn = (cmsSwitchStates[2] == "1")
        actions[2].argument = mwsOn ? 1.0 : 0.0
        let jettOn = (cmsSwitchStates[3] == "1")
        actions[3].argument = jettOn ? 1.0 : 0.0
        let c01On = (cmsSwitchStates[4] == "1")
        actions[4].argument = c01On ? 1.0 : 0.0
        let c02On = (cmsSwitchStates[5] == "1")
        actions[5].argument = c02On ? 1.0 : 0.0
        let chOn = (cmsSwitchStates[6] == "1")
        actions[6].argument = chOn ? 1.0 : 0.0
        let flOn = (cmsSwitchStates[7] == "1")
        actions[7].argument = flOn ? 1.0 : 0.0
        let prgm = (Double(cmsSwitchStates[8])! * 10.0).rounded()
        let mode = (Double(cmsSwitchStates[9])! * 10.0).rounded()
        
        let c01Text = content["CMDS_O1_Amount"] ?? ""
        let c02Text = content["CMDS_O2_Amount"] ?? ""
        let chText = content["CMDS_CH_Amount"] ?? ""
        let flText = content["CMDS_FL_Amount"] ?? ""
        DispatchQueue.main.async {
            self.rwrButton.isSelected = rwrOn
            self.jmrButton.isSelected = jmrOn
            self.mwsButton.isSelected = mwsOn
            self.jettButton.isSelected = jettOn
            self.c01Button.isSelected = c01On
            self.c02Button.isSelected = c02On
            self.chButton.isSelected = chOn
            self.flButton.isSelected = flOn
            if let prgmRotatorImageName = F16CMSViewControlller.prgmRotatorImageNames[prgm] {
                self.prgmRotatorImageView.image = UIImage(named: prgmRotatorImageName)
            } else {
                self.prgmRotatorImageView.image = nil
            }
            if let modeRotatorImageName = F16CMSViewControlller.modeRotatorImageNames[mode] {
                self.modeRotatorImageView.image = UIImage(named: modeRotatorImageName)
            } else {
                self.modeRotatorImageView.image = nil
            }
            
            self.c01Label.text = c01Text
            self.c02Label.text = c02Text
            self.chLabel.text = chText
            self.flLabel.text = flText
        }
    }
}
