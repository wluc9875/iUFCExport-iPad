//
//  AJS37ViewController.swift
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

class AJS37CK37ViewController: PlaneViewController {
    @IBOutlet var dataLabel1: UILabel!
    @IBOutlet var dataLabel2: UILabel!
    @IBOutlet var dataLabel3: UILabel!
    @IBOutlet var dataLabel4: UILabel!
    @IBOutlet var dataLabel5: UILabel!
    @IBOutlet var dataLabel6: UILabel!
    @IBOutlet var inutImageView: UIImageView!
    @IBOutlet var dataSelectorImageView: UIImageView!
    
    static let dataselToImage = [
        0.0: "AJS37/AJS37-CK37-selector-idnr",
        //0.1: nil, // TAKT (default image)
        0.2: "AJS37/AJS37-CK37-selector-tid",
        0.3: "AJS37/AJS37-CK37-selector-vind",
        0.4: "AJS37/AJS37-CK37-selector-bana",
        0.5: "AJS37/AJS37-CK37-selector-reflola",
        0.6: "AJS37/AJS37-CK37-selector-aktpos"
    ]
    
    override func initActions() {
        actions = [
            Action(type: .pushButton, deviceId: 12, commandId: 3020), // NUM0 (0)
            Action(type: .pushButton, deviceId: 12, commandId: 3021), // NUM1 (1)
            Action(type: .pushButton, deviceId: 12, commandId: 3022), // NUM2 (2)
            Action(type: .pushButton, deviceId: 12, commandId: 3023), // NUM3 (3)
            Action(type: .pushButton, deviceId: 12, commandId: 3024), // NUM4 (4)
            Action(type: .pushButton, deviceId: 12, commandId: 3025), // NUM5 (5)
            Action(type: .pushButton, deviceId: 12, commandId: 3026), // NUM6 (6)
            Action(type: .pushButton, deviceId: 12, commandId: 3027), // NUM7 (7)
            Action(type: .pushButton, deviceId: 12, commandId: 3028), // NUM8 (8)
            Action(type: .pushButton, deviceId: 12, commandId: 3029), // NUM9 (9)
            Action(type: .pushButton, deviceId: 23, commandId: 3008, argument: 0.0), // INUT => UT(10)
            Action(type: .pushButton, deviceId: 12, commandId: 3011), // WPT B1 (11)
            Action(type: .pushButton, deviceId: 12, commandId: 3012), // WPT B2 (12)
            Action(type: .pushButton, deviceId: 12, commandId: 3013), // WPT B3 (13)
            Action(type: .pushButton, deviceId: 12, commandId: 3014), // WPT B4 (14)
            Action(type: .pushButton, deviceId: 12, commandId: 3015), // WPT B5 (15)
            Action(type: .pushButton, deviceId: 12, commandId: 3016), // WPT B6 (16)
            Action(type: .pushButton, deviceId: 12, commandId: 3017), // WPT B7 (17)
            Action(type: .pushButton, deviceId: 12, commandId: 3018), // WPT B8 (18)
            Action(type: .pushButton, deviceId: 12, commandId: 3019), // WPT B9 (19)
            Action(type: .pushButton, deviceId: 12, commandId: 3010), // WPT BX (20)
            Action(type: .pushButton, deviceId: 12, commandId: 3009), // WPT LSSKU (21)
            Action(type: .pushButton, deviceId: 12, commandId: 3008), // WPT LMAL (22)
            Action(type: .pushButton, deviceId: 23, commandId: 3011, argument: -1.0), // data selector CCW (23)
            Action(type: .pushButton, deviceId: 23, commandId: 3011, argument: 1.0), // data selector CW (24)
            Action(type: .pushButton, deviceId: 23, commandId: 3008, argument: 1.0), // INUT => IN (25)
        ]
    }
    
    override func updateDisplays(with content: [String: String]) {
        var dataselImage: UIImage? = nil
        if let datasel = content["datasel"] {
            if let dataselAsNumber = Double(datasel) {
                if let dataselImageName = AJS37CK37ViewController.dataselToImage[(dataselAsNumber * 10.0).rounded() / 10.0] {
                    dataselImage = UIImage(named: dataselImageName)
                }
            }
        }
        
        DispatchQueue.main.async {
            self.dataLabel1.text = content["data1"] ?? ""
            self.dataLabel2.text = content["data2"] ?? ""
            self.dataLabel3.text = content["data3"] ?? ""
            self.dataLabel4.text = content["data4"] ?? ""
            self.dataLabel5.text = content["data5"] ?? ""
            self.dataLabel6.text = content["data6"] ?? ""
            self.inutImageView.isHighlighted = (content["inut"] == "1")
            self.dataSelectorImageView.image = dataselImage
        }
    }
}
