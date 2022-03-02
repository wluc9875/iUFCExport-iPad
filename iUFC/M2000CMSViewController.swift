//
//  M2000CMSViewController.swift
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

class M2000CMSViewController: PanelViewController {
    @IBOutlet var ecmModeImageView: UIImageView!
    @IBOutlet var brImageView: UIImageView!
    @IBOutlet var daImageView: UIImageView!
    @IBOutlet var d2mImageView: UIImageView!
    @IBOutlet var llImageView: UIImageView!
    @IBOutlet var llModeImageView: UIImageView!
    
    static let ecmImagesNames = [
        //0.0: nil, // default image
        1.0: "M200C/M2000-CMS-mode1",
        2.0: "M200C/M2000-CMS-mode2",
    ]
    
    static let brImagesNames = [
        //0.0: nil, // default image
        1.0: "M200C/M2000-CMS-br1",
        2.0: "M200C/M2000-CMS-br2",
    ]
    
    static let daImagesNames = [
        //0.0: nil, // default image
        1.0: "M200C/M2000-CMS-da1",
        2.0: "M200C/M2000-CMS-da2",
    ]
    
    static let d2mImagesNames = [
        //0.0: nil, // default image
        1.0: "M200C/M2000-CMS-d2m1",
        2.0: "M200C/M2000-CMS-d2m2",
    ]
    
    static let llImagesNames = [
        //0.0: nil, // default image
        1.0: "M200C/M2000-CMS-ll1",
        2.0: "M200C/M2000-CMS-ll2",
    ]
    
    static let llModeImagesNames = [
        //0.0: nil, // default image
        1.0: "M200C/M2000-CMS-prog1",
        2.0: "M200C/M2000-CMS-prog2",
        3.0: "M200C/M2000-CMS-prog3",
        4.0: "M200C/M2000-CMS-prog4",
        5.0: "M200C/M2000-CMS-prog5",
        6.0: "M200C/M2000-CMS-prog6",
        7.0: "M200C/M2000-CMS-prog7",
        8.0: "M200C/M2000-CMS-prog8",
        9.0: "M200C/M2000-CMS-prog9",
        10.0: "M200C/M2000-CMS-prog10",
    ]
    
    override func initActions() {
        actions = [
            Action(type: .rotatorCCW, deviceId: 13, commandId: 3605, argument: 0.0, increment: 1.0, minimum: -1.0, maximum: 1.0), // ECM MODE- (0)
            Action(type: .rotatorCW, deviceId: 13, commandId: 3605, argument: 0.0, increment: 1.0, minimum: -1.0, maximum: 1.0), // ECM MODE+ (1)
            Action(type: .rotatorCCW, deviceId: 13, commandId: 3606, argument: 0.0, increment: 0.5, minimum: 0.0, maximum: 1.0), // BR- (2)
            Action(type: .rotatorCW, deviceId: 13, commandId: 3606, argument: 0.0, increment: 0.5, minimum: 0.0, maximum: 1.0), // BR+ (3)
            Action(type: .rotatorCCW, deviceId: 13, commandId: 3607, argument: 0.0, increment: 0.5, minimum: 0.0, maximum: 1.0), // DA- (4)
            Action(type: .rotatorCW, deviceId: 13, commandId: 3607, argument: 0.0, increment: 0.5, minimum: 0.0, maximum: 1.0), // DA+ (5)
            Action(type: .rotatorCCW, deviceId: 28, commandId: 3608, argument: 0.0, increment: 0.5, minimum: 0.0, maximum: 1.0), // D2M- (6)
            Action(type: .rotatorCW, deviceId: 28, commandId: 3608, argument: 0.0, increment: 0.5, minimum: 0.0, maximum: 1.0), // D2M+ (7)
            Action(type: .rotatorCCW, deviceId: 13, commandId: 3609, argument: 0.0, increment: 0.5, minimum: 0.0, maximum: 1.0), // LL- (8)
            Action(type: .rotatorCW, deviceId: 13, commandId: 3609, argument: 0.0, increment: 0.5, minimum: 0.0, maximum: 1.0), // LL+ (9)
            Action(type: .rotatorCCW, deviceId: 13, commandId: 3610, argument: 0.0, increment: 0.1, minimum: 0.0, maximum: 1.0), // LLMODE- (10)
            Action(type: .rotatorCW, deviceId: 13, commandId: 3610, argument: 0.0, increment: 0.1, minimum: 0.0, maximum: 1.0), // LLMODE+ (11)
        ]
    }
    
    override func updateDisplays(with content: [String: String]) {
        let cmsSwitchStates = (content["cmsswitches"] ?? "").split(separator: " ")
        let ecmPosition = (Double(cmsSwitchStates[0])! * 10.0).rounded()
        let brPosition = (Double(cmsSwitchStates[1])! * 10.0).rounded()
        let daPosition = (Double(cmsSwitchStates[2])! * 10.0).rounded()
        let d2mPosition = (Double(cmsSwitchStates[3])! * 10.0).rounded()
        let llPosition = (Double(cmsSwitchStates[4])! * 10.0).rounded()
        let llModePosition = (Double(cmsSwitchStates[5])! * 10.0).rounded()
        
        actions[0].argument = ecmPosition / 10.0
        actions[1].argument = ecmPosition / 10.0
        actions[2].argument = brPosition / 10.0
        actions[3].argument = brPosition / 10.0
        actions[4].argument = daPosition / 10.0
        actions[5].argument = daPosition / 10.0
        actions[6].argument = d2mPosition / 10.0
        actions[7].argument = d2mPosition / 10.0
        actions[8].argument = llPosition / 10.0
        actions[9].argument = llPosition / 10.0
        actions[10].argument = llModePosition / 10.0
        actions[11].argument = llModePosition / 10.0
        
        DispatchQueue.main.async {
            if let ecmImageName = A10CMSViewController.modeImagesNames[ecmPosition] {
                self.ecmModeImageView.image = UIImage(named: ecmImageName)
            } else {
                self.ecmModeImageView.image = nil
            }
            if let brImageName = A10CMSViewController.modeImagesNames[brPosition] {
                self.brImageView.image = UIImage(named: brImageName)
            } else {
                self.brImageView.image = nil
            }
            if let daImageName = A10CMSViewController.modeImagesNames[daPosition] {
                self.daImageView.image = UIImage(named: daImageName)
            } else {
                self.daImageView.image = nil
            }
            if let d2mImageName = A10CMSViewController.modeImagesNames[d2mPosition] {
                self.d2mImageView.image = UIImage(named: d2mImageName)
            } else {
                self.d2mImageView.image = nil
            }
            if let llImageName = A10CMSViewController.modeImagesNames[llPosition] {
                self.llImageView.image = UIImage(named: llImageName)
            } else {
                self.llImageView.image = nil
            }
            if let llModeImageName = A10CMSViewController.modeImagesNames[llModePosition] {
                self.llModeImageView.image = UIImage(named: llModeImageName)
            } else {
                self.llModeImageView.image = nil
            }
        }
    }
}
