//
//  Connectivity.swift
//  SwiftUICombine
//
//  Created by Syed Najam on 14.11.21.
//

import Foundation
import Network

/// Check for internet connection, if it is available or not, we must have to create new instance always because with singleton it won't work again again,
/// at some point it won't return into closure, maybe because of queue system etc.
class Connectivity {
    
    let monitor = NWPathMonitor()
    
    init(){
        self.startMonitoring()
    }
    
    func checkInternetConnection(completionHandler: @escaping (Bool) -> Void)  {
        monitor.pathUpdateHandler = { path in
            completionHandler(path.status == .satisfied && !path.isExpensive)
        }
    }
    
    func startMonitoring() {
        monitor.start(queue: DispatchQueue(label: "monitor"))
    }
    
    func stopMonitoing() {
        monitor.cancel()
    }
    
    deinit {
        self.stopMonitoing()
    }
}

