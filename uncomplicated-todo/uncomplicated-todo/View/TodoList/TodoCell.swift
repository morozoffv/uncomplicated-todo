//
//  TodoCell.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 03/05/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import UIKit

class TodoCell: UITableViewCell {
    
    private let nameLabel = UILabel()
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
        addSubviews(nameLabel, priorityImage, completeButton)
        setupConstraints()
        nameLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
    }
    
    private func setupConstraints() {
        priorityImage.activateConstraints([
            priorityImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            priorityImage.trailingAnchor.constraint(equalTo: nameLabel.leadingAnchor, constant: -15),
            priorityImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            priorityImage.widthAnchor.constraint(equalToConstant: 13),
            priorityImage.heightAnchor.constraint(equalToConstant: 13)
            ])
        
        nameLabel.activateConstraints([
            nameLabel.trailingAnchor.constraint(equalTo: completeButton.leadingAnchor, constant: 10),
            nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            ])
        
        completeButton.activateConstraints([
            completeButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            completeButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            completeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            completeButton.heightAnchor.constraint(equalToConstant: 25),
            completeButton.widthAnchor.constraint(equalToConstant: 25)
            ])
    }
    
    func configure(name: String, priority: Priority, isCompleted: Bool) {
        nameLabel.text = name
        
        switch priority {
        case .low:
            priorityImage.image = #imageLiteral(resourceName: "ic_low_priority")
        case .medium:
            priorityImage.image = #imageLiteral(resourceName: "ic_medium_priority")
        case .high:
            priorityImage.image = #imageLiteral(resourceName: "ic_high_priority")
        }
        completeButton.setImage(isCompleted ? #imageLiteral(resourceName: "ic_checked") : #imageLiteral(resourceName: "ic_unchecked"), for: .normal)
    }
}
