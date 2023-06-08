//
//  ApplyForServiceTableViewController.swift
//  LookLabApp
//
//  Created by Dmitrii Galatskii on 02.06.2023.
//

import UIKit

final class ApplyForServiceTableViewController: UITableViewController {
    
    //MARK: - Public properties
    var masters: [Master]!
    
    //MARK: - Private properties
    private var typesOfServices: [String] = []
    
    //MARK: - View life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 60
        view.backgroundColor = .systemBrown
        enableBarSettings()
        setTablewViewBackgroundToGradient()
        setupTypesOfServices()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateMasters()
    }
    
    //MARK: - Table View Data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        typesOfServices.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "specializationCell") else { return  UITableViewCell()}
        
        var content = cell.defaultContentConfiguration()
        content.text = typesOfServices[indexPath.row]
        if typesOfServices[indexPath.row] == "Nail Service" {
            content.image = UIImage(named: "nailService")
        } else if typesOfServices[indexPath.row] == "Shaving" {
            content.image = UIImage(named: "shave")
        } else if typesOfServices[indexPath.row] == "Hair Styling" {
            content.image = UIImage(named: "hairStyle")
        }
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let masterSelectionVC = segue.destination as? ApplyMasterTableViewController else { return }
        guard let index = tableView.indexPathForSelectedRow else { return }
        
        let filteredMasters = masters.filter { $0.typeOfMaster == typesOfServices[index.row] }
        masterSelectionVC.masters = filteredMasters
    }

    //MARK: - Private methods
    private func updateMasters() {
        guard let tabBarController = tabBarController as? TabBarController else { return }
        masters = tabBarController.masters
    }
    
    private func setupTypesOfServices() {
        typesOfServices = Array(Set(masters.map { $0.typeOfMaster }))
    }
}
