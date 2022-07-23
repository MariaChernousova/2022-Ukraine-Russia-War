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
    let comparableLoss: ComparableLoss<Personnel>
    
    init(serviceManager: ServiceManager,
         rootViewController: UINavigationController,
         comparableLoss: ComparableLoss<Personnel>) {
        self.serviceManager = serviceManager
        self.rootViewController = rootViewController
        self.comparableLoss = comparableLoss
    }
    
    func start() {
        let model = DetailsModel(serviceManager: serviceManager)
        let viewModel = DetailsViewModel(model: model, comparableLoss: comparableLoss)
        let viewController = DetailsViewController(viewModel: viewModel)
        
        rootViewController.pushViewController(viewController, animated: true)
    }
}
