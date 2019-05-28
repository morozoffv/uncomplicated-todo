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
    
    private var completeAction: (() -> Void)?
    
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
        nameLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        nameLabel.textColor = Colors.primaryColor
        completeButton.addTarget(self, action: #selector(completeButtonTapped), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        priorityImage.activateConstraints([
            priorityImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            priorityImage.trailingAnchor.constraint(equalTo: nameLabel.leadingAnchor, constant: -12),
            priorityImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            priorityImage.widthAnchor.constraint(equalToConstant: 12),
            priorityImage.heightAnchor.constraint(equalToConstant: 12)
        ])
        
        nameLabel.activateConstraints([
            nameLabel.trailingAnchor.constraint(equalTo: completeButton.leadingAnchor, constant: 12),
            nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        completeButton.activateConstraints([
            completeButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            completeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            completeButton.heightAnchor.constraint(equalToConstant: 24),
            completeButton.widthAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    func configure(name: String,
                   priority: Priority,
                   isCompleted: Bool,
                   isOverdue: Bool,
                   completeAction: @escaping () -> Void) {
        
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
        completeButton.isUserInteractionEnabled = !isCompleted
    
        nameLabel.textColor = isOverdue ?
            Colors.primaryColor.withAlphaComponent(0.5) : Colors.primaryColor
        
        self.completeAction = completeAction
    }
    
    @objc private func completeButtonTapped() {
        completeAction?()
    }
}
