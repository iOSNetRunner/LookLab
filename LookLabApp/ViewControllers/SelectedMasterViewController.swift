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
        navigationController?.title = master.fullName
        imageMasterView.image = master.masterImageName
        priceLabel.text = master.pricesPerService
        contactLabel.text = master.phone
        experienceLabel.text = master.experience
    }
}
