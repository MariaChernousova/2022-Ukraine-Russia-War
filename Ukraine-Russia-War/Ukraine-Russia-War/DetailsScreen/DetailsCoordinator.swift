//
//  DetailsCoordinator.swift
//  Ukraine-Russia-War
//
//  Created by Chernousova Maria on 08.07.2022.
//

import UIKit

class DetailsCoordinator: Coordinator {
    
    let serviceManager: ServiceManager
    let rootViewController: UINavigationController
    let personnel: Personnel
    
    init(serviceManager: ServiceManager, rootViewController: UINavigationController, personnel: Personnel) {
        self.serviceManager = serviceManager
        self.rootViewController = rootViewController
        self.personnel = personnel
    }
    
    func start() {
        let model = DetailsModel(serviceManager: serviceManager)
        let viewModel = DetailsViewModel(model: model, personnel: personnel)
        let viewController = DetailsViewController(viewModel: viewModel)
        
        rootViewController.pushViewController(viewController, animated: true)
    }
}
