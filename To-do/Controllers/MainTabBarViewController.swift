//
//  MainViewController.swift
//  To-do
//
//  Created by Baris on 6.02.2023.
//

import UIKit
import FirebaseAuth

class MainTabBarViewController: UITabBarController {
    //MARK: - UI Elements
    
    let pastTaskViewController = PastTaskViewController()
    let profileViewController = ProfileViewController()
    let taskViewController = TaskViewController()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        userStatus()
        //signOut()
        style()
        fetchUser()
    }
}


//MARK: - Selector

extension MainTabBarViewController {
    private func fetchUser() {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        Service.fecthUser(id: uid) { user in
            self.taskViewController.user = user
        }
    }
}
    
//MARK: - Functios
extension MainTabBarViewController {
    private func userStatus () {
        if Auth.auth().currentUser?.uid == nil {
            print("Kullanıcı yok")
            let navigation = LoginViewController()
            navigation.modalPresentationStyle = .fullScreen
            self.present(navigation, animated: true)
        } else {
            print("Kullanıcı var")
        }
    }
    private func signOut() {
        do {
            try Auth.auth().signOut()
        }catch {
            print("Error: \(error.localizedDescription)")
        }
    }
}


//MARK: - Helpers
extension MainTabBarViewController {
    
    private func style() {
        viewControllers = [configureViewController(rootViewController: pastTaskViewController, title: "Past", image: "clock.badge.checkmark"),
                                         configureViewController(rootViewController: taskViewController, title: "Tasks", image: "checkmark.circle"),
                                         configureViewController(rootViewController: profileViewController, title: "Profile", image: "person.circle")
                      ]
               configureTabBar()
    }
    
    // tab
    private func configureViewController(rootViewController: UIViewController, title: String, image: String)-> UINavigationController{
           let controller = UINavigationController(rootViewController: rootViewController)
           controller.tabBarItem.title = title
           controller.tabBarItem.image = UIImage(systemName: image)
           return controller
       }
    
    private func configureTabBar(){
          let shape = CAShapeLayer()
        let bezier = UIBezierPath(roundedRect: CGRect(x: 10, y: (self.tabBar.bounds.minY) - 17, width: (self.tabBar.bounds.width) - 20, height: (self.tabBar.bounds.height) + 30), cornerRadius: ( (self.tabBar.bounds.height) + 10) / 3)
          shape.path = bezier.cgPath
          shape.fillColor = UIColor.white.cgColor
        self.tabBar.itemPositioning = .fill
          self.tabBar.itemWidth = ((self.tabBar.bounds.width) - 28) / 3
          self.tabBar.tintColor = UIColor.systemBlue.withAlphaComponent(0.4)
          self.tabBar.unselectedItemTintColor = UIColor.lightGray
          self.tabBar.layer.insertSublayer(shape, at: 0)
          selectedIndex = 1
      }
    
}
