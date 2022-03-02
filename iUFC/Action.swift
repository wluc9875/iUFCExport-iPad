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
    var increment: Double
    var minimum: Double
    var maximum: Double
    
    init(type: ActionType, deviceId: Int, commandId: Int, argument: Double = 1.0, increment: Double = 1.0, minimum: Double = 0.0, maximum: Double = 0.0) {
        self.type = type
        self.deviceId = deviceId
        self.commandId = commandId
        self.argument = argument
        self.increment = increment
        self.minimum = minimum
        self.maximum = maximum
    }
    
    func toggleArgument() {
        self.argument = self.increment - self.argument
    }
    
    func increaseArgument() {
        if (self.argument < self.maximum) {
            self.argument = self.argument + self.increment
        }
    }
    
    func decreaseArgument() {
        if (self.argument > self.minimum) {
            self.argument = self.argument - self.increment
        }
    }
}
