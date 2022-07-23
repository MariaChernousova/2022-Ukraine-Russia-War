//
//  PersonnelLoss.swift
//  Ukraine-Russia-War
//
//  Created by Chernousova Maria on 16.07.2022.
//

import Foundation

struct PersonnelLoss: Hashable {
    
    enum Kind {
        case personnel
        case prisonerOfWar
    }
    
    let amount: Int
    let kind: Kind
    
    var title: String {
        switch kind {
        case .personnel:
            return "Personnel"
        case .prisonerOfWar:
            return "Prisoner of War"
        }
    }
    
    var imageName: String {
        switch kind {
        case .personnel:
            return "personnel"
        case .prisonerOfWar:
            return "prisonerOfWar"
        }
    }
}

extension PersonnelLoss: MilitaryDetailsDataProvider { }
