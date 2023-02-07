//
//  NewsTaskViewController.swift
//  To-do
//
//  Created by Baris on 7.02.2023.
//

import UIKit

class NewsTaskViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        style()
        layout()
    }

}

//MARK: - Helpers

extension NewsTaskViewController {
    private func style() {
        view.layer.backgroundColor = UIColor(red: 0.571, green: 0.310, blue: 0.302, alpha: 1).cgColor

        
    }
    
    private func layout() {
        
    }
}
