//
//  DateSectionView.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 12/05/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import UIKit

class DateSectionView: UIView {
    
    let headerLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.primaryColor
        return label
    }()
    
    let todoCounterLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.secondaryColor
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        label.textColor = Colors.secondaryColor
        return label
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(headerFontSize: CGFloat) {
        self.init()
        self.headerLabel.font = UIFont.systemFont(ofSize: headerFontSize, weight: .bold)
        self.todoCounterLabel.font = UIFont.systemFont(ofSize: headerFontSize, weight: .bold)
    }
    
    private func customInit() {
        backgroundColor = .white
        addSubviews(headerLabel, dateLabel, todoCounterLabel)
        setupConstraints()
    }
    
    private func setupConstraints() {
        headerLabel.activateConstraints([
            headerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            headerLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            headerLabel.trailingAnchor.constraint(equalTo: dateLabel.leadingAnchor, constant: -5)
        ])
        
        dateLabel.activateConstraints([
            dateLabel.lastBaselineAnchor.constraint(equalTo: headerLabel.lastBaselineAnchor)
        ])
        
        todoCounterLabel.activateConstraints([
            todoCounterLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            todoCounterLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
