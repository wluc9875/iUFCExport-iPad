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

class F18CMSViewController: PlaneViewController {
    override func initActions() {
        actions = [
            Action(type: .pushButton, deviceId: 54, commandId: 3003, argument: 1.0), // JETT switch (0)
            Action(type: .rotatorCCW, deviceId: 54, commandId: 3001, argument: 0.0, increment: 0.1, minimum: 0.0, maximum: 0.2), // DISP- switch (1)
            Action(type: .rotatorCW, deviceId: 54, commandId: 3001, argument: 0.0, increment: 0.1, minimum: 0.0, maximum: 0.2), // DISP+ switch (2)
            Action(type: .pushButton, deviceId: 66, commandId: 3002, argument: -1.0), // ECM- switch (3)
            Action(type: .pushButton, deviceId: 66, commandId: 3002, argument: 1.0), // ECM+ switch (4)
        ]
    }
}
