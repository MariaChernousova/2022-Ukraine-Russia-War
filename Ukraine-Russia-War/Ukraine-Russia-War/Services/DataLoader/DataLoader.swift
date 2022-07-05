//
//  DataLoader.swift
//  Ukraine-Russia-War
//
//  Created by Chernousova Maria on 05.07.2022.
//

import Foundation

class DataLoader: DataLoaderContext {
    
    func loadData(for name: String) -> Data? {
        do {
            if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                return data
            }
        } catch let error {
            print(error.localizedDescription)
        }
        return nil
    }
}
