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
        setupInfo()
    }
    
    private func setupInfo(){
        imageMasterView.image = UIImage(named: master.masterImageName)
        priceLabel.text = "Price: \(master.pricePerService)"
        contactLabel.text = "Contact: \(master.phone)"
        experienceLabel.text = "Experience: \(master.experience)"
    }
}
