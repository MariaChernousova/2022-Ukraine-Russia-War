//
//  ComparableLoss.swift
//  Ukraine-Russia-War
//
//  Created by Chernousova Maria on 16.07.2022.
//

import Foundation

struct ComparableLoss<T> {
    
    let current: T
    let previous: T
}

extension ComparableLoss where T == Personnel {
    
    func difference(for loss: PersonnelLoss.Kind) -> Int? {
        guard let currentAmount = current.losses.first(where: { $0.kind == loss })?.amount,
              let previousAmount = previous.losses.first(where: { $0.kind == loss })?.amount else {
            return nil
        }
        let difference = currentAmount - previousAmount
        return difference > .zero ? difference : nil
    }
}

extension ComparableLoss where T == Equipment {
    
    func difference(for loss: EquipmentLoss.Kind) -> Int? {
        guard let currentAmount = current.losses.first(where: { $0.kind == loss })?.amount,
              let previousAmount = previous.losses.first(where: { $0.kind == loss })?.amount else {
            return nil
        }
        let difference = currentAmount - previousAmount
        return difference > .zero ? difference : nil
    }
}
