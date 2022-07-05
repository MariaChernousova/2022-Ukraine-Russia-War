//
//  Personnel.swift
//  Ukraine-Russia-War
//
//  Created by Chernousova Maria on 04.07.2022.
//

import Foundation

struct Personnel: Codable {
    let date: String
    let day: Int
    let personnel: Int
    let prisonerOfWar: Int
    
    enum CodingKeys: String, CodingKey {
        case prisonerOfWar = "POW"
        
        case date, day, personnel
    }
}
