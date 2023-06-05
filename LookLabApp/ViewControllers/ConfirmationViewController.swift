//
//  ConfirmationViewController.swift
//  LookLabApp
//
//  Created by Dmitrii Galatskii on 02.06.2023.
//

import UIKit

final class ConfirmationViewController: UIViewController {

    @IBOutlet var serviceLabel: UILabel!
    @IBOutlet var masterLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    
    @IBAction var confirmButton: UIButton!
    
    var master: Master!
    var day: String!
    var hour: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        serviceLabel.text = "Service: \(master.typeOfMaster)"
        masterLabel.text = "Master: \(master.fullName)"
        priceLabel.text = "Price: \(master.pricePerService)"
        timeLabel.text = "Time \(dateLine)"
    }
    

}
