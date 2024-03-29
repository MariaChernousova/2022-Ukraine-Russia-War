//
//  ServiceLocator.swift
//  Ukraine-Russia-War
//
//  Created by Chernousova Maria on 04.07.2022.
//

import Foundation

class ServiceLocator {
    
    private var services = [ObjectIdentifier: Any]()
    
    func register<T>(_ service: T) {
        services[key(for: T.self)] = service
    }
    
    func resolve<T>() -> T? {
        return services[key(for: T.self)] as? T
    }
    
    private func key<T>(for type: T.Type) -> ObjectIdentifier {
        return ObjectIdentifier(T.self)
    }
}

extension ServiceLocator: ServiceManager {
    
    private enum Const {
        static let errorMessage = "'%@' cannot be resolved"
    }
    
    var dataManager: DataManagerContext {
        guard let dataManager: DataManagerContext = resolve() else {
            fatalError(.init(format: Const.errorMessage,
                             arguments: [String(describing: DataManagerContext.self)]))
        }
        return dataManager
    }
}
