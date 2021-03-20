//
//  A10ViewController.swift
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

class A10ViewController: PlaneViewController {
    override func initActions() {
        actions = [
            Action(type: .pushButton, deviceId: 8, commandId: 3010), // NUM0 (0)
            Action(type: .pushButton, deviceId: 8, commandId: 3001), // NUM1 (1)
            Action(type: .pushButton, deviceId: 8, commandId: 3002), // NUM2 (2)
            Action(type: .pushButton, deviceId: 8, commandId: 3003), // NUM3 (3)
            Action(type: .pushButton, deviceId: 8, commandId: 3004), // NUM4 (4)
            Action(type: .pushButton, deviceId: 8, commandId: 3005), // NUM5 (5)
            Action(type: .pushButton, deviceId: 8, commandId: 3006), // NUM6 (6)
            Action(type: .pushButton, deviceId: 8, commandId: 3007), // NUM7 (7)
            Action(type: .pushButton, deviceId: 8, commandId: 3008), // NUM8 (8)
            Action(type: .pushButton, deviceId: 8, commandId: 3009), // NUM9 (9)
            Action(type: .pushButton, deviceId: 8, commandId: 3012), // HACK (10)
            Action(type: .pushButton, deviceId: 8, commandId: 3011), // SPC (11)
            Action(type: .pushButton, deviceId: 8, commandId: 3013), // FUNC (12)
            Action(type: .pushButton, deviceId: 8, commandId: 3014), // LTR (13)
            Action(type: .pushButton, deviceId: 8, commandId: 3015), // CLR (14)
            Action(type: .pushButton, deviceId: 8, commandId: 3017), // MK (15)
            Action(type: .pushButton, deviceId: 8, commandId: 3018), // ALTALRT (16)
            Action(type: .pushButton, deviceId: 8, commandId: 3030), // COM1 (17)
            Action(type: .pushButton, deviceId: 8, commandId: 3031), // COMSEC (18)
            Action(type: .pushButton, deviceId: 8, commandId: 3032), // IFF (19)
            Action(type: .pushButton, deviceId: 8, commandId: 3033), // COM2 (20)
            Action(type: .pushButton, deviceId: 8, commandId: 3034), // ECCM (21)
            Action(type: .pushButton, deviceId: 8, commandId: 3035), // IDMRT (22)
            Action(type: .pushButton, deviceId: 8, commandId: 3016), // ENT (23)
            
            Action(type: .momentary3Way, deviceId: 8, commandId: 3020), // STEER Up (24)
            Action(type: .momentary3Way, deviceId: 8, commandId: 3021, argument: -1.0), // STEER Down (25)
            Action(type: .momentary3Way, deviceId: 8, commandId: 3022), // DATA Up (26)
            Action(type: .momentary3Way, deviceId: 8, commandId: 3023, argument: -1.0), // DATA Down (27)
            Action(type: .momentary3Way, deviceId: 8, commandId: 3024), // SEL Up (28)
            Action(type: .momentary3Way, deviceId: 8, commandId: 3025, argument: -1.0), // SEL Down (29)
            Action(type: .momentary3Way, deviceId: 8, commandId: 3026), // DEPR Up (30)
            Action(type: .momentary3Way, deviceId: 8, commandId: 3027, argument: -1.0), // DEPR Down (31)
            Action(type: .momentary3Way, deviceId: 8, commandId: 3029), // INTEN Down (32)
            Action(type: .momentary3Way, deviceId: 8, commandId: 3028, argument: -1.0), // INTEN Up (33)
        ]
    }
}
