//
//  DataParserContext.swift
//  Ukraine-Russia-War
//
//  Created by Chernousova Maria on 05.07.2022.
//

import Foundation

protocol DataParserContext {
    func parse<T:Codable>(from jsonData: Data, of type: T.Type) -> [T]?
}
