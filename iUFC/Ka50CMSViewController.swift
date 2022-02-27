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

class Ka50CMSViewController: PlaneViewController {
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
}
