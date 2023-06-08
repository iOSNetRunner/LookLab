//
//  ConfirmationViewController.swift
//  LookLabApp
//
//  Created by Dmitrii Galatskii on 02.06.2023.
//

import UIKit

final class ConfirmationViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet var serviceLabel: UILabel!
    @IBOutlet var masterLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    
    @IBOutlet var labelTypeOfMaster: UIImageView!
    
    //MARK: - Private properties
    var master: Master!
    var date: String!
    var hour: String!
    
    unowned var delegate: ConfirmationViewControllerDelegate!
    
    //MARK: - View life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradientBackground()
        
        let dateLine = "\(date ?? "") at \(hour ?? "")"
        
        serviceLabel.text = "Service: \(master.typeOfMaster)"
        masterLabel.text = "Master: \(master.fullName)"
        priceLabel.text = "Price: \(master.pricePerService)"
        timeLabel.text = "Time: \(dateLine)"
        
        switch master.typeOfMaster {
        case "Shaving":
            labelTypeOfMaster.image = UIImage(named: "shave")
        case "Hair Styling":
            labelTypeOfMaster.image = UIImage(named: "hairStyle")
        default:
            labelTypeOfMaster.image = UIImage(named: "nailService")
        }
    }
    
    //MARK: - IBActions
    @IBAction func confirmButtonPressed() {
        guard let tabBarController = tabBarController as? TabBarController else { return }
        
        let appointment = Appointment(master: master, dateAndHour: (date, hour))
        
        delegate = tabBarController
        delegate.addAppointmetToAppointments(appointment)
        delegate.removeSesionOptionFrom(master, on: date, at: hour)
    }
    
    
}
