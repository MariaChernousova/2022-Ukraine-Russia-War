//
//  GridCell.swift
//  Ukraine-Russia-War
//
//  Created by Chernousova Maria on 06.07.2022.
//

import UIKit

class GridCell: UICollectionViewCell {
    
    var tapHandler: (() -> Void)?
    
    private lazy var tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapGestureDidTrigger))
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10)
        return label
    }()
    
    private lazy var dayLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.numberOfLines = .zero
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        setupSubviews()
        setupAutoLayout()
    }
    
    private func setupSubviews() {
        contentView.addGestureRecognizer(tapGestureRecognizer)
        contentView.addSubview(dateLabel)
        contentView.addSubview(dayLabel)
    }
    
    private func setupAutoLayout() {
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dayLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dateLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            dayLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            dayLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 10),
            dayLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    func configure(with date: String, _ day: Int) {
        dateLabel.text = date
        dayLabel.text = "Day \(day)"
    }
    
    @objc private func tapGestureDidTrigger() {
        tapHandler?()
    }
}

