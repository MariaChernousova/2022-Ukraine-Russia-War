//
//  Personnel.swift
//  Ukraine-Russia-War
//
//  Created by Chernousova Maria on 04.07.2022.
//

import Foundation

struct Personnel: Decodable, Hashable {
    
    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        return formatter
    }()
    
    enum CodingKeys: String, CodingKey {
        case prisonerOfWar = "POW"
        case date, day, personnel
    }
    
    let date: Date
    let day: Int
    let losses: [PersonnelLoss]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let date = try container.decode(String.self, forKey: .date)
        self.date = Personnel.dateFormatter.date(from: date) ?? Date()
        self.day = try container.decode(Int.self, forKey: .day)
        
        let personnelAmount = try container.decode(Int.self, forKey: .personnel)
        let prisonerOfWarAmount = try container.decode(Int.self, forKey: .prisonerOfWar)
        losses = [
            PersonnelLoss(amount: personnelAmount, kind: .personnel),
            PersonnelLoss(amount: prisonerOfWarAmount, kind: .prisonerOfWar)
        ]
    }
}
