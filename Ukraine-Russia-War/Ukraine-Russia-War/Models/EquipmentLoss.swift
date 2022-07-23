//
//  EquipmentLoss.swift
//  Ukraine-Russia-War
//
//  Created by Chernousova Maria on 11.07.2022.
//

import Foundation

struct EquipmentLoss: Hashable {
    
    enum Kind {
        case aircraft
        case helicopter
        case tank
        case armoredPersonnelCarrier
        case fieldArtillery
        case multipleRocketLauncher
        case militaryAuto
        case fuelTank
        case drone
        case navalShip
        case antiAircraftWarfare
        case specialEquipment
        case mobileSRBMSystem
    }
    
    let amount: Int
    let kind: Kind
    
    var title: String {
        switch kind {
        case .aircraft:
            return "Aircraft"
        case .helicopter:
            return "Helicopters"
        case .tank:
            return "Tanks"
        case .armoredPersonnelCarrier:
            return "Armored personnel carriers"
        case .fieldArtillery:
            return "Field artillery"
        case .multipleRocketLauncher:
            return "Multiple rocket launchers"
        case .militaryAuto:
            return "Military auto"
        case .fuelTank:
            return "Fuel tanks"
        case .drone:
            return "Drones"
        case .navalShip:
            return "Naval ships"
        case .antiAircraftWarfare:
            return "Anti-aircraft warfare"
        case .specialEquipment:
            return "Special equipment"
        case .mobileSRBMSystem:
            return "Mobile SRBM systems"
        }
    }
    
    var imageName: String {
        switch kind {
        case .aircraft:
            return "aircraft"
        case .helicopter:
            return "helicopter"
        case .tank:
            return "tank"
        case .armoredPersonnelCarrier:
            return "armoredPersonnelCarrier"
        case .fieldArtillery:
            return "fieldArtillery"
        case .multipleRocketLauncher:
            return "multipleRocketLauncher"
        case .militaryAuto:
            return "militaryAuto"
        case .fuelTank:
            return "fuelTank"
        case .drone:
            return "drone"
        case .navalShip:
            return "navalShip"
        case .antiAircraftWarfare:
            return "antiAircraftWarfare"
        case .specialEquipment:
            return "specialEquipment"
        case .mobileSRBMSystem:
            return "mobileSRBMSystem"
        }
    }
}

extension EquipmentLoss: MilitaryDetailsDataProvider { }
