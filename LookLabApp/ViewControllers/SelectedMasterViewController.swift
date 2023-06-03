//
//  SelectedMasterViewController.swift
//  LookLabApp
//
//  Created by Dmitrii Galatskii on 02.06.2023.
//

import UIKit

final class SelectedMasterViewController: UIViewController {
    struct Master {
        let names: [String]
        let surNames: [String]
        let typeOfMaster: [String]
        let experience: [String]
        let phone: [String]
        let masterImageName: UIImage
        let pricesPerService: [String]
        
        var fullName: String {"\(names) \(surNames)"}
    }
    var master: [Master]!
    
    @IBOutlet var imageMasterView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
