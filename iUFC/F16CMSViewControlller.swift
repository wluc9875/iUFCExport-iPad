//
//  F16TestViewController.swift
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

class F16CMSViewControlller: PlaneViewController {
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
}
