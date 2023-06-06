//
//  SuccessApplyViewController.swift
//  LookLabApp
//
//  Created by Dmitrii Galatskii on 02.06.2023.
//

import UIKit

final class SuccessApplyViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet var successIcon: UIImageView!
    
    //MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradientBackground()
        navigationItem.hidesBackButton = true
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.8) {
            self.successIcon.transform = CGAffineTransform(scaleX: 1.8, y: 1.8)
        }
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        navigationController?.popToRootViewController(animated: false)
    }
}
