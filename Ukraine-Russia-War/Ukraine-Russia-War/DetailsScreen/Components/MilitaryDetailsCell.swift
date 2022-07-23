//
//  MilitaryDetailsCell.swift
//  Ukraine-Russia-War
//
//  Created by Chernousova Maria on 11.07.2022.
//

import UIKit

protocol MilitaryDetailsDataProvider {
    var imageName: String { get }
    var title: String { get }
    var amount: Int { get }
}

class MilitaryDetailsCell: UITableViewCell {
    
    private enum Constant {
        static let titleLabelFontSize = 14.0
        static let amountLabelFontSize = 16.0
        static let increaseLabelFontSize = 14.0
        static let increaseLabelCornerRadius = 5.0
        static let militaryImageViewSize = 64.0
        static let militaryImageViewInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 0)
        static let titleLabelInsets = UIEdgeInsets(top: 0, left: 11, bottom: 0, right: 11)
        static let amountLabelLeadingAnchor = 11.0
        static let increaseLabelInsets = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    }
    
    private lazy var militaryImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .descriptionTextColor
        label.font = .systemFont(ofSize: Constant.titleLabelFontSize)
        label.numberOfLines = .zero
        return label
    }()
    
    private lazy var amountLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .systemFont(ofSize: Constant.amountLabelFontSize, weight: .semibold)
        label.textColor = .descriptionTextColor
        return label
    }()
    
    private lazy var increaseLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .systemFont(ofSize: Constant.increaseLabelFontSize, weight: .bold)
        label.textColor = .mainTextColor
        label.backgroundColor = .increaseTextColor
        label.layer.cornerRadius = Constant.increaseLabelCornerRadius
        label.clipsToBounds = true
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        militaryImageView.image = nil
        titleLabel.text = nil
        amountLabel.text = nil
        increaseLabel.text = nil
    }
    
    private func commonInit() {
        setupSubviews()
        setupAutoLayout()
    }
    
    private func setupSubviews() {
        contentView.addSubview(militaryImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(amountLabel)
        contentView.addSubview(increaseLabel)
        
        contentView.backgroundColor = .descriptionBackgroundColor
    }
    
    private func setupAutoLayout() {
        militaryImageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        increaseLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            militaryImageView.heightAnchor.constraint(lessThanOrEqualToConstant: Constant.militaryImageViewSize),
            militaryImageView.widthAnchor.constraint(lessThanOrEqualToConstant: Constant.militaryImageViewSize),
            militaryImageView.topAnchor.constraint(equalTo: contentView.topAnchor,
                                                   constant: Constant.militaryImageViewInsets.top),
            militaryImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                       constant: Constant.militaryImageViewInsets.left),
            militaryImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                                      constant: -Constant.militaryImageViewInsets.bottom),
            
            titleLabel.topAnchor.constraint(equalTo: militaryImageView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: militaryImageView.trailingAnchor,
                                                constant: Constant.titleLabelInsets.left),
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor,
                                                 constant: -Constant.titleLabelInsets.right),
            
            amountLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            amountLabel.leadingAnchor.constraint(equalTo: militaryImageView.trailingAnchor,
                                                 constant: Constant.amountLabelLeadingAnchor),
            amountLabel.bottomAnchor.constraint(equalTo: militaryImageView.bottomAnchor),
            
            increaseLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            increaseLabel.leadingAnchor.constraint(equalTo: amountLabel.trailingAnchor,
                                                   constant: Constant.increaseLabelInsets.left),
            increaseLabel.bottomAnchor.constraint(greaterThanOrEqualTo: militaryImageView.bottomAnchor),
            increaseLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor,
                                                    constant: -Constant.increaseLabelInsets.right)
        ])
    }
    
    func configure(data: MilitaryDetailsDataProvider, increase: Int?) {
        militaryImageView.image = UIImage(named: data.imageName)
        titleLabel.text = data.title
        amountLabel.text = "\(data.amount)"
        if let increase = increase {
            increaseLabel.text = " + \(increase) "
        }
    }
}
