//
//  DetailsViewController.swift
//  Ukraine-Russia-War
//
//  Created by Chernousova Maria on 08.07.2022.
//

import UIKit

class DetailsViewController: UIViewController {
    
    private enum Constant {
        static let title = "Estimated losses"
        static let alertTitile = "OK"
    }
    
    private lazy var tableView = UITableView(frame: .zero)
    
    private lazy var dataSource = DetailsDataSource.Source(tableView: tableView) { [weak self] tableView, indexPath, item in
        guard let self = self else { return nil }
        switch item {
        case .date(let data):
            let dayCell = tableView.dequeueReusableCell(withIdentifier: DateDetailsCell.identifier, for: indexPath) as? DateDetailsCell
            dayCell?.configure(data: data)
            return dayCell
        case .personnelLoss(let data, let increase):
            return self.createMilitaryCell(data: data, increase: increase, for: indexPath)
        case .equipmentLoss(let data, let increase):
            return self.createMilitaryCell(data: data, increase: increase, for: indexPath)
        }
    }
    
    private var viewModel: DetailsViewModelProvider
    
    init(viewModel: DetailsViewModelProvider) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        commonInit()
        bind()
        
        viewModel.didLoad()
    }
    
    private func commonInit() {
        setupSubviews()
        setupAutoLayout()
    }
    
    private func bind() {
        
        viewModel.updateAction = { [weak dataSource] result in
            guard let dataSource = dataSource else { return }
            var snapshot = DetailsDataSource.Snapshot()
            snapshot.appendSections([.main])
            snapshot.appendItems(result, toSection: .main)
            dataSource.apply(snapshot)
        }
        
        viewModel.showErrorAlert = { title, message in
            self.showAlert(title: title, message: message)
        }
    }
    
    private func setupSubviews() {
        view.addSubview(tableView)
        
        navigationItem.title = Constant.title
        navigationController?.navigationBar.barTintColor = UIColor.descriptionBackgroundColor
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.descriptionTextColor]
        
        tableView.register(DateDetailsCell.self, forCellReuseIdentifier: DateDetailsCell.identifier)
        tableView.register(MilitaryDetailsCell.self, forCellReuseIdentifier: MilitaryDetailsCell.identifier)
        
        tableView.separatorStyle = .none
        
        tableView.dataSource = dataSource
        tableView.allowsSelection = false
        tableView.backgroundColor = .descriptionBackgroundColor
    }
    
    private func setupAutoLayout() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func createMilitaryCell(data: MilitaryDetailsDataProvider, increase: Int?, for indexPath: IndexPath) -> MilitaryDetailsCell? {
        let militaryCell = tableView.dequeueReusableCell(withIdentifier: MilitaryDetailsCell.identifier, for: indexPath) as? MilitaryDetailsCell
        militaryCell?.configure(data: data, increase: increase)
        return militaryCell
    }
    
    private func showAlert(title: String, message: String) {
        let action = UIAlertAction(title: Constant.alertTitile,
                                   style: .cancel)
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        alertController.addAction(action)
        present(alertController, animated: true)
    }
}
