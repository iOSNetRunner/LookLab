//
//  AccountViewController.swift
//  LookLabApp
//
//  Created by Dmitrii Galatskii on 02.06.2023.
//

import UIKit

final class AccountViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    
    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradientBackground()
        welcomeLabel.text = "Welcome, \(username ?? "")!"

    }
    

  

}
