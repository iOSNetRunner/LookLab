//
//  TabBarController.swift
//  LookLabApp
//
//  Created by Dmitrii Galatskii on 02.06.2023.
//

import UIKit

final class TabBarController: UITabBarController {
    
    var masters = Master.getMasters()
    
    var appointments: [Appointment] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        transferData()
    }
        
    private func transferData() {
        guard let viewControllers else { return }
        
        for viewController in viewControllers {
            if let navigationVC = viewController as? UINavigationController {
                if let masterListVC = navigationVC.topViewController as? MasterListViewController {
                    masterListVC.masters = masters
                } else if let applyForServiceVC = navigationVC.topViewController as? ApplyForServiceTableViewController {
                    applyForServiceVC.masters = masters
                }
            }
        }
    }
}

protocol ConfirmationViewControllerDelegate: AnyObject {
    func addAppointmetToAppointments(_ appointment: Appointment)
    func removeSesionOptionFrom(_ master: Master, on date: String, at hour: String)
}

extension TabBarController: ConfirmationViewControllerDelegate {
    func addAppointmetToAppointments(_ appointment: Appointment) {
        appointments.append(appointment)
    }
    
    func removeSesionOptionFrom(_ master: Master, on date: String, at hour: String) {
        let sessionOptions = master.sessionOptions
        
        guard let dateIndex = sessionOptions.firstIndex(where: { $0.date == date }) else { return }
        print("dateIndex: \(dateIndex)")
        
        guard let hourIndex = sessionOptions[dateIndex].hours.firstIndex(of: hour) else { return }
        print("hourIndex: \(hourIndex)")
        
        guard let masterIndexInMastersDB = masters.firstIndex(where: { $0.fullName == master.fullName }) else { return }
        print("masterIndex: \(masterIndexInMastersDB)")
        
        let checkBeforeRemove = masters[masterIndexInMastersDB].sessionOptions[dateIndex].hours
        print("Old options for \(date): \(checkBeforeRemove)")
        
        // removing hour from hours
        masters[masterIndexInMastersDB].sessionOptions[dateIndex].hours.remove(at: hourIndex)
        print("Master's session option for \(date) at \(hour) removed")
        
        let checkAfterRemove = masters[masterIndexInMastersDB].sessionOptions[dateIndex].hours
        print("New options for \(date): \(checkAfterRemove)")
        
        if masters[masterIndexInMastersDB].sessionOptions[dateIndex].hours.isEmpty {
            masters[masterIndexInMastersDB].sessionOptions.remove(at: dateIndex)
            print("No options left for \(date)")
        }
        
        if masters[masterIndexInMastersDB].sessionOptions.isEmpty {
            masters.remove(at: masterIndexInMastersDB)
        }
    }
    
}
