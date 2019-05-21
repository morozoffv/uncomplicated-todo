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
        addSubview(nameLabel)
        addSubview(priorityImage)
        addSubview(completeButton)
        
        priorityImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([priorityImage.leadingAnchor.constraint(equalTo: self.leadingAnchor,
                                                                            constant: 10),
                                     priorityImage.trailingAnchor.constraint(equalTo: nameLabel.leadingAnchor,
                                                                             constant: -15),
                                     priorityImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                                     priorityImage.widthAnchor.constraint(equalToConstant: 13),
                                     priorityImage.heightAnchor.constraint(equalToConstant: 13)])

        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([nameLabel.trailingAnchor.constraint(equalTo: completeButton.leadingAnchor,
                                                                         constant: 10),
                                     nameLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)])

        completeButton.anchor(top: self.topAnchor,
                              bottom: self.bottomAnchor,
                              trailing: self.trailingAnchor,
                              padding: UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 10),
                              size: CGSize(width: 25, height: 25))
        
        nameLabel.font = UIFont.systemFont(ofSize: 16, weight: .light)
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
