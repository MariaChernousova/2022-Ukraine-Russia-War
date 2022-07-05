//
//  MainViewModel.swift
//  Ukraine-Russia-War
//
//  Created by Chernousova Maria on 04.07.2022.
//

import Foundation

protocol MainViewModelProvider {
    
}

class MainViewModel: MainViewModelProvider {
    
    typealias PathHandler = (MainCoordinator.Path) -> Void
    
    private let model: MainModelProvider
    private let pathHandler: PathHandler
    
    init(model: MainModelProvider,
         pathHandler: @escaping PathHandler) {
        self.model = model
        self.pathHandler = pathHandler
    }
    
}
