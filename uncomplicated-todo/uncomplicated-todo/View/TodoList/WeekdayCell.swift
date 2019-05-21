//
//  WeekdayCell.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 21/05/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import UIKit

class WeekdayCell: UITableViewCell {
    
    private let view = DateSectionView(headerFontSize: 18)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        customInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customInit()
    }
    
    private func customInit() {
        addSubview(view)
        view.activateConstraints([
            view.leadingAnchor.constraint(equalTo: leadingAnchor),
            view.trailingAnchor.constraint(equalTo: trailingAnchor),
            view.topAnchor.constraint(equalTo: topAnchor),
            view.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configure(weekday: String,
                   dayMonth: String,
                   todoNumber: Int,
                   isOverdue: Bool) {
        
        view.headerLabel.text = weekday
        view.dateLabel.text = dayMonth
        view.todoCounterLabel.text = String(todoNumber)
        view.isOverdue = isOverdue
    }
}
