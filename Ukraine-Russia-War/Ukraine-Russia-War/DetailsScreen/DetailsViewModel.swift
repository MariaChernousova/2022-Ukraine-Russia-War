//
//  DetailsViewModel.swift
//  Ukraine-Russia-War
//
//  Created by Chernousova Maria on 08.07.2022.
//

import Foundation

protocol DetailsViewModelProvider {
    var updateAction: (OverallResult) -> Void { get set }
    var showErrorAlert: ( _ title: String, _ message: String) -> Void { get set }
    
    func didLoad()
}

class DetailsViewModel: DetailsViewModelProvider {
    
    var updateAction: (OverallResult) -> Void = { _ in }
    var showErrorAlert: ( _ title: String, _ message: String) -> Void = { _, _ in }
    
    private let model: DetailsModelProvider
    private let personnel: Personnel
    
    init(model: DetailsModelProvider, personnel: Personnel) {
        self.model = model
        self.personnel = personnel
    }
    
    func didLoad() {
        model.getEquipmentData { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let equipmentData):
                for equipment in equipmentData {
                    if self.personnel.date == equipment.date,
                       self.personnel.day == equipment.day {
                        let result = OverallResult(personnel: self.personnel, equipment: equipment)
                        print(result)
                        self.updateAction(result)
                    }
                }
            case .failure(let error):
                self.handlerError(error)
            }
        }
    }
    
    // MARK: - Private methods.
    
    private func handlerError(_ error: AppError) {
        showErrorAlert(error.title, error.description)
    }
}
