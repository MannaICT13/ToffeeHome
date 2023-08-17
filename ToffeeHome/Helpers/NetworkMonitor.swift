//
//  NetworkMonitor.swift
//  ToffeeHome
//
//  Created by Khaled on 17/8/23.
//

import Foundation
import Network

class NetworkMonitor {
    static let shared = NetworkMonitor()
    
    let monitor = NWPathMonitor()
    private var status: NWPath.Status = .requiresConnection
    var isReachable: Bool { status == .satisfied }
    var isReachableOnCellular: Bool = true

    func startMonitoring() {
        monitor.pathUpdateHandler = { [weak self] path in
            guard let self = self else { return }

            let previousStatus = self.status
            self.status = path.status
            self.isReachableOnCellular = path.isExpensive

            if path.status == .satisfied && previousStatus != .satisfied {
                print("Internet connection established.")
                NotificationCenter.default.post(name: .internetConnectionEstablished, object: nil)
            } else if path.status != .satisfied && previousStatus == .satisfied {
                print("Internet connection lost.")
                NotificationCenter.default.post(name: .internetConnectionLost, object: nil)
            }
        }
        
        let queue = DispatchQueue(label: "NetworkMonitor")
        monitor.start(queue: queue)
    }

    func stopMonitoring() {
        monitor.cancel()
    }
}

extension Notification.Name {
    static let internetConnectionEstablished = Notification.Name("internetConnectionEstablished")
    static let internetConnectionLost = Notification.Name("internetConnectionLost")
}
