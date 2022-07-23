//
//  DetailsModel.swift
//  Ukraine-Russia-War
//
//  Created by Chernousova Maria on 08.07.2022.
//

import Foundation

protocol DetailsModelProvider {
    func getEquipmentData(completionHandler: @escaping ((Result<[Equipment], AppError>) -> Void))
}

class DetailsModel: DetailsModelProvider {
    
    private let dataManager: DataManagerContext
    
    init(serviceManager: ServiceManager) {
        self.dataManager = serviceManager.dataManager
    }
    
    func getEquipmentData(completionHandler: @escaping ((Result<[Equipment], AppError>) -> Void)) {
        dataManager.getEquipmentData(completionHandler: completionHandler)
    }
}
