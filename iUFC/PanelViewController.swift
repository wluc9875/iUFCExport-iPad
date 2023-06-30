//
//  PanelViewController.swift
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
import UIKit

class PanelViewController: UIViewController {
    var actions = [Action]()
    var originalSwitchImages = [Int: String]()
    var alternateSwitchImages = [Int: String]()
    var actionToViewDict = [Int: UIImageView]()
    
    weak var dcsConnection: DCSConnection?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initActions();
        dcsConnection?.sendMessage(content: "999 1 1\n")
    }
    
    func initActions() {}
    
    func updateDisplays(with content: [String: String]) {}
    
    @IBAction func buttonPushed(_ sender: UIButton) {
        if let imageName = alternateSwitchImages[sender.tag] {
            if let imageView = actionToViewDict[sender.tag] {
                if imageName.isEmpty {
                    imageView.image = nil
                } else {
                    imageView.image = UIImage(named: imageName)
                }
            }
        }
        let action = actions[sender.tag]
        
        if (action.type == .toggleButton) {
            action.toggleArgument()
        } else if (action.type == .rotatorCW) {
            let actionCCW = actions[sender.tag - 1]
            action.increaseArgument()
            actionCCW.increaseArgument()
        } else if (action.type == .rotatorCCW) {
           let actionCW = actions[sender.tag + 1]
           action.decreaseArgument()
           actionCW.decreaseArgument()
       }
        
        print("\(action.deviceId) \(action.commandId) \(action.argument)")
        let message = "\(action.deviceId) \(action.commandId) \(action.argument)\n"
        dcsConnection?.sendMessage(content: message)
    }
    
    @IBAction func buttonReleased(_ sender: UIButton) {
        // back to normal image
        if let imageName = originalSwitchImages[sender.tag] {
            if let imageView = actionToViewDict[sender.tag] {
                if imageName.isEmpty {
                    imageView.image = nil
                } else {
                    imageView.image = UIImage(named: imageName)
                }
            }
        }
        
        let action = actions[sender.tag]
        print("\(action.deviceId) \(action.commandId) \(action.minimum)")
        let message = "\(action.deviceId) \(action.commandId) \(action.minimum)\n"
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(1), execute: {
            self.dcsConnection?.sendMessage(content: message)
        })
    }
}
