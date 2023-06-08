//
//  AccountViewController.swift
//  LookLabApp
//
//  Created by Dmitrii Galatskii on 02.06.2023.
//

import UIKit

final class AccountViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    
    //MARK: - Private properties
    var username: String!
    private var appointments: [Appointment] = []
    
    unowned var delegate: AccountViewControllerDelegate!
    
    //MARK: - View life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.setGradientBackground()
        welcomeLabel.text = "Welcome, \(username ?? "")!"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = false
        updateAppointments()
    }
    
    //MARK: - Navigation
    @IBAction func unwindSuccess(segue: UIStoryboardSegue) {
    }
    
    //MARK: - Private Methods
    private func updateAppointments() {
        guard let tabBarController = tabBarController as? TabBarController else { return }
        appointments = tabBarController.appointments
        tableView.reloadData()
    }
}

//MARK: - Table View Data Source
extension AccountViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        appointments.isEmpty ? 1 : appointments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "appointmentCell") else { return UITableViewCell()}
        
        var content = cell.defaultContentConfiguration()
        let font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        content.textProperties.font = font
        
        if appointments.isEmpty {
            content.text = "You have no appointments.\nYou can arrange one at Apply section."
            cell.contentConfiguration = content
            
            return cell
        } else {
            let appointment = appointments[indexPath.row]
            let service = appointment.master.typeOfMaster
            let date = appointment.dateAndHour.date
            let hour = appointment.dateAndHour.hour
            let masterName = appointment.master.fullName
            let price = appointment.master.pricePerService
            
            let appointmentLine = "\(service.uppercased()) scheduled on: \n\(date) at \(hour) \nMaster: \(masterName.uppercased()) \nPrice: \(price)"
            content.text = appointmentLine
            content.secondaryText = "Tap to remove this reservation"
            content.secondaryTextProperties.color = .systemRed
            content.imageProperties.maximumSize = CGSize(width: 40, height: 40)
            
            switch service {
            case "Shaving":
                content.image = UIImage(named: "shave")
            case "Hair Styling":
                content.image = UIImage(named: "hairStyle")
            default:
                content.image = UIImage(named: "nailService")
            }
            
            cell.contentConfiguration = content
            
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, performPrimaryActionForRowAt indexPath: IndexPath) {
        
        if !appointments.isEmpty {
            presentAlert()
        }
        
        func presentAlert() {
            let alert = UIAlertController(title: "Cancel appointment?", message: "You can reschedule at apply section", preferredStyle: .alert)
            let confirmAction = UIAlertAction(title: "YES", style: .destructive) { _ in
                cancelAppointment()
            }
            let closeAction = UIAlertAction(title: "NO", style: .cancel)
            alert.addAction(closeAction)
            alert.addAction(confirmAction)
            present(alert, animated: true)
        }
        
        func cancelAppointment() {
            guard let tabBarController = tabBarController as? TabBarController else { return }
            
            let appointment = appointments[indexPath.row]
            
            delegate = tabBarController
            delegate.removeAppointmetFromAppointments(appointment)
            delegate.addSesionOptionFor(appointment.master,
                                        on: appointment.dateAndHour.date,
                                        at: appointment.dateAndHour.hour)
            updateAppointments()
            tableView.reloadData()
        }
    }
}
