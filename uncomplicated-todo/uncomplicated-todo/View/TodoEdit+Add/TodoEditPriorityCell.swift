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
    
    private lazy var selectedPriorityBond = Bond<Priority> { priority in
        self.selectedPriority.value = priority
    }
    
    private lazy var priorityControl = PriorityControl()
    
    private(set) var selectedPriority = Dynamic<Priority>(.high)
    
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
        addSubviews(titleLabel, priorityControl, separator)
        setupConstraints()
        selectedPriorityBond.bind(dynamic: priorityControl.selectedPriority)
    }
    
    private func setupConstraints() {
        titleLabel.activateConstraints([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: priorityControl.leadingAnchor, constant: -16)
        ])
        
        priorityControl.activateConstraints([
            priorityControl.heightAnchor.constraint(equalToConstant: 88),
            priorityControl.topAnchor.constraint(equalTo: topAnchor),
            priorityControl.bottomAnchor.constraint(equalTo: bottomAnchor),
            priorityControl.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        separator.activateConstraints([
            separator.leadingAnchor.constraint(equalTo: leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: trailingAnchor),
            separator.heightAnchor.constraint(equalToConstant: 1),
            separator.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configure(priority: Priority) {
        priorityControl.selectedPriority.value = priority
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        selectedPriority.bonds = []
        priorityControl.selectedPriority.bonds = []
    }
}

private class PriorityControl: UIStackView {
    
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
    
    private lazy var selectedPriorityBond = Bond<Priority> { [unowned self] selectedPriority in
        self.changeSelectedPriority(selectedPriority)
    }
    
    var selectedPriority = Dynamic<Priority>(.high)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func customInit() {
        axis = .horizontal
        let toggles = [highPriorityToggle, mediumPriorityToggle, lowPriorityToggle]
        
        toggles.forEach { toggle in
            toggle.activateConstraints([
                toggle.heightAnchor.constraint(equalToConstant: 88),
                toggle.widthAnchor.constraint(equalToConstant: 80)
            ])
            
            addArrangedSubview(toggle)
        }
        
        selectedPriorityBond.bind(dynamic: selectedPriority)
        
        highPriorityToggle.toggleTappedCallback = { [unowned self] in
            self.selectedPriority.value = .high
        }
        
        mediumPriorityToggle.toggleTappedCallback = { [unowned self] in
            self.selectedPriority.value = .medium
        }
        
        lowPriorityToggle.toggleTappedCallback = { [unowned self] in
            self.selectedPriority.value = .low
        }
    }
    
    private func changeSelectedPriority(_ priority: Priority) {
        highPriorityToggle.isSelected = priority == .high
        mediumPriorityToggle.isSelected = priority == .medium
        lowPriorityToggle.isSelected = priority == .low
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
    
    private lazy var tapGestureRecognizer =
        UITapGestureRecognizer(
            target: self,
            action: #selector(toggleTapped))
    
    var isSelected: Bool = false {
        didSet {
            configureForState(isSelected: isSelected)
        }
    }
    
    var toggleTappedCallback: (() -> Void)?
    
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
        setupConstraints()
        addGestureRecognizer(tapGestureRecognizer)
    }
    
    private func setupConstraints() {
        priorityImageView.activateConstraints([
            priorityImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            priorityImageView.centerYAnchor.constraint(equalTo: topAnchor, constant: 30)
        ])
        
        priorityTitleLabel.activateConstraints([
            priorityTitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            priorityTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
    
    private func configureForState(isSelected: Bool) {
        priorityImageView.image = isSelected ? imageForSelected : imageForNotSelected
        
        priorityTitleLabel.textColor = isSelected ?
            Constants.fontColorForSelected : Constants.fontColorForNotSelected
        
        tapGestureRecognizer.isEnabled = !isSelected
    }
    
    @objc private func toggleTapped() {
        isSelected = !isSelected
        toggleTappedCallback?()
    }
}
