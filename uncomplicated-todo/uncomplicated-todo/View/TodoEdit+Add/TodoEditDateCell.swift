//
//  TodoEditDateCell.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 29/05/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import UIKit

class TodoEditDateCell: UITableViewCell {
    
    private let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.minimumDate = Date()
        picker.datePickerMode = UIDatePicker.Mode.date
        picker.tintColor = Colors.primaryColor
        picker.date = Date()
        picker.addTarget(self, action: #selector(datePickerChanged(picker:)), for: .valueChanged)
        return picker
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.textColor = Colors.primaryColor
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
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

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        customInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customInit()
    }
    
    private func customInit() {
        container.addSubviews(titleLabel, dateLabel, middleSeparator)
        addSubviews(container, datePicker, bottomSeparator)
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        setupContainerConstraints()
        
        datePicker.activateConstraints([
            datePicker.leadingAnchor.constraint(equalTo: leadingAnchor),
            datePicker.trailingAnchor.constraint(equalTo: trailingAnchor),
            datePicker.bottomAnchor.constraint(equalTo: bottomSeparator.topAnchor)
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
            container.bottomAnchor.constraint(equalTo: datePicker.topAnchor)
        ])
        
        titleLabel.activateConstraints([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: dateLabel.leadingAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        dateLabel.activateConstraints([
            dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            dateLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        middleSeparator.activateConstraints([
            bottomSeparator.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomSeparator.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomSeparator.heightAnchor.constraint(equalToConstant: 1),
            bottomSeparator.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configure() {

    }
    
    @objc private func datePickerChanged(picker: UIDatePicker) {
        print(picker.date)
    }
}
