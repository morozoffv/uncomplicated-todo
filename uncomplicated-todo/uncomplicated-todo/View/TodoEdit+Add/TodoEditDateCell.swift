//
//  TodoEditDateCell.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 29/05/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import UIKit

class TodoEditDateCell: UITableViewCell {
    
    private enum Constants {
        static let initialDate = Date()
        static let minimumDate = Date()
    }

    private lazy var datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.minimumDate = Constants.minimumDate
        picker.datePickerMode = UIDatePicker.Mode.date
        picker.date = Constants.initialDate
        picker.addTarget(self, action: #selector(datePickerChanged(picker:)), for: .valueChanged)
        return picker
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Date"
        label.textAlignment = .left
        label.textColor = Colors.primaryColor
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.textColor = Colors.secondaryColor
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
    private let middleSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.secondaryColor
        return view
    }()
    
    private let bottomSeparator: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.secondaryColor
        return view
    }()
    
    private let container: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.white
        return view
    }()
    
    private lazy var dateBond = Bond<Date>() { [unowned self] date in
        self.datePicker.date = date
        self.dateLabel.text = date.format()
    }
    
    private(set) var date = Dynamic<Date>(Constants.initialDate)
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        customInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customInit()
    }
    
    private func customInit() {
        dateBond.bind(dynamic: date)
        container.addSubviews(titleLabel, dateLabel, middleSeparator)
        addSubviews(container, datePicker, bottomSeparator)
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        setupContainerConstraints()
        
        datePicker.activateConstraints([
            datePicker.leadingAnchor.constraint(equalTo: leadingAnchor),
            datePicker.trailingAnchor.constraint(equalTo: trailingAnchor),
            datePicker.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
        bottomSeparator.activateConstraints([
            bottomSeparator.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomSeparator.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomSeparator.heightAnchor.constraint(equalToConstant: 1),
            bottomSeparator.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setupContainerConstraints() {
        container.activateConstraints([
            container.leadingAnchor.constraint(equalTo: leadingAnchor),
            container.trailingAnchor.constraint(equalTo: trailingAnchor),
            container.topAnchor.constraint(equalTo: topAnchor),
            container.heightAnchor.constraint(equalToConstant: 44),
            container.bottomAnchor.constraint(equalTo: datePicker.topAnchor)
        ])
        
        titleLabel.activateConstraints([
            titleLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: dateLabel.leadingAnchor, constant: -16),
            titleLabel.centerYAnchor.constraint(equalTo: container.centerYAnchor)
        ])
        
        dateLabel.activateConstraints([
            dateLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -16),
            dateLabel.centerYAnchor.constraint(equalTo: container.centerYAnchor)
        ])
        
        middleSeparator.activateConstraints([
            middleSeparator.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            middleSeparator.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            middleSeparator.heightAnchor.constraint(equalToConstant: 1),
            middleSeparator.bottomAnchor.constraint(equalTo: container.bottomAnchor)
        ])
        
        titleLabel.setContentCompressionResistancePriority(UILayoutPriority(200), for: .horizontal)
        dateLabel.setContentCompressionResistancePriority(UILayoutPriority(800), for: .horizontal)
    }
    
    func configure(initialDate: Date) {
        self.date.value = initialDate
    }
    
    @objc private func datePickerChanged(picker: UIDatePicker) {
        date.value = picker.date
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        date.bonds = []
        dateBond.bind(dynamic: date)
    }
}

private extension Date {
    func format() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        return dateFormatter.string(from: self)
    }
}
