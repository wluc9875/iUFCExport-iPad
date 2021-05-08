//
//  HomeViewController.swift
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

class HomeViewController: UITableViewController {
    let supportedPlanes = [
        "A-10C",
        "AJS37",
        "AV8-BNA",
        "F-16C",
        "FA-18C",
        "JF17",
        "KA50"
        //"SA342" // postponed to a later version
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "iUFCExport"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Config", style: .plain, target: self, action: #selector(configureOutboundIPAddress))
    }
    
    @objc func configureOutboundIPAddress() {
        let ac = UIAlertController(title: "Network Configuration", message: "Enter Outbound IP Address and Base Port", preferredStyle: .alert)
        ac.addTextField() {
            textField in
            textField.text = DCSConnection.OUTBOUND_IP_ADDRESS
        }
        ac.addTextField() {
            textField in
            textField.text = String(format: "%d", DCSConnection.INBOUND_PORT)
        }
        let action = UIAlertAction(title: "OK", style: .default) {
            [weak ac] _ in
            guard let ipAddress = ac?.textFields?[0].text else {return}
            DCSConnection.OUTBOUND_IP_ADDRESS = ipAddress
            UserDefaults.standard.set(ipAddress, forKey: "OUTBOUND_IP_ADDRESS")
            
            guard let inboundPortAsString = ac?.textFields?[1].text else {return}
            guard let inboundPort = UInt16(inboundPortAsString) else {return}
            DCSConnection.INBOUND_PORT = inboundPort
            DCSConnection.OUTBOUND_PORT = inboundPort + 1
            UserDefaults.standard.set(inboundPort, forKey: "INBOUND_PORT")
        }
        ac.addAction(action)
        present(ac, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return supportedPlanes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = supportedPlanes[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let plane = supportedPlanes[indexPath.row]
        if let vc = storyboard?.instantiateViewController(withIdentifier: plane) {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
