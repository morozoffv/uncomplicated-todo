//
//  TodoCell.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 03/05/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import UIKit

class TodoCell: UITableViewCell {
    
    private let label = UILabel()
    private let completeButton = UIButton()
    private let priorityImage = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        customInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customInit()
    }
    
    private func customInit() {
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        
        NSLayoutConstraint.activate([label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
                                     label.centerYAnchor.constraint(equalTo: self.centerYAnchor)])
    }
    
    func configure(todo: Todo) {
        label.text = todo.name
    }
}
