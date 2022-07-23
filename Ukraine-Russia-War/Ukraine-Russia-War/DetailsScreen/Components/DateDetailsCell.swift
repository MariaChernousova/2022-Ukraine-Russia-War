//
//  DateDetailsCell.swift
//  Ukraine-Russia-War
//
//  Created by Chernousova Maria on 11.07.2022.
//

import UIKit

protocol DateDetailsDataProvider {
    var date: String { get }
    var day: String { get }
}

class DateDetailsCell: UITableViewCell {
    
    private enum Constant {
        static let dayLabelText = "Day"
        static let dayFontSize = 40.0
        static let dateFontSize = 20.0
        static let stackViewSpacing = 8.0
        static let stackViewInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
    }
    
    private lazy var dayLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = Constant.dayLabelText
        label.font = .systemFont(ofSize: Constant.dayFontSize)
        label.textColor = .descriptionTextColor
        return label
    }()
    
    private lazy var dayNumberLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .systemFont(ofSize: Constant.dayFontSize)
        label.textColor = .descriptionTextColor
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = .systemFont(ofSize: Constant.dateFontSize)
        label.textColor = .descriptionTextColor
        return label
    }()
    
    private lazy var stackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [dayLabel,
                                                      dayNumberLabel,
                                                      dateLabel])
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = Constant.stackViewSpacing
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setupSubviews()
        setupAutoLayout()
    }
    
    private func setupSubviews() {
        contentView.addSubview(stackView)
        contentView.backgroundColor = .descriptionBackgroundColor
    }
    
    private func setupAutoLayout() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor,
                                           constant: Constant.stackViewInsets.top),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                               constant: Constant.stackViewInsets.left),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                              constant: -Constant.stackViewInsets.bottom),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                constant: -Constant.stackViewInsets.right)
        ])
    }
    
    func configure(data: DateDetailsDataProvider) {
        dateLabel.text = data.date
        dayNumberLabel.text = data.day
    }
}
