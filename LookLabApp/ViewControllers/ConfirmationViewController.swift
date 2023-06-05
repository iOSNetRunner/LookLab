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
    
    var master: Master!
    var date: String!
    var hour: String!
    
    unowned var delegate: ConfirmationViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dateLine = "\(date ?? "") at \(hour ?? "")"
        
        serviceLabel.text = "Service: \(master.typeOfMaster)"
        masterLabel.text = "Master: \(master.fullName)"
        priceLabel.text = "Price: \(master.pricePerService)"
        timeLabel.text = "Time: \(dateLine)"
    }
    
    
    @IBAction func confirmButtonPressed() {
        guard let tabBarController = tabBarController as? TabBarController else { return }

        let appointment = Appointment(master: master, dateAndHour: (date, hour))
        
        delegate = tabBarController
        delegate.addAppointmetToAppointments(appointment)
    }
    

}
