//
//  PlaneViewController.swift
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
import Network

class PlaneViewController: UIViewController, DCSConnectionDelegate {
    var actions = [Action]()
    var originalSwitchImages = [Int: String]()
    var alternateSwitchImages = [Int: String]()
    var actionToViewDict = [Int: UIImageView]()
    
    //let dcsConnection = DCSConnection()
    var dcsConnection: DCSConnection?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        initActions()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        dcsConnection = DCSConnection()
        dcsConnection?.delegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        dcsConnection?.delegate = nil
        dcsConnection = nil
    }
    
    func initActions() {}
    
    func processIncomingMessage(_ content: String) {
        var contentOfDisplays = [String: String]()
        let lines = content.components(separatedBy: "\n")
        var i = 0
        while i < lines.count {
            if lines[i].starts(with: "-") {
                contentOfDisplays[lines[i + 1]] = lines[i + 2]
                i = i + 3
            } else {
                i = i + 1
            }
        }
        updateDisplays(with: contentOfDisplays)
    }
    
    func updateDisplays(with content: [String: String]) {
    }
    
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
        dcsConnection?.sendMessage(content: message)
    }
}
