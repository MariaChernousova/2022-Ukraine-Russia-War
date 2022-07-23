//
//  AppCoordinator.swift
//  Ukraine-Russia-War
//
//  Created by Chernousova Maria on 04.07.2022.
//

import UIKit

class AppCoordinator: Coordinator {
    
    var serviceManager: ServiceManager
    var rootViewController: UINavigationController
    
    init(serviceManager: ServiceManager, rootViewController: UINavigationController) {
        self.serviceManager = serviceManager
        self.rootViewController = rootViewController
    }
    
    func start() {
        startFoldersCoordinator()
    }
    
    private func startFoldersCoordinator() {
        MainCoordinator(serviceManager: serviceManager, rootViewController: rootViewController).start()
    }
}
