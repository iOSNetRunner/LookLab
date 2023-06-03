//
//  WelcomeViewController.swift
//  LookLabApp
//
//  Created by Dmitrii Galatskii on 02.06.2023.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    private let users = User.getUsers()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let aboutVC = segue.destination as? AboutUsViewController {
            aboutVC.developers = users
        } else if let loginVC = segue.destination as? LoginViewController {
            loginVC.users = users
        }
    }
}
