//
//  AccountViewController.swift
//  LookLabApp
//
//  Created by Dmitrii Galatskii on 02.06.2023.
//

import UIKit

final class AccountViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    
    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradientBackground()
        welcomeLabel.text = "Welcome, \(username ?? "")!"
        
        getArrangedAppointments()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getArrangedAppointments()
    }
    
    private func getArrangedAppointments() {
        guard let tabBarController = tabBarController as? TabBarController else { return }
        let appointments = tabBarController.appointments
        
        if appointments.isEmpty {
            print(appointments)
        } else {
            appointments.forEach { print($0.master.fullName, $0.dateAndHour) }
        }
    }
  

}
