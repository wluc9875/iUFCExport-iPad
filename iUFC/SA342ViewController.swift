//
//  SA342ViewController.swift
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

class SA342ViewController: PlaneViewController {
    @IBOutlet var dopplerRotator: UIImageView!
    @IBOutlet var parameterRotator: UIImageView!
    @IBOutlet var line1Label: UILabel!
    @IBOutlet var line2Label: UILabel!
    @IBOutlet var waypointLabel: UILabel!
    
    var doppler = 0.0
    var parameter = 0.0
    
    override func initActions() {
        actions = [
            Action(type: .pushButton, deviceId: 23, commandId: 3009), // NADIR Button 0 (0)
            Action(type: .pushButton, deviceId: 23, commandId: 3010), // NADIR Button 1 (1)
            Action(type: .pushButton, deviceId: 23, commandId: 3011), // NADIR Button 2 (2)
            Action(type: .pushButton, deviceId: 23, commandId: 3012), // NADIR Button 3 (3)
            Action(type: .pushButton, deviceId: 23, commandId: 3013), // NADIR Button 4 (4)
            Action(type: .pushButton, deviceId: 23, commandId: 3014), // NADIR Button 5 (5)
            Action(type: .pushButton, deviceId: 23, commandId: 3015), // NADIR Button 6 (6)
            Action(type: .pushButton, deviceId: 23, commandId: 3016), // NADIR Button 7 (7)
            Action(type: .pushButton, deviceId: 23, commandId: 3017), // NADIR Button 8 (8)
            Action(type: .pushButton, deviceId: 23, commandId: 3018), // NADIR Button 9 (9)
            Action(type: .pushButton, deviceId: 23, commandId: 3004), // NADIR Button ENT (10)
            Action(type: .pushButton, deviceId: 23, commandId: 3005), // NADIR Button DES (11)
            Action(type: .pushButton, deviceId: 23, commandId: 3006), // NADIR Button AUX (12)
            Action(type: .pushButton, deviceId: 23, commandId: 3007), // NADIR Button I.C. (13)
            Action(type: .pushButton, deviceId: 23, commandId: 3008), // NADIR Button Down Arrow (14)
            Action(type: .pushButton, deviceId: 23, commandId: 3019), // NADIR Button POL (15)
            Action(type: .pushButton, deviceId: 23, commandId: 3020), // NADIR Button GEO/UTM (16)
            Action(type: .pushButton, deviceId: 23, commandId: 3021), // NADIR Button POS FIX (17)
            Action(type: .pushButton, deviceId: 23, commandId: 3022), // NADIR Button GEL (18)
            Action(type: .pushButton, deviceId: 23, commandId: 3023), // NADIR Button EFF (19)
            Action(type: .pushButton, deviceId: 23, commandId: 3003), // NADIR Param CCW (20)
            Action(type: .pushButton, deviceId: 23, commandId: 3003), // NADIR Param CW (21)
            Action(type: .pushButton, deviceId: 23, commandId: 3002), // NADIR Doppler CCW (22)
            Action(type: .pushButton, deviceId: 23, commandId: 3002), // NADIR Doppler CW (23)
        ]
    }
        
    override func updateDisplays(with content: [String: String]) {
        let number1AsString = "\(content["CentMille"] ?? "")\(content["DixMille"] ?? "")\(content["Mille"] ?? "")\(content["Cent"] ?? "")\(content["Dix"] ?? "")\(content["Unit"] ?? "")"
        let number2AsString = "\(content["CentMilleI"] ?? "")\(content["DixMilleI"] ?? "")\(content["MilleI"] ?? "")\(content["CentI"] ?? "")\(content["DixI"] ?? "")\(content["UnitI"] ?? "")"
        let number3AsString = "\(content["F_dix"] ?? "")\(content["F_unit"] ?? "")"
        let number1 = Int(number1AsString) ?? 0
        let number2 = Int(number2AsString) ?? 0
        let number3 = Int(number3AsString) ?? 0
        
        let dopplerAsString = content["doppler"] ?? ""
        let parameterAsString = content["parameter"] ?? ""
        doppler = Double(dopplerAsString) ?? 0.0
        parameter = Double(parameterAsString) ?? 0.0
        
        let parameterValueDown = (parameter <= 0.2) ? 0.0 : (parameter - 0.2)
        actions[20].argument = parameterValueDown
        let parameterValueUp = (parameter >= 0.8) ? 1.0 : (parameter + 0.2)
        actions[21].argument = parameterValueUp
        let dopplerValueDown = (doppler <= 0.2) ? 0.0 : (doppler - 0.2)
        actions[22].argument = dopplerValueDown
        let dopplerValueUp = (doppler >= 0.8) ? 1.0 : (doppler + 0.2)
        actions[23].argument = dopplerValueUp
        
        DispatchQueue.main.async {
            self.line1Label.text = String(number1)
            self.line2Label.text = String(number2)
            self.waypointLabel.text = number3 != 0 ? String(number3) : ""
            
            let baseRotationAngle = Double.pi / 6.0
            self.parameterRotator.transform = CGAffineTransform(rotationAngle: CGFloat(baseRotationAngle + (((self.parameter - 1.0)/0.2) * baseRotationAngle)))
            self.dopplerRotator.transform = CGAffineTransform(rotationAngle: CGFloat(((self.doppler - 1.0)/0.2) * baseRotationAngle))
        }
    }
}
