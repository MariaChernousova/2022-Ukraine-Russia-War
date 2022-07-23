//
//  MainViewModel.swift
//  Ukraine-Russia-War
//
//  Created by Chernousova Maria on 04.07.2022.
//

import Foundation

protocol MainViewModelProvider {
    var updateAction: ([MainSection]) -> Void { get set }
    var showErrorAlert: ( _ title: String, _ message: String) -> Void { get set }
    
    func didLoad()
    func formatDate(_ date: Date) -> String
    func select(personnel: Personnel)
}

class MainViewModel: MainViewModelProvider {
    
    typealias PathHandler = (MainCoordinator.Path) -> Void
    
    private let model: MainModelProvider
    private let pathHandler: PathHandler
    
    private var personnels: [Personnel] = []
    private var sections: [MainSection] = []
    
    var updateAction: ([MainSection]) -> Void = { _ in }
    var showErrorAlert: ( _ title: String, _ message: String) -> Void = { _, _ in }
    
    init(model: MainModelProvider,
         pathHandler: @escaping PathHandler) {
        self.model = model
        self.pathHandler = pathHandler
    }
    
    func didLoad() {
        model.getPersonnelData { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let personnelData):
                self.personnels = personnelData
                self.configureSection(with: personnelData)
                self.updateAction(self.sections)
            case .failure(let error):
                self.handlerError(error)
            }
        }
    }
    
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        return formatter.string(from: date)
    }
    
    func select(personnel: Personnel) {
        guard let currentDayIndex = personnels.firstIndex(of: personnel) else {
            return
        }
        if currentDayIndex == .zero {
            let comparableLoss = ComparableLoss(current: personnel, previous: personnel)
            pathHandler(.description(comparableLoss))
        } else {
            let previousDayPersonnel = personnels[currentDayIndex - 1]
            let comparableLoss = ComparableLoss(current: personnel, previous: previousDayPersonnel)
            pathHandler(.description(comparableLoss))
        }
        
    }
    
    // MARK: - Private methods.
    
    private func configureSection(with personnels: [Personnel]) {
        var weekNumber = 1
        var elements: [Personnel] = []
        var section = MainSection(title: "", data: [])
        
        for index in 0..<personnels.count-1 {
            if personnels[index + 1].date.isInSameWeek(as: personnels[index].date) {
                elements.append(personnels[index])
            } else {
                elements.append(personnels[index])
                section.title = "Week \(weekNumber)"
                section.data = elements
                weekNumber += 1
                elements = []
                self.sections.append(section)
            }
        }
    }
    
    private func handlerError(_ error: AppError) {
        showErrorAlert(error.title, error.description)
    }
}
