//
//  Equipment.swift
//  Ukraine-Russia-War
//
//  Created by Chernousova Maria on 04.07.2022.
//

import Foundation

struct Equipment: Codable {
    
    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        return formatter
    }()
    
    enum CodingKeys: String, CodingKey {
        case armoredPersonnelCarrier = "APC"
        case fieldArtillery = "field artillery"
        case multipleRocketLauncher = "MRL"
        case militaryAuto = "military auto"
        case fuelTank = "fuel tank"
        case navalShip = "naval ship"
        case antiAircraftWarfare = "anti-aircraft warfare"
        case specialEquipment = "special equipment"
        case mobileSRBMSystem = "mobile SRBM system"
        
        case date, day, aircraft, helicopter, tank, drone
    }
    
    let date: Date
    let day: Int
    let aircraft: Int?
    let helicopter: Int?
    let tank: Int?
    let armoredPersonnelCarrier: Int?
    let fieldArtillery: Int?
    let multipleRocketLauncher: Int?
    let militaryAuto: Int?
    let fuelTank: Int?
    let drone: Int?
    let navalShip: Int?
    let antiAircraftWarfare: Int?
    let specialEquipment: Int?
    let mobileSRBMSystem: Int?

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        var dayValue: Int = 0
        
        if let day = try? container.decode(Int.self, forKey: .day) {
            dayValue = day
        } else if let day = try? container.decode(String.self, forKey: .day) {
            dayValue = Int(day) ?? 0
        }
        
        let date = try container.decode(String.self, forKey: .date)
        self.date = Equipment.dateFormatter.date(from: date) ?? Date()
        self.day = dayValue
        self.aircraft = try? container.decode(Int.self, forKey: .aircraft)
        self.helicopter = try? container.decode(Int.self, forKey: .helicopter)
        self.tank = try? container.decode(Int.self, forKey: .tank)
        self.armoredPersonnelCarrier = try? container.decode(Int.self, forKey: .armoredPersonnelCarrier)
        self.fieldArtillery = try? container.decode(Int.self, forKey: .fieldArtillery)
        self.multipleRocketLauncher = try? container.decode(Int.self, forKey: .multipleRocketLauncher)
        self.militaryAuto = try? container.decode(Int.self, forKey: .militaryAuto)
        self.fuelTank = try? container.decode(Int.self, forKey: .fuelTank)
        self.drone = try? container.decode(Int.self, forKey: .drone)
        self.navalShip = try? container.decode(Int.self, forKey: .navalShip)
        self.antiAircraftWarfare = try? container.decode(Int.self, forKey: .antiAircraftWarfare)
        self.specialEquipment = try? container.decode(Int.self, forKey: .specialEquipment)
        self.mobileSRBMSystem = try? container.decode(Int.self, forKey: .mobileSRBMSystem)
    }
}
