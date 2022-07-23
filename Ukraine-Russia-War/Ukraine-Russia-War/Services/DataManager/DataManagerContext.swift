//
//  DataManagerContext.swift
//  Ukraine-Russia-War
//
//  Created by Chernousova Maria on 05.07.2022.
//

import Foundation

protocol DataManagerContext {
    func getPersonnelData(completionHandler: @escaping ((Result<[Personnel], AppError>) -> Void))
    func getEquipmentData(completionHandler: @escaping ((Result<[Equipment], AppError>) -> Void))
}
