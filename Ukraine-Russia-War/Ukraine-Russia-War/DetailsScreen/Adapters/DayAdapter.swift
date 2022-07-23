//
//  DetailsDateAdapter.swift
//  Ukraine-Russia-War
//
//  Created by Chernousova Maria on 13.07.2022.
//

import Foundation

struct DetailsDateAdapter: Hashable {

    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        return formatter
    }()
    
    let date: String
    let day: String
    
    init(personnel: Personnel) {
        date = DetailsDateAdapter.dateFormatter.string(from: personnel.date)
        day = "\(personnel.day)"
    }
}
