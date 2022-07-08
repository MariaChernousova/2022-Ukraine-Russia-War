//
//  HeaderView.swift
//  Ukraine-Russia-War
//
//  Created by Chernousova Maria on 06.07.2022.
//

import UIKit

class HeaderView: UICollectionReusableView {
    private(set) lazy var titleLabel: UILabel = {
        let title = UILabel(frame: .zero)
        title.numberOfLines = .zero
        return title
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        setupAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupSubviews()
        setupAutoLayout()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
    }
    
    private func setupSubviews() {
        addSubview(titleLabel)
    }
    
    private func setupAutoLayout() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
        ])
    }
}
