//
//  Equipment.swift
//  Ukraine-Russia-War
//
//  Created by Chernousova Maria on 04.07.2022.
//

import Foundation

struct Equipment: Decodable {
    
    private enum CodingKeys: String, CaseIterable, CodingKey {
        case armoredPersonnelCarrier = "APC"
        case fieldArtillery = "field artillery"
        case multipleRocketLauncher = "MRL"
        case militaryAuto = "military auto"
        case fuelTank = "fuel tank"
        case navalShip = "naval ship"
        case antiAircraftWarfare = "anti-aircraft warfare"
        case specialEquipment = "special equipment"
        case mobileSRBMSystem = "mobile SRBM system"
        
        case date, aircraft, helicopter, tank, drone
    }
    
    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        return formatter
    }()
    
    let date: Date
    let losses: [EquipmentLoss]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let dateString = try container.decode(String.self, forKey: .date)
        if let date = Equipment.dateFormatter.date(from: dateString) {
            self.date = date
        } else {
            throw DecodingError.dataCorruptedError(
                forKey: .date,
                in: container,
                debugDescription: "Date string does not match format expected by formatter."
            )
        }
        
        losses = CodingKeys.allCases.compactMap { key in
            guard let amount = try? container.decode(Int.self, forKey: key) else {
                return nil
            }
            switch key {
            case .armoredPersonnelCarrier:
                return EquipmentLoss(amount: amount, kind: .armoredPersonnelCarrier)
            case .fieldArtillery:
                return EquipmentLoss(amount: amount, kind: .fieldArtillery)
            case .multipleRocketLauncher:
                return EquipmentLoss(amount: amount, kind: .multipleRocketLauncher)
            case .militaryAuto:
                return EquipmentLoss(amount: amount, kind: .militaryAuto)
            case .fuelTank:
                return EquipmentLoss(amount: amount, kind: .fuelTank)
            case .navalShip:
                return EquipmentLoss(amount: amount, kind: .navalShip)
            case .antiAircraftWarfare:
                return EquipmentLoss(amount: amount, kind: .antiAircraftWarfare)
            case .specialEquipment:
                return EquipmentLoss(amount: amount, kind: .specialEquipment)
            case .mobileSRBMSystem:
                return EquipmentLoss(amount: amount, kind: .mobileSRBMSystem)
            case .aircraft:
                return EquipmentLoss(amount: amount, kind: .aircraft)
            case .helicopter:
                return EquipmentLoss(amount: amount, kind: .helicopter)
            case .tank:
                return EquipmentLoss(amount: amount, kind: .tank)
            case .drone:
                return EquipmentLoss(amount: amount, kind: .drone)
            case .date:
                return nil
            }
        }
    }
}
