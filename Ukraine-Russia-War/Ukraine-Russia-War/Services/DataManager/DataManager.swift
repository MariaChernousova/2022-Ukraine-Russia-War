//
//  DataManager.swift
//  Ukraine-Russia-War
//
//  Created by Chernousova Maria on 04.07.2022.
//

import Foundation

class DataManager: DataManagerContext {
    
    let dataLoader: DataLoaderContext
    let dataParser: DataParserContext
    
    init(dataLoader: DataLoaderContext, dataParser: DataParserContext) {
        self.dataLoader = dataLoader
        self.dataParser = dataParser
    }
    
    func getPersonnelData(completionHandler: @escaping ((Result<[Personnel], AppError>) -> Void)) {
        if let data = dataLoader.loadData(for: "russia_losses_personnel") {
            if let parsedData = dataParser.parse(from: data, of: Personnel.self) {
                completionHandler(.success(parsedData))
            }
        }
        completionHandler(.failure(.dataNotFound))
    }
    
    func getEquipmentData(completionHandler: @escaping ((Result<[Equipment], AppError>) -> Void)) {
        if let data = dataLoader.loadData(for: "russia_losses_equipment") {
            if let parsedData = dataParser.parse(from: data, of: Equipment.self) {
                completionHandler(.success(parsedData))
            }
        }
        completionHandler(.failure(.dataNotFound))
    }
}
