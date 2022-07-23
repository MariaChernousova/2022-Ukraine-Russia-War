//
//  GridCell.swift
//  Ukraine-Russia-War
//
//  Created by Chernousova Maria on 06.07.2022.
//

import UIKit

class GridCell: UICollectionViewCell {
    
    private enum Constant {
        static let dateLabelFontSize = 12.0
        static let dayLabelFontSize = 24.0
        static let stackViewSpacing = 10.0
        static let contentViewCornerRadius = 10.0
        static let stackViewInsets = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }
    
    var tapHandler: (() -> Void)?
    
    private lazy var tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapGestureDidTrigger))
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: Constant.dateLabelFontSize)
        label.textColor = .mainTextColor
        return label
    }()
    
    private lazy var dayLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: Constant.dayLabelFontSize)
        label.numberOfLines = .zero
        label.textColor = .mainTextColor
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [dateLabel, dayLabel])
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = Constant.stackViewSpacing
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func configure(with date: String, _ day: Int) {
        dateLabel.text = date
        dayLabel.text = "Day \n \(day)"
        setGradientBackground()
    }
    
    private func commonInit() {
        setupSubviews()
        setupAutoLayout()
        
    }
    
    private func setupSubviews() {
        contentView.addGestureRecognizer(tapGestureRecognizer)
        contentView.addSubview(stackView)
    }
    
    private func setupAutoLayout() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor,
                                           constant: Constant.stackViewInsets.top),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor,
                                              constant: -Constant.stackViewInsets.bottom)
        ])
    }
    
    private func setGradientBackground() {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.gradientDarkColor.cgColor, UIColor.gradientLightColor.cgColor]
        gradientLayer.locations = [0.2, 1.0]
        gradientLayer.frame = contentView.bounds
        
        contentView.layer.insertSublayer(gradientLayer, at: 0)
        contentView.layer.cornerRadius = Constant.contentViewCornerRadius
        contentView.clipsToBounds = true
    }
    
    @objc private func tapGestureDidTrigger() {
        tapHandler?()
    }
}
