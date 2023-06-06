//
//  SuccessApplyViewController.swift
//  LookLabApp
//
//  Created by Dmitrii Galatskii on 02.06.2023.
//

import UIKit

final class SuccessApplyViewController: UIViewController {

    @IBOutlet var successIcon: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradientBackground()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.8) {
            self.successIcon.transform = CGAffineTransform(scaleX: 1.8, y: 1.8)
        }
    }
}
