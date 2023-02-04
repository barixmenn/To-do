//
//  CustomTextField.swift
//  To-do
//
//  Created by Baris on 4.02.2023.
//

import UIKit
class CustomTextField: UITextField {
    init(placeHolder: String) {
        super.init(frame: .zero)
        attributedPlaceholder = NSMutableAttributedString(string: placeHolder, attributes: [.foregroundColor: UIColor.white])
        textColor = .white
        borderStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
