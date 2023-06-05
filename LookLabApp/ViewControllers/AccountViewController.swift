//
//  AccountViewController.swift
//  LookLabApp
//
//  Created by Dmitrii Galatskii on 02.06.2023.
//

import UIKit

final class AccountViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var noAppointmentsLabel: UILabel!
    
    var username: String!
    var appointments: [Appointment] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.setGradientBackground()
        welcomeLabel.text = "Welcome, \(username ?? "")!"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateAppointments()
    }
    
    
    private func updateAppointments() {
        guard let tabBarController = tabBarController as? TabBarController else { return }
        appointments = tabBarController.appointments
        if appointments.isEmpty {
            tableView.isHidden = true
            noAppointmentsLabel.isHidden = false
        } else {
            tableView.isHidden = false
            noAppointmentsLabel.isHidden = true
        }
        tableView.reloadData()
    }

}

extension AccountViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        appointments.isEmpty ? 1 : appointments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "appointmentCell") else { return UITableViewCell()}
        
        var content = cell.defaultContentConfiguration()
        
        if appointments.isEmpty {
            content.text = "You have no appointments. You can arrange one at Apply section."
            cell.contentConfiguration = content
            
            return cell
        } else {
            let appointment = appointments[indexPath.row]
            let service = appointment.master.typeOfMaster
            let day = appointment.dateAndHour.date
            let hour = appointment.dateAndHour.hour
            let masterName = appointment.master.fullName
            let price = appointment.master.pricePerService
            
            let appointmentLine = "\(service) scheduled on \(day) at \(hour) . Master: \(masterName). Price: \(price)."
            content.text = appointmentLine
            cell.contentConfiguration = content
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
