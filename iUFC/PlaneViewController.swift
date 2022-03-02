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

class PlaneViewController: UITabBarController, DCSConnectionDelegate {    
    var dcsConnection: DCSConnection?
    
    override func viewWillAppear(_ animated: Bool) {
        dcsConnection = DCSConnection()
        dcsConnection?.delegate = self
        if let panelViewControllers = self.viewControllers {
            for vc in panelViewControllers {
                if let panelVC = vc as? PanelViewController {
                    panelVC.dcsConnection = dcsConnection;
                }
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        dcsConnection?.delegate = nil
        dcsConnection = nil
    }
        
    func processIncomingMessage(_ content: String) {
        var contentOfDisplays = [String: String]()
        print(content)
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
        DispatchQueue.main.async {
            if let panelViewControllers = self.viewControllers {
                for vc in panelViewControllers {
                    if let panelVC = vc as? PanelViewController {
                        if panelVC.isViewLoaded {
                            panelVC.updateDisplays(with: content);
                        }
                    }
                }
            }
        }
    }
}
