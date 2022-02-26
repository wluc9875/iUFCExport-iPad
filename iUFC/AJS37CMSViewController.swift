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

class AJS37CMSViewController: PlaneViewController {
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
}
