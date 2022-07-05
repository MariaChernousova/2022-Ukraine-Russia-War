//
//  MainModel.swift
//  Ukraine-Russia-War
//
//  Created by Chernousova Maria on 04.07.2022.
//

import Foundation

protocol MainModelProvider {
    
}

class MainModel: MainModelProvider {
    
    private let serviceManager: ServiceManager
    
    init(serviceManager: ServiceManager) {
        self.serviceManager = serviceManager
    }
}
