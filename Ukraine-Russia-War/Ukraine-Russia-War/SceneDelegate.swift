//
//  SceneDelegate.swift
//  Ukraine-Russia-War
//
//  Created by Chernousova Maria on 04.07.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    private(set) var appCoordinator: AppCoordinator?
    
    private lazy var serviceLocator = ServiceLocator()
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let navigationController = UINavigationController()
        
        configureDataManager()
        
        appCoordinator = AppCoordinator(serviceManager: serviceLocator, rootViewController: navigationController)
        appCoordinator?.start()
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

extension SceneDelegate {
    
    private func configureDataManager() {
        let dataLoader: DataLoaderContext = DataLoader()
        let dataParser: DataParserContext = DataParser()
        
        // Data managers.
        let dataManager: DataManagerContext = DataManager(
            dataLoader: dataLoader,
            dataParser: dataParser
        )
        
        // Registration.
        serviceLocator.register(dataManager)
    }
}
