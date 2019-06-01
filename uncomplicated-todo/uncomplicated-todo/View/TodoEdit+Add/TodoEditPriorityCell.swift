//
//  TodoEditPriorityCell.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 29/05/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import Foundation

import UIKit

class TodoEditPriorityCell: UITableViewCell {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Priority"
        label.textColor = Colors.primaryColor
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
    private let highPriorityToggle = PriorityToggle(
        title: "High",
        imageForNotSelected: #imageLiteral(resourceName: "ic_high_priority"),
        imageForSelected: #imageLiteral(resourceName: "ic_high_priority_selected"))
    
    private let mediumPriorityToggle = PriorityToggle(
        title: "Medium",
        imageForNotSelected: #imageLiteral(resourceName: "ic_medium_priority"),
        imageForSelected: #imageLiteral(resourceName: "ic_medium_priority_selected"))
    
    private let lowPriorityToggle = PriorityToggle(
        title: "Low",
        imageForNotSelected: #imageLiteral(resourceName: "ic_low_priority"),
        imageForSelected: #imageLiteral(resourceName: "ic_low_priority_selected"))
    
    private lazy var buttonsStackView: UIStackView = {
        let toggles = [highPriorityToggle, mediumPriorityToggle, lowPriorityToggle]
        
        toggles.forEach { toggle in
            toggle.activateConstraints([
                toggle.heightAnchor.constraint(equalToConstant: 88),
                toggle.widthAnchor.constraint(equalToConstant: 80)
            ])
        }
        
        let stackView = UIStackView(arrangedSubviews: toggles)
        stackView.axis = .horizontal
        return stackView
    }()
    
    private let separator: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.secondaryColor
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
        addSubviews(titleLabel, buttonsStackView, separator)
        setupConstraints()
    }
    
    private func setupConstraints() {
        titleLabel.activateConstraints([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: buttonsStackView.leadingAnchor, constant: -16)
        ])
        
        buttonsStackView.activateConstraints([
            buttonsStackView.heightAnchor.constraint(equalToConstant: 88),
            buttonsStackView.topAnchor.constraint(equalTo: topAnchor),
            buttonsStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            buttonsStackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        separator.activateConstraints([
            separator.leadingAnchor.constraint(equalTo: leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: trailingAnchor),
            separator.heightAnchor.constraint(equalToConstant: 1),
            separator.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configure() {
        
    }
}

private class PriorityToggle: UIView {
    
    private enum Constants {
        static let fontColorForSelected = Colors.secondaryColor
        static let fontColorForNotSelected = Colors.secondaryColor.withAlphaComponent(0.5)
    }
    
    private let priorityImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let priorityTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = Constants.fontColorForNotSelected
        return label
    }()
    
    var isSelected: Bool = false {
        didSet {
            configureForState()
        }
    }
    
    private var imageForNotSelected = UIImage()
    private var imageForSelected = UIImage()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    convenience init(title: String, imageForNotSelected: UIImage, imageForSelected: UIImage) {
        self.init(frame: .zero)
        priorityTitleLabel.text = title
        priorityImageView.image = imageForNotSelected
        self.imageForNotSelected = imageForNotSelected
        self.imageForSelected = imageForSelected
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func customInit() {
        addSubviews(priorityImageView, priorityTitleLabel)
        
        priorityImageView.activateConstraints([
            priorityImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            priorityImageView.centerYAnchor.constraint(equalTo: topAnchor, constant: 30)
        ])
        
        priorityTitleLabel.activateConstraints([
            priorityTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            priorityTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
        
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(toggleTapped)))
    }
    
    private func configureForState() {
        priorityImageView.image = isSelected ? imageForSelected : imageForNotSelected
        
        priorityTitleLabel.textColor = isSelected ?
            Constants.fontColorForSelected : Constants.fontColorForNotSelected
    }
    
    @objc private func toggleTapped() {
        isSelected = !isSelected
    }
}
