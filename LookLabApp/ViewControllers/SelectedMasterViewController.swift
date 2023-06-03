//
//  SelectedMasterViewController.swift
//  LookLabApp
//
//  Created by Dmitrii Galatskii on 02.06.2023.
//

import UIKit

final class SelectedMasterViewController: UIViewController {
    
    struct Master {
        let experience: String
        let phone: String
        let masterImageName: UIImage
        let pricesPerService: String
        
        var fullName: String
    }
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
