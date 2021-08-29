//
//  M2000ViewController.swift
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

class M2000ViewController: PlaneViewController {
    //@IBOutlet var oduLabel1: UILabel!
    //@IBOutlet var dataLinkImageView: UIImageView!
    //@IBOutlet var waypointButton: UIButton!    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func initActions() {
        actions = [
            Action(type: .pushButton, deviceId: 23, commandId: 3315), // UFC Button 0 (0)
        ]
    }
    
    override func updateDisplays(with content: [String: String]) {
        //
        
        DispatchQueue.main.async {
            //
        }
    }
}
