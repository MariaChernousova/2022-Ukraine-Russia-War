//
//  MainModel.swift
//  Ukraine-Russia-War
//
//  Created by Chernousova Maria on 04.07.2022.
//

import Foundation

protocol MainModelProvider {
    func getPersonnelData(completionHandler: @escaping ((Result<[Personnel], AppError>) -> Void))
}

class MainModel: MainModelProvider {
    
    private let dataManager: DataManagerContext
    
    init(serviceManager: ServiceManager) {
        self.dataManager = serviceManager.dataManager
    }
    
    func getPersonnelData(completionHandler: @escaping ((Result<[Personnel], AppError>) -> Void)) {
        dataManager.getPersonnelData(completionHandler: completionHandler)
    }
}
