//
//  A10CMSViewController.swift
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

class A10CMSViewController: PanelViewController {
    @IBOutlet var mwsImageView: UIImageView!
    @IBOutlet var jmrImageView: UIImageView!
    @IBOutlet var rwrImageView: UIImageView!
    @IBOutlet var dispImageView: UIImageView!
    @IBOutlet var modeImageView: UIImageView!
    @IBOutlet var valueImageView: UIImageView!
    @IBOutlet var jtsnButton: UIButton!
    @IBOutlet var txtUpLabel: UILabel!
    @IBOutlet var txtDown1Label: UILabel!
    @IBOutlet var txtDown2Label: UILabel!
    @IBOutlet var txtDown3Label: UILabel!
    @IBOutlet var txtDown4Label: UILabel!
    
    static let modeImagesNames = [
        //0.0: nil, // default image
        1.0: "a10/A10-CMS-mode1",
        2.0: "a10/A10-CMS-mode2",
        3.0: "a10/A10-CMS-mode3",
        4.0: "a10/A10-CMS-mode4",
    ]
    
    override func initActions() {
        actions = [
            //TODO
            Action(type: .pushButton, deviceId: 4, commandId: 3001, argument: 1.0), // MWS (0)
            Action(type: .pushButton, deviceId: 4, commandId: 3002, argument: 1.0), // JMR (1)
            Action(type: .pushButton, deviceId: 4, commandId: 3003, argument: 1.0), // RWR (2)
            Action(type: .pushButton, deviceId: 4, commandId: 3004, argument: 1.0), // DISP (3)
            Action(type: .toggleButton, deviceId: 4, commandId: 3010, argument: 0.0, increment: 0.1), // MWS toggle (4)
            Action(type: .pushButton, deviceId: 4, commandId: 3011, argument: 0.2, increment: 0.1, minimum: 0.1), // MWS menu (5)
            Action(type: .toggleButton, deviceId: 4, commandId: 3012, argument: 0.0, increment: 0.1), // JMR toggle (6)
            Action(type: .pushButton, deviceId: 4, commandId: 3013, argument: 0.2, increment: 0.1, minimum: 0.1), // JMR menu (7)
            Action(type: .toggleButton, deviceId: 4, commandId: 3014, argument: 0.0, increment: 0.1), // RWR toggle (8)
            Action(type: .pushButton, deviceId: 4, commandId: 3015, argument: 0.2, increment: 0.1, minimum: 0.1), // RWR menu (9)
            Action(type: .toggleButton, deviceId: 4, commandId: 3016, argument: 0.0, increment: 0.1), // DISP toggle (10)
            Action(type: .pushButton, deviceId: 4, commandId: 3017, argument: 0.2, increment: 0.1, minimum: 0.1), // DISP menu (11)
            Action(type: .pushButton, deviceId: 4, commandId: 3005, argument: 1.0), // VALUE- (12)
            Action(type: .pushButton, deviceId: 4, commandId: 3006, argument: 1.0), // VALUE+ (13)
            Action(type: .pushButton, deviceId: 4, commandId: 3007, argument: 1.0), // RTN- (14)
            Action(type: .toggleButton, deviceId: 4, commandId: 3008, argument: 0.0, increment: 1.0), // JTSN (15)
            Action(type: .rotatorCCW, deviceId: 4, commandId: 3018, argument: 0.0, increment: 0.1, minimum: 0.0, maximum: 0.4), // MODE- (16)
            Action(type: .rotatorCW, deviceId: 4, commandId: 3018, argument: 0.0, increment: 0.1, minimum: 0.0, maximum: 0.4), // MODE+ (17)
        ]
        
        originalSwitchImages = [
            5: "a10/A10-CMS-mws1",
            7: "a10/A10-CMS-jammer1",
            9: "a10/A10-CMS-rwr1",
            11: "a10/A10-CMS-disp1",
            12: "",
            13: "",
        ]
        
        alternateSwitchImages = [
            5: "a10/A10-CMS-mws2",
            7: "a10/A10-CMS-jammer2",
            9: "a10/A10-CMS-rwr2",
            11: "a10/A10-CMS-disp2",
            12: "a10/A10-CMS-nxtd",
            13: "a10/A10-CMS-nxtu",
        ]
        
        actionToViewDict = [
            5: mwsImageView,
            7: jmrImageView,
            9: rwrImageView,
            11: dispImageView,
            12: valueImageView,
            13: valueImageView,
        ]
    }
    
    override func updateDisplays(with content: [String: String]) {
        let cmsSwitchStates = (content["cmsswitches"] ?? "").split(separator: " ")
        let mwsOn = (Double(cmsSwitchStates[0])! * 10.0).rounded()
        let jmrOn = (Double(cmsSwitchStates[1])! * 10.0).rounded()
        let rwrOn = (Double(cmsSwitchStates[2])! * 10.0).rounded()
        let dispOn = (Double(cmsSwitchStates[3])! * 10.0).rounded()
        let jettOn = Double(cmsSwitchStates[4])!
        let modePosition = (Double(cmsSwitchStates[5])! * 10.0).rounded()
        
        let txtUp = content["txt_UP"] ?? ""
        let txtDown1 = content["txt_DOWN1"] ?? ""
        let txtDown2 = content["txt_DOWN2"] ?? ""
        let txtDown3 = content["txt_DOWN3"] ?? ""
        let txtDown4 = content["txt_DOWN4"] ?? ""
        
        actions[4].argument = mwsOn / 10.0
        actions[6].argument = jmrOn / 10.0
        actions[8].argument = rwrOn / 10.0
        actions[10].argument = dispOn / 10.0
        actions[15].argument = jettOn
        actions[16].argument = modePosition / 10.0
        actions[17].argument = modePosition / 10.0
        
        DispatchQueue.main.async {
            self.mwsImageView.image = mwsOn > 0 ? UIImage(named: "a10/A10-CMS-mws1") : nil
            self.jmrImageView.image = jmrOn > 0 ? UIImage(named: "a10/A10-CMS-jammer1") : nil
            self.rwrImageView.image = rwrOn > 0 ? UIImage(named: "a10/A10-CMS-rwr1") : nil
            self.dispImageView.image = dispOn > 0 ? UIImage(named: "a10/A10-CMS-disp1") : nil
            self.jtsnButton.isSelected = jettOn > 0
            if let modeImageName = A10CMSViewController.modeImagesNames[modePosition] {
                self.modeImageView.image = UIImage(named: modeImageName)
            } else {
                self.modeImageView.image = nil
            }
            self.txtUpLabel.text = txtUp
            self.txtDown1Label.text = txtDown1
            self.txtDown2Label.text = txtDown2
            self.txtDown3Label.text = txtDown3
            self.txtDown4Label.text = txtDown4
        }
    }
}
