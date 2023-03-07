//
//  NetworkManager.swift
//  1Sonia
//
//  Created by Azizbek Salimov on 01.07.2022.
//


import Foundation
import Network
import UIKit


class NetworkMonitor {
    static let shared = NetworkMonitor()
    private let queue = DispatchQueue.global()
    private let monitor: NWPathMonitor
    public private(set) var isConnetcted: Bool = false
    public private (set) var connectionType: ConnectionType = .unknown
    enum ConnectionType{
        case wifi
        case cellular
        case etherNet
        case unknown
    }
    private init(){
        monitor = NWPathMonitor()
    }
    public func startMonitoring(){
        monitor.start(queue: queue)
        monitor.pathUpdateHandler = { path in
            self.isConnetcted = path.status == .satisfied
            self.getConnectionType(path)
            DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.7 ) {
                if self.isConnetcted{
                    NotificationCenter.default.post(name: Notification.Name("internetConnectionOn"), object: nil)
                } else {
                    NotificationCenter.default.post(name: Notification.Name("internetConnectionOff"), object: nil)
                }
            }

        }
    }
    public func stopMonitoring(){
        monitor.cancel()
        let conType = self.connectionType
       
    }
    public func getConnectionType(_ path: NWPath) -> ConnectionType {
        if path.usesInterfaceType(.wifi) {
            connectionType = .wifi
            
        } else if path.usesInterfaceType(.cellular) {
            connectionType = .cellular
        }
        else if path.usesInterfaceType(.wiredEthernet) {
            connectionType = .etherNet
        } else {
            connectionType = .unknown
        }
        return connectionType
    }
}


