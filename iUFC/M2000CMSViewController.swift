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
}
