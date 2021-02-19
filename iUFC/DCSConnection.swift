//
//  DCSConnection.swift
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
import Network

/// A `DCSConnection` represents a bi-directional communication channel between DCS and this iPad.
class DCSConnection {
    // These are the default values
    static var INBOUND_PORT:UInt16 = UInt16(UserDefaults.standard.string(forKey: "INBOUND_PORT") ?? "7676") ?? 7676
    static var OUTBOUND_PORT:UInt16 = INBOUND_PORT + 1
    static var OUTBOUND_IP_ADDRESS = UserDefaults.standard.string(forKey: "OUTBOUND_IP_ADDRESS") ?? "255.255.255.255"
    static let INBOUND_QUEUE = DispatchQueue(label: "DCS Inbound Queue")
    static let OUTBOUND_QUEUE = DispatchQueue(label: "DCS Outbound Queue")
    
    var listener: NWListener?
    var inboundConnection: NWConnection?
    var outboundConnection: NWConnection?
    weak var delegate: DCSConnectionDelegate?
    
    init?() {
        // Initializes the inbound connection
        
        let inboundPort = NWEndpoint.Port(rawValue: DCSConnection.INBOUND_PORT)!
        listener = try? NWListener(using: .udp, on: inboundPort)
        guard let l = listener else {
            return nil
        }
        l.newConnectionHandler = { [unowned self] newConnection in
            inboundConnection = newConnection
            //print("new connection detected")
            newConnection.stateUpdateHandler = { [unowned self, unowned newConnection] newState in
                 //print("\(newConnection.endpoint)", newState)
                switch newState {
                case .ready:
                    self.receiveOn(connection: newConnection)
                case .failed(_/*let error*/):
                    //print("Incoming connection failed: \(error)")
                    newConnection.cancel()
                default:
                    break
                }
            }
            newConnection.start(queue: DCSConnection.INBOUND_QUEUE)
        }
        // l.service = NWListener.Service(name: "iufcexport", type: "_iufcexport._udp", domain: "local")
        l.stateUpdateHandler = { [unowned l] newState in
            switch newState {
            case .ready:
                print("DCS listener started")
            case .cancelled:
                print("DCS listener cancelled")
            case .failed(let error):
                print("Listener failed: \(error)")
                l.cancel()
            case .waiting(let error):
                print("DCS listener waiting: \(error)")
            case .setup:
                print("Setting up DCS listener")
            default:
                break
            }
        }
        l.start(queue: DCSConnection.INBOUND_QUEUE)
        
        // Initialized the outbound connection
        
        let outboundPort = NWEndpoint.Port(rawValue: DCSConnection.OUTBOUND_PORT)!
        let outboundIP = NWEndpoint.Host(DCSConnection.OUTBOUND_IP_ADDRESS)
        outboundConnection = NWConnection(host: outboundIP, port: outboundPort, using: .udp)
        outboundConnection?.stateUpdateHandler = { [unowned self] newState in
            switch newState {
            case .failed(let error):
                print("Outbound connection error: \(error)")
                self.outboundConnection?.cancel()
            default:
                break
            }
        }
        outboundConnection?.start(queue: DCSConnection.OUTBOUND_QUEUE)
    }
    
    deinit {
        outboundConnection?.cancel()
        inboundConnection?.cancel()
        listener?.newConnectionHandler = nil
        listener?.cancel()
    }
    
    func sendMessage(content: String) {
        let data = Data(content.utf8)
        outboundConnection?.send(content: data, completion: .contentProcessed({ error in
            if let error = error {
                print("send error \(error)")
            }
        }))
    }
    
    func receiveOn(connection: NWConnection) {
        //print ("receiveOn called on ", "\(connection.endpoint)")
        connection.receiveMessage {[unowned connection, unowned self] data, context, isComplete, error in
            //print ("message received on ", "\(connection.endpoint)")
            guard let data = data, let content = String(data: data, encoding: String.Encoding.ascii) else {
                print("Couldn't receive data")
                connection.cancel()
                return
            }
            if isComplete {
                connection.cancel()
                self.delegate?.processIncomingMessage(content)
            } else {
                self.receiveOn(connection: connection) // => in case message incomplete?
            }
        }
    }
}
