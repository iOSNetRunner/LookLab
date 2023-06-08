//
//  SelectedMasterViewController.swift
//  LookLabApp
//
//  Created by Dmitrii Galatskii on 02.06.2023.
//

import UIKit

final class SelectedMasterViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet var imageMasterView: UIImageView!
    @IBOutlet var applyArrowIcon: UIImageView!
    
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var contactLabel: UILabel!
    @IBOutlet var experienceLabel: UILabel!
    
    //MARK: - Public properties
    var master: Master!

    //MARK: - View life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBrown
        view.setGradientBackground()
        setupInfo()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setAnimationForArrow()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        imageMasterView.layer.cornerRadius = imageMasterView.frame.height / 2
    }
    
    //MARK: - Private methods
    private func setupInfo() {
        title = master.fullName
        imageMasterView.image = UIImage(named: master.masterImageName)
        priceLabel.text = "\(master.pricePerService) per hour"
        contactLabel.text = master.phone
        
        switch master.experience {
        case "Trainee":
            experienceLabel.text = "\(master.typeOfMaster) \(master.experience.uppercased())    ⭐️⭐️⭐️"
        case "Master":
            experienceLabel.text = "\(master.typeOfMaster) \(master.experience.uppercased())    ⭐️⭐️⭐️⭐️"
        default:
            experienceLabel.text = "\(master.typeOfMaster) \(master.experience.uppercased())    ⭐️⭐️⭐️⭐️⭐️"
        }
    }
    
    private func setAnimationForArrow() {
        UIView.animate(withDuration: 2.0,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0.2,
                       options: [.repeat, .autoreverse],
                       animations: {
            self.applyArrowIcon.frame = CGRect(x: 275, y: 600, width: 100, height: 100)
        })
    }
}
