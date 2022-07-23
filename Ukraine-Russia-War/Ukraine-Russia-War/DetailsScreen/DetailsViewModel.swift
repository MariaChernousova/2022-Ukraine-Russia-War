//
//  DetailsViewModel.swift
//  Ukraine-Russia-War
//
//  Created by Chernousova Maria on 08.07.2022.
//

import Foundation

protocol DetailsViewModelProvider {
    var updateAction: ([DetailsDataSource.Item]) -> Void { get set }
    var showErrorAlert: ( _ title: String, _ message: String) -> Void { get set }
    
    func didLoad()
}

class DetailsViewModel: DetailsViewModelProvider {
    
    var updateAction: ([DetailsDataSource.Item]) -> Void = { _ in }
    var showErrorAlert: ( _ title: String, _ message: String) -> Void = { _, _ in }
    
    private let model: DetailsModelProvider
    private let comparableLoss: ComparableLoss<Personnel>
    
    private var items: [DetailsDataSource.Item] = [] {
        didSet {
            DispatchQueue.main.async {
                self.updateAction(self.items)
            }
        }
    }
    
    init(model: DetailsModelProvider,
         comparableLoss: ComparableLoss<Personnel>) {
        self.model = model
        self.comparableLoss = comparableLoss
    }
    
    func didLoad() {
        model.getEquipmentData { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let equipments):
                self.items = self.buildItems(for: equipments)
            case .failure(let error):
                self.handlerError(error)
            }
        }
    }
    
    // MARK: - Private methods.
    
    private func buildItems(for equipments: [Equipment]) -> [DetailsDataSource.Item] {
        let currentPersonnelDate = comparableLoss.current.date
        let previousPersonnelDate = comparableLoss.previous.date
        guard let currentEquipment = equipments
            .first(where: { $0.date == currentPersonnelDate }),
        let previousEquipment = equipments
            .first(where: { $0.date == previousPersonnelDate }) else { return [] }
        
        let equipmentComparableLoss = ComparableLoss(current: currentEquipment, previous: previousEquipment)
        
        let dayAdapter = DetailsDateAdapter(personnel: comparableLoss.current)
        var items: [DetailsDataSource.Item] = [
            .date(dayAdapter)
        ]

        comparableLoss.current.losses.forEach { loss in
            let difference = comparableLoss.difference(for: loss.kind)
            let item = DetailsDataSource.Item.personnelLoss(loss, increase: difference)
            items.append(item)
        }
        
        equipmentComparableLoss.current.losses.forEach { loss in
            let difference = equipmentComparableLoss.difference(for: loss.kind)
            let item = DetailsDataSource.Item.equipmentLoss(loss, increase: difference)
            items.append(item)
        }
        
        return items
    }
    
    private func handlerError(_ error: AppError) {
        showErrorAlert(error.title, error.description)
    }
}
