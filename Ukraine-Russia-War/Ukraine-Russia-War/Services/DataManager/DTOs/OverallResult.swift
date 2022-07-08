//
//  OverallResult.swift
//  Ukraine-Russia-War
//
//  Created by Chernousova Maria on 06.07.2022.
//

import Foundation

struct OverallResult: Codable {
    let date: Date
    let day: Int
    let personnel: Int
    let prisonerOfWar: Int
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
    
    init(personnel: Personnel, equipment: Equipment) {
        self.date = personnel.date
        self.day = personnel.day
        self.personnel = personnel.personnel
        self.prisonerOfWar = personnel.prisonerOfWar
        self.aircraft = equipment.aircraft
        self.helicopter = equipment.helicopter
        self.tank = equipment.tank
        self.armoredPersonnelCarrier = equipment.armoredPersonnelCarrier
        self.fieldArtillery = equipment.fieldArtillery
        self.multipleRocketLauncher = equipment.multipleRocketLauncher
        self.militaryAuto = equipment.militaryAuto
        self.fuelTank = equipment.fuelTank
        self.drone = equipment.drone
        self.navalShip = equipment.navalShip
        self.antiAircraftWarfare = equipment.antiAircraftWarfare
        self.specialEquipment = equipment.specialEquipment
        self.mobileSRBMSystem = equipment.mobileSRBMSystem
    }
}
