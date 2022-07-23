//
//  DataLoaderContext.swift
//  Ukraine-Russia-War
//
//  Created by Chernousova Maria on 05.07.2022.
//

import Foundation

protocol DataLoaderContext {
    func loadData(for name: String) -> Data?
}
