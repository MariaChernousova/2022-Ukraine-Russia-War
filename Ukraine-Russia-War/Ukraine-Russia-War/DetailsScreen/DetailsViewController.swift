//
//  DetailsViewController.swift
//  Ukraine-Russia-War
//
//  Created by Chernousova Maria on 08.07.2022.
//

import UIKit

class DetailsViewController: UIViewController {
    
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
        
        viewModel.showErrorAlert = { title, message in
            self.showAlert(title: title, message: message)
        }
    }
    
    private func setupSubviews() {

    }
    
    private func setupAutoLayout() {

    }
    
    private func showAlert(title: String, message: String) {
        let action = UIAlertAction(title: "OK",
                                   style: .cancel)
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        alertController.addAction(action)
        present(alertController, animated: true)
    }
}
