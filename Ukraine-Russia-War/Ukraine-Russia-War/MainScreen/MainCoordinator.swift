//
//  MainCoordinator.swift
//  Ukraine-Russia-War
//
//  Created by Chernousova Maria on 04.07.2022.
//

import UIKit

class MainCoordinator: Coordinator {
    enum Path {
        case description(ComparableLoss<Personnel>)
    }
    
    let serviceManager: ServiceManager
    let rootViewController: UINavigationController
    
    init(serviceManager: ServiceManager, rootViewController: UINavigationController) {
        self.serviceManager = serviceManager
        self.rootViewController = rootViewController
    }
    
    func start() {
        let model = MainModel(serviceManager: serviceManager)
        let viewModel = MainViewModel(model: model) { path in
            switch path {
            case .description(let comparableLoss):
                self.startDescriptionFlow(with: comparableLoss)
            }
        }
        let viewController = MainViewController(viewModel: viewModel)
        
        rootViewController.pushViewController(viewController, animated: true)
    }
    
    private func startDescriptionFlow(with comparableLoss: ComparableLoss<Personnel>) {
        DetailsCoordinator(serviceManager: serviceManager, rootViewController: rootViewController, comparableLoss: comparableLoss).start()
    }
}
