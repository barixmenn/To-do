//
//  TaskViewController.swift
//  To-do
//
//  Created by Baris on 6.02.2023.
//

import UIKit

class TaskViewController: UIViewController {

    //MARK: - UI Elements
    private lazy var newTaskButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.tintColor = .white
        return button
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()

        // Do any additional setup after loading the view.

    }
}

//MARK: - Helpers
extension TaskViewController {
    private func style() {
        backgroundGradientColor()
        
    }
    private func layout() {
        view.addSubview(newTaskButton)
        NSLayoutConstraint.activate([
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: newTaskButton.bottomAnchor,constant: 35),
            view.trailingAnchor.constraint(equalTo: newTaskButton.trailingAnchor,constant: 10),
            newTaskButton.heightAnchor.constraint(equalToConstant: 60),
            newTaskButton.widthAnchor.constraint(equalToConstant: 60)
        ])
        
    }
}
