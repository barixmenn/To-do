//
//  TaskViewController.swift
//  To-do
//
//  Created by Baris on 6.02.2023.
//


//import UIKit
//import FirebaseAuth
//
//
//private let reuseIdentifier = "TaskCell"
//class TaskViewController: UIViewController {
//
//    //MARK: - Properties
//    private var user: User? {
//        didSet { configure() }
//    }
//
//   // private var tasks = [Task]()
//    //MARK: - UI Elements
//    private lazy var newTaskButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setImage(UIImage(systemName: "plus."), for: .normal)
//        button.contentHorizontalAlignment = .fill
//        button.contentVerticalAlignment = .fill
//        button.tintColor = .white
//        return button
//    }()
//
//    private let collectionView: UICollectionView = {
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
//        return collectionView
//    }()
//
//    private let nameLabel:UILabel = {
//        let label = UILabel()
//        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
//        label.textColor = .white
//        label.text = "Hello baris"
//        return label
//    }()
//    //MARK: - Lifecycle
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//        style()
//        layout()
//        fetchUser()
//
//
//    }
//
//}
//
//// MARK: - Service
//extension TaskViewController {
//    private func fetchUser() {
//        guard let uid = Auth.auth().currentUser?.uid else {return}
//        Service.fetchUser(id: uid) { user in
//            self.user = user
//        }
//    }
//}
//
//// MARK: - Helpers
//extension TaskViewController{
//    private func style(){
//        backgroundGradientColor()
//        self.navigationController?.navigationBar.isHidden = true
//        collectionView.register(TaskCell.self, forCellWithReuseIdentifier: reuseIdentifier)
//        self.navigationController?.navigationBar.isHidden = true
//        newTaskButton.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        nameLabel.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        collectionView.backgroundColor = .clear
//
//    }
//    private func layout(){
//        view.addSubview(collectionView)
//        view.addSubview(newTaskButton)
//        view.addSubview(nameLabel)
//
//
//
//        NSLayoutConstraint.activate([
//            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: newTaskButton.bottomAnchor, constant: 30),
//            view.trailingAnchor.constraint(equalTo: newTaskButton.trailingAnchor, constant: 4),
//            newTaskButton.heightAnchor.constraint(equalToConstant: 60),
//            newTaskButton.widthAnchor.constraint(equalToConstant: 60),
//
//            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
//            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
//
//            collectionView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
//            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            view.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor),
//            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 14)
//        ])
//    }
//
//    private func configure() {
//        guard let user = self.user else {return}
//        print("user:\(user.name)")
//    }
//
//}
//
////MARK: - CollectionView
//extension TaskViewController: UICollectionViewDelegate, UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 10
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! TaskCell
//        return cell
//    }
//}
//
//extension TaskViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return .init(width: view.frame.width * 0.9, height: 50)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return .init(width: 15, height: 15)
//    }
//}
//

import UIKit
import FirebaseAuth


private let reuseIdentifier = "TaskCell"
class TaskViewController: UIViewController {
    
    //MARK: - Properties
    private var user: User?{
        didSet{configure()}
    }
    //MARK: - UI Elements
    private lazy var newTaskButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "plus.diamond.fill"), for: .normal)
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.tintColor = .white
        button.addTarget(self, action: #selector(handleNewTaskButton), for: .touchUpInside)
        return button
    }()
    
    private let collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        return collectionView
    }()
    
    private let nameLabel:UILabel = {
         let label = UILabel()
         label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
         label.textColor = .white
         label.text = " "
         return label
     }()
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        style()
        layout()
        fetchUser()
        
    }
    
    
}


//MARK: - Service
extension TaskViewController {
 
    private func fetchUser() {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        Service.fecthUser(id: uid) { user in
            self.user = user
        }
        
    }
}
//MARK: - Selector
extension TaskViewController {
    @objc private func handleNewTaskButton(_ sender: UIButton){
        let controller = NewTaskViewController()
        if let sheet = controller.sheetPresentationController {
            sheet.detents = [.medium()]
        }
        self.present(controller, animated: true)
    }
}

// MARK: - Helpers
extension TaskViewController{
    private func style(){
        backgroundGradientColor()
        self.navigationController?.navigationBar.isHidden = true
        collectionView.register(TaskCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.navigationController?.navigationBar.isHidden = true
        newTaskButton.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        
    }
    private func layout(){
        view.addSubview(collectionView)
        view.addSubview(newTaskButton)
        view.addSubview(nameLabel)
        
        
        
        NSLayoutConstraint.activate([
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: newTaskButton.bottomAnchor, constant: 30),
            view.trailingAnchor.constraint(equalTo: newTaskButton.trailingAnchor, constant: 4),
            newTaskButton.heightAnchor.constraint(equalToConstant: 60),
            newTaskButton.widthAnchor.constraint(equalToConstant: 60),
            
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            
            collectionView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 14)
        ])
    }
    
    private func configure() {
        guard let user = self.user else {return}
        print("user:\(user.name)")
        nameLabel.text = "Hi \(user.name)"
    }
}

//MARK: - CollectionView
extension TaskViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! TaskCell
        
        return cell
    }
    
    
}

extension TaskViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width * 0.9, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: 15, height: 15)
    }
}
