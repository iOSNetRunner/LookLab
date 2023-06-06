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
        view.backgroundColor = .systemBrown
        view.setGradientBackground()
        
        setupInfo()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        imageMasterView.layer.cornerRadius = imageMasterView.frame.height / 2
    }
    
    private func setupInfo() {
        title = master.fullName
        imageMasterView.image = UIImage(named: master.masterImageName)
        priceLabel.text = "Price: \(master.pricePerService)"
        contactLabel.text = "Contact: \(master.phone)"
        experienceLabel.text = "Experience: \(master.experience)"
    }
}
