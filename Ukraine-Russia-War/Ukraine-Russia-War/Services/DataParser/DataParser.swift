//
//  DataParser.swift
//  Ukraine-Russia-War
//
//  Created by Chernousova Maria on 05.07.2022.
//

import Foundation

class DataParser: DataParserContext {
    
    func parse<T: Decodable>(from jsonData: Data, of type: T.Type) -> [T]? {
        do {
            let decodedData = try JSONDecoder().decode([T].self, from: jsonData)
            return decodedData
        } catch let error {
            print(error.localizedDescription)
        }
        return nil
    }
}
