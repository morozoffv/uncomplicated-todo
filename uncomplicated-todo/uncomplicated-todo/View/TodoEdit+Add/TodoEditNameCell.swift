//
//  TodoEditNameCell.swift
//  uncomplicated-todo
//
//  Created by Vladislav Morozov on 29/05/2019.
//  Copyright © 2019 misshapes. All rights reserved.
//

import UIKit

class TodoEditNameCell: UITableViewCell {
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.tintColor = Colors.primaryColor
        textField.addTarget(self, action: #selector(nameChanged), for: .editingChanged)
        textField.delegate = self
        return textField
    }()
    
    private let separator: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.secondaryColor
        return view
    }()
    
    private(set) var name = Dynamic<String>("")
    private var maxCharacters: Int = .max
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        customInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customInit()
    }
    
    private func customInit() {
        addSubviews(nameTextField, separator)
        setupConstraints()
    }
    
    private func setupConstraints() {
        nameTextField.activateConstraints([
            nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            nameTextField.topAnchor.constraint(equalTo: topAnchor),
            nameTextField.bottomAnchor.constraint(equalTo: bottomAnchor),
            nameTextField.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        separator.activateConstraints([
            separator.leadingAnchor.constraint(equalTo: leadingAnchor),
            separator.trailingAnchor.constraint(equalTo: trailingAnchor),
            separator.bottomAnchor.constraint(equalTo: bottomAnchor),
            separator.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    func configure(name: String, maxCharacters: Int) {
        //TODO: add placeholder from storage
        nameTextField.placeholder = name.isEmpty ? "Name, e.g. \"Do the best\"" : name
        self.maxCharacters = maxCharacters
    }
    
    @objc private func nameChanged() {
        name.value = nameTextField.text ?? ""
    }
    
    override func prepareForReuse() {
        self.prepareForReuse()
        name.bonds = []
    }
}

extension TodoEditNameCell: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = textField.text else { return false }
        
        guard let rangeOfTextToReplace = Range(range, in: textFieldText) else { return false }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        return count <= maxCharacters
    }
}
