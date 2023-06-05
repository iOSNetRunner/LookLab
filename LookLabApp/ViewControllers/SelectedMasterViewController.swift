//
//  SelectedMasterViewController.swift
//  LookLabApp
//
//  Created by Dmitrii Galatskii on 02.06.2023.
//

import UIKit

final class SelectedMasterViewController: UIViewController {
    
    var master: Master!
    
    @IBOutlet var imageMasterView: UIImageView!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var contactLabel: UILabel!
    @IBOutlet var experienceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        view.setGradientBackground()
        setupInfo()
    }
    
    private func setupInfo(){
        title = master.fullName
        imageMasterView.image = UIImage(named: master.masterImageName)
        priceLabel.text = master.pricePerService
        contactLabel.text = master.phone
        experienceLabel.text = master.experience
    }
}
