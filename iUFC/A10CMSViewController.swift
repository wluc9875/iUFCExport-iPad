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
    }
}
