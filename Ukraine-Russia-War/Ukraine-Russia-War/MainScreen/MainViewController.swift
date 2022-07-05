//
//  MainViewController.swift
//  Ukraine-Russia-War
//
//  Created by Chernousova Maria on 04.07.2022.
//

import UIKit

class MainViewController: UIViewController {

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
        view.backgroundColor = .blue
//        DataManager().getData()
//        commonInit()
//        bind()
        
//        viewModel.didLoad()
    }
}

