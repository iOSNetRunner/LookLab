//
//  WelcomeViewController.swift
//  LookLabApp
//
//  Created by Dmitrii Galatskii on 02.06.2023.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet var mainLogo: UIImageView!
    @IBOutlet var companyNameLabel: UILabel!
    @IBOutlet var enterButton: UIButton!
    
    //MARK: - Private properties
    private let users = User.getUsers()

    //MARK: - View life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.setGradientBackground()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1.9) {
            self.mainLogo.alpha = 0.7
            self.companyNameLabel.alpha = 1
            self.enterButton.alpha = 1
            self.enterButton.tintColor = .white
            self.mainLogo.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            self.companyNameLabel.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            self.enterButton.transform = CGAffineTransform(scaleX: 1.7, y: 1.7)
        }
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let aboutVC = segue.destination as? AboutUsViewController {
            aboutVC.developers = users
        } else if let loginVC = segue.destination as? LoginViewController {
            loginVC.users = users
        }
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
    }
}
