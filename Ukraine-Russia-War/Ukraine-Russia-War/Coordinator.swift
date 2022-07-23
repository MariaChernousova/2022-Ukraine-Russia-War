//
//  Coordinator.swift
//  Ukraine-Russia-War
//
//  Created by Chernousova Maria on 04.07.2022.
//

import UIKit

protocol Coordinator {
    var serviceManager: ServiceManager { get }
    var rootViewController: UINavigationController { get }
    
    func start()
}
