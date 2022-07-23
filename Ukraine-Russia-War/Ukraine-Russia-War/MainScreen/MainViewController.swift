//
//  MainViewController.swift
//  Ukraine-Russia-War
//
//  Created by Chernousova Maria on 04.07.2022.
//

import UIKit

class MainViewController: UIViewController {

    private typealias CollectionViewDataSource = UICollectionViewDiffableDataSource<MainSection, Personnel>
    private typealias CollectionViewSnapshot = NSDiffableDataSourceSnapshot<MainSection, Personnel>
    
    private enum Constant {
        static let title = "Date selection"
        static let alertTitile = "OK"
    }
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: applyCollectionViewLayout())
        return collectionView
    }()
    
    private lazy var dataSource = CollectionViewDataSource(collectionView: collectionView) { collectionView, indexPath, personnel in
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GridCell.identifier, for: indexPath) as? GridCell else { return nil }
        cell.configure(with: self.viewModel.formatDate(personnel.date),
                       personnel.day)
        cell.tapHandler = {
            self.viewModel.select(personnel: personnel)
        }
        
        return cell
    }

    private var viewModel: MainViewModelProvider
    
    init(viewModel: MainViewModelProvider) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .mainBackgroundColor
        commonInit()
        bind()
        
        viewModel.didLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barTintColor = UIColor.mainBackgroundColor
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.mainTextColor]
    }
    
    private func commonInit() {
        setupSubviews()
        setupAutoLayout()
    }
    
    private func bind() {
        
        viewModel.updateAction = { [weak dataSource] sections in
            guard let dataSource = dataSource else { return }
            var snapshot = CollectionViewSnapshot()
            snapshot.appendSections(sections.reversed())
            for section in sections.reversed() {
                snapshot.appendItems(section.data, toSection: section)
            }
            dataSource.apply(snapshot)
        }
        
        viewModel.showErrorAlert = { title, message in
            self.showAlert(title: title, message: message)
        }
    }
    
    private func setupSubviews() {
        view.addSubview(collectionView)
        
        navigationItem.title = Constant.title
        
        collectionView.register(GridCell.self, forCellWithReuseIdentifier: GridCell.identifier)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.identifier)
        
        collectionView.dataSource = dataSource
        collectionView.backgroundColor = .mainBackgroundColor
        dataSource.supplementaryViewProvider = provideSupplementaryView
    }
    
    private func setupAutoLayout() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func applyCollectionViewLayout() -> UICollectionViewCompositionalLayout {
        let headerFooterSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .estimated(20)
        )
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: headerFooterSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )

        let spacing: CGFloat = 8
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(1/3))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 3)
        group.interItemSpacing = .fixed(spacing)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: spacing, leading: spacing, bottom: spacing, trailing: spacing)
        section.interGroupSpacing = spacing
        section.boundarySupplementaryItems = [sectionHeader]
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    private func provideSupplementaryView(collectionView: UICollectionView,
                                          elementKind: String,
                                          indexPath: IndexPath) -> UICollectionReusableView {
        guard let headerData = dataSource
            .sectionIdentifier(for: indexPath.section),
              let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderView.identifier, for: indexPath) as? HeaderView else { return UICollectionReusableView() }
        
        header.titleLabel.text = headerData.title
        return header
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
