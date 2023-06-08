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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIView.animate(withDuration: 1) {
            self.successIcon.transform = CGAffineTransform(scaleX: 1.8, y: 1.8)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        navigationController?.popToRootViewController(animated: false)
    }
}
