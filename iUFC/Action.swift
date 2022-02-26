//
//  Action.swift
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

import Foundation

class Action {
    var type: ActionType
    var deviceId: Int
    var commandId: Int
    var argument: Double
    
    init(type: ActionType, deviceId: Int, commandId: Int, argument: Double = 1.0) {
        self.type = type
        self.deviceId = deviceId
        self.commandId = commandId
        self.argument = argument
    }
    
    func toggleArgument() {
        self.argument = 1.0 - self.argument
    }
}
