//
//  Ka50ViewController.swift
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

class Ka50ViewController: PlaneViewController {
    override func initActions() {
        actions = [
            Action(type: .pushButton, deviceId: 20, commandId: 3001), // NUM0 (0)
            Action(type: .pushButton, deviceId: 20, commandId: 3002), // NUM0 (1)
            Action(type: .pushButton, deviceId: 20, commandId: 3003), // NUM0 (2)
            Action(type: .pushButton, deviceId: 20, commandId: 3004), // NUM0 (3)
            Action(type: .pushButton, deviceId: 20, commandId: 3005), // NUM0 (4)
            Action(type: .pushButton, deviceId: 20, commandId: 3006), // NUM0 (5)
            Action(type: .pushButton, deviceId: 20, commandId: 3007), // NUM0 (6)
            Action(type: .pushButton, deviceId: 20, commandId: 3008), // NUM0 (7)
            Action(type: .pushButton, deviceId: 20, commandId: 3009), // NUM0 (8)
            Action(type: .pushButton, deviceId: 20, commandId: 3010), // NUM0 (9)
            Action(type: .pushButton, deviceId: 20, commandId: 3018), // ENTER (10)
            Action(type: .pushButton, deviceId: 20, commandId: 3019), // CLEAR (11)
            Action(type: .pushButton, deviceId: 20, commandId: 3011), // WPT (12)
            Action(type: .pushButton, deviceId: 20, commandId: 3013), // FIX PNT (13)
            Action(type: .pushButton, deviceId: 20, commandId: 3015), // AIRFIELD (14)
            Action(type: .pushButton, deviceId: 20, commandId: 3017), // NAV TGT (15)
            Action(type: .pushButton, deviceId: 20, commandId: 3012), // INU RESET (16)
            Action(type: .pushButton, deviceId: 20, commandId: 3014), // INU PREC (17)
            Action(type: .pushButton, deviceId: 20, commandId: 3016), // INU NORM (18)
            Action(type: .pushButton, deviceId: 20, commandId: 3020), // INIT PNT (19)
            Action(type: .pushButton, deviceId: 20, commandId: 3021), // SELF COOR (20)
            Action(type: .pushButton, deviceId: 20, commandId: 3022), // DTA DH (21)
            Action(type: .pushButton, deviceId: 20, commandId: 3023), // WIND DI/SP (22)
            Action(type: .pushButton, deviceId: 20, commandId: 3024), // THEAD TIME/DIS (23)
            Action(type: .pushButton, deviceId: 20, commandId: 3025), // BRG/RA TGT PNT (24)
            Action(type: .pushButton, deviceId: 20, commandId: 3026, argument: -0.1), // MASTER MODE CCW (25)
            Action(type: .pushButton, deviceId: 20, commandId: 3027, argument: 0.1), // MASTER MODE CW (26)
            Action(type: .pushButton, deviceId: 20, commandId: 3028), // FIXMETHOD UP (27)
            Action(type: .pushButton, deviceId: 20, commandId: 3028, argument: 0.0), // FIXMETHOD DOWN (28)
            Action(type: .pushButton, deviceId: 25, commandId: 3016), // DATALINK POWER ON (29)
            Action(type: .pushButton, deviceId: 25, commandId: 3016, argument: 0.0), // DATALINK POWER OFF (30)
        ]
    }
    
    override func updateDisplays(with content: [String: String]) {
    }
}
