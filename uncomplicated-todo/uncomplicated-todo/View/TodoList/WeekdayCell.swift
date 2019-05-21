//
//  WeekdayCell.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 21/05/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import UIKit

class WeekdayCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        customInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customInit()
    }
    
    private func customInit() {

    }
    
    func configure(weekday: String, dayMonth: String, todoNumber: Int) {

    }
}
