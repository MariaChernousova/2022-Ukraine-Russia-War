//
//  HeaderView.swift
//  Ukraine-Russia-War
//
//  Created by Chernousova Maria on 06.07.2022.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    private enum Constant {
        static let titleLabelFontsSize = 16.0
        static let cornerRadius = 10.0
        static let titleLabelInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    private(set) lazy var titleLabel: UILabel = {
        let title = UILabel(frame: .zero)
        title.numberOfLines = .zero
        title.textColor = .mainTextColor
        title.font = .systemFont(ofSize: Constant.titleLabelFontsSize, weight: .bold)
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
        backgroundColor = .headerViewColor
        layer.cornerRadius = Constant.cornerRadius
    }
    
    private func setupAutoLayout() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: Constant.titleLabelInsets.top),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                constant: Constant.titleLabelInsets.left),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constant.titleLabelInsets.bottom),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                 constant: -Constant.titleLabelInsets.right)
        ])
    }
}
