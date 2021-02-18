//
//  JF17ViewController.swift
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

class JF17ViewController: PlaneViewController {
    @IBOutlet var osbLabel1: UILabel!
    @IBOutlet var osbLabel2: UILabel!
    @IBOutlet var osbLabel3: UILabel!
    @IBOutlet var osbLabel4: UILabel!
    @IBOutlet var oapButton: UIButton!
    @IBOutlet var mrkButton: UIButton!
    @IBOutlet var puButton: UIButton!
    @IBOutlet var hnsButton: UIButton!
    @IBOutlet var apButton: UIButton!
    @IBOutlet var fpmButton: UIButton!
    
    static let FULL_TEXT_KEYS = ["txt_win1", "txt_win2", "txt_win3", "txt_win4"]
    static let FILL_TEXT_KEYS = ["txt_win1_fill", "txt_win2_fill", "txt_win3_fill", "txt_win4_fill"]
    static let RIGHT_TEXT_KEYS = ["txt_win1r", "txt_win2r", "txt_win3r", "txt_win4r"]
    static let CURSOR_KEYS = ["cur_win1", "cur_win2", "cur_win3", "cur_win4"]
    static let CURSOR_RIGHT_KEYS = ["cur_win1r", "cur_win2r", "cur_win3r", "cur_win4r"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func initActions() {
        actions = [
            // UFCP
            Action(type: .pushButton, deviceId: 46, commandId: 3224), // UFCP Button 0 (0)
            Action(type: .pushButton, deviceId: 46, commandId: 3202), // UFCP Button PFL/1 (1)
            Action(type: .pushButton, deviceId: 46, commandId: 3203), // UFCP Button VRC/2 (2)
            Action(type: .pushButton, deviceId: 46, commandId: 3204), // UFCP Button 3 (3)
            Action(type: .pushButton, deviceId: 46, commandId: 3209), // UFCP Button DST/4 (4)
            Action(type: .pushButton, deviceId: 46, commandId: 3210), // UFCP Button TOT/5 (5)
            Action(type: .pushButton, deviceId: 46, commandId: 3211), // UFCP Button TOD/6 (6)
            Action(type: .pushButton, deviceId: 46, commandId: 3216), // UFCP Button FUL/7 (7)
            Action(type: .pushButton, deviceId: 46, commandId: 3217), // UFCP Button IFF/8 (8)
            Action(type: .pushButton, deviceId: 46, commandId: 3218), // UFCP Button 9 (9)
            Action(type: .pushButton, deviceId: 46, commandId: 3223), // UFCP Button RTN (10)
            Action(type: .pushButton, deviceId: 46, commandId: 3207), // UFCP Button OAP (11)
            Action(type: .pushButton, deviceId: 46, commandId: 3208), // UFCP Button MRK (12)
            Action(type: .pushButton, deviceId: 46, commandId: 3214), // UFCP Button P.U (13)
            Action(type: .pushButton, deviceId: 46, commandId: 3215), // UFCP Button HNS (14)
            Action(type: .pushButton, deviceId: 46, commandId: 3221), // UFCP Button A/P (15)
            Action(type: .pushButton, deviceId: 46, commandId: 3222), // UFCP Button FPM (16)
            Action(type: .pushButton, deviceId: 46, commandId: 3205), // UFCP Button L1 (17)
            Action(type: .pushButton, deviceId: 46, commandId: 3206), // UFCP Button R1 (18)
            Action(type: .pushButton, deviceId: 46, commandId: 3212), // UFCP Button L2 (19)
            Action(type: .pushButton, deviceId: 46, commandId: 3213), // UFCP Button R2 (20)
            Action(type: .pushButton, deviceId: 46, commandId: 3219), // UFCP Button L3 (21)
            Action(type: .pushButton, deviceId: 46, commandId: 3220), // UFCP Button R3 (22)
            Action(type: .pushButton, deviceId: 46, commandId: 3226), // UFCP Button L4 (23)
            Action(type: .pushButton, deviceId: 46, commandId: 3227), // UFCP Button R4 (24)
        ]
    }
    
    override func updateDisplays(with content: [String: String]) {
        let lights = content["lights"] ?? ""
        let buttons: [UIButton] = [oapButton, mrkButton, puButton, hnsButton, apButton, fpmButton]
        let text1 = formatLine(number: 0, from: content)
        let text2 = formatLine(number: 1, from: content)
        let text3 = formatLine(number: 2, from: content)
        let text4 = formatLine(number: 3, from: content)
        
        DispatchQueue.main.async {
            var i = 0
            for char in lights {
                buttons[i].isSelected = (char == "1")
                i += 1
            }
            self.osbLabel1.text = (text1 ?? "")
            self.osbLabel2.text = (text2 ?? "")
            self.osbLabel3.text = (text3 ?? "")
            self.osbLabel4.text = (text4 ?? "")
        }
    }
    
    private func formatLine(number: Int, from content: [String:String]) -> String? {
        var text = content[JF17ViewController.FULL_TEXT_KEYS[number]]
        if text == nil {
            let textL = (content[JF17ViewController.FILL_TEXT_KEYS[number]] ?? "")
            let textR = (content[JF17ViewController.RIGHT_TEXT_KEYS[number]] ?? "")
            let numberOfSpaces = 8 - textL.count - textR.count
            let spaces = numberOfSpaces > 0 ? String(repeating: " ", count: numberOfSpaces) : ""
            text = textL + spaces + textR
        }
        text = text?.replacingOccurrences(of: "`", with: "°")
        if content[JF17ViewController.CURSOR_KEYS[number]] != nil {
            if let range = text?.range(of: "-") {
                text = text?.replacingCharacters(in: range, with: "█")
            }
        }
        if content[JF17ViewController.CURSOR_RIGHT_KEYS[number]] != nil {
            if let range = text?.range(of: "-", options: .backwards) {
                text = text?.replacingCharacters(in: range, with: "█")
            }
        }
        return text
    }
}
