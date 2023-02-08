//
//  TaskCell.swift
//  To-do
//
//  Created by Baris on 8.02.2023.
//

import UIKit

class TaskCell: UICollectionViewCell {
    
    //MARK: - UI Elements
    private lazy var circleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "circle"), for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(handleCircleButton), for: .touchUpInside)
        return button
    }()
    private let taskLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.textColor = .black
        label.text = "Meyve al"
        label.numberOfLines = 0
        return label
    }()
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
// MARK: - Selector
extension TaskCell{
    @objc private func handleCircleButton(_ sender: UIButton){
        UIView.animate(withDuration: 0.5, delay: 0) {
            self.circleButton.alpha = 0
        } completion: { _ in
            UIView.animate(withDuration: 0.5) {
                self.circleButton.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
                self.circleButton.alpha = 1
            }
        }
    }
        
    }
    
    extension TaskCell {
        private func style() {
            circleButton.translatesAutoresizingMaskIntoConstraints = false
            taskLabel.translatesAutoresizingMaskIntoConstraints = false
            backgroundColor = .secondaryLabel
            layer.cornerRadius = 10
            layer.shadowColor = UIColor.black.withAlphaComponent(0.4).cgColor
            layer.shadowOffset = CGSize(width: 0, height: 3)
            layer.shadowOpacity = 5
        }
        
        private func  layout() {
            
            addSubview(circleButton)
            addSubview(taskLabel)
            NSLayoutConstraint.activate([
                circleButton.heightAnchor.constraint(equalToConstant: 50),
                circleButton.widthAnchor.constraint(equalToConstant: 50),
                circleButton.centerYAnchor.constraint(equalTo: centerYAnchor),
                circleButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
                
                taskLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
                taskLabel.leadingAnchor.constraint(equalTo: circleButton.trailingAnchor, constant: 8),
                trailingAnchor.constraint(equalTo: taskLabel.trailingAnchor,constant: 8),
                bottomAnchor.constraint(equalTo: taskLabel.bottomAnchor, constant: 8)
            ])
        }
    }
