//
//  AppError.swift
//  Ukraine-Russia-War
//
//  Created by Chernousova Maria on 05.07.2022.
//

import Foundation

enum AppError: Error {
    case undefined
    case dataNotFound
    case systemError(NSError)
    
    var title: String {
        switch self {
        case .undefined:
            return "Undefined Error"
        case .dataNotFound:
            return "No Data Found Error"
        case .systemError:
            return "System Error"
        }
    }
    
    var description: String {
        switch self {
        case .undefined:
            return "Error cannot be defined."
        case .dataNotFound:
            return "No data found in the database."
        case .systemError:
            return "System reports of an issue."
        }
    }
}
