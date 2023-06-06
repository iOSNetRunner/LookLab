//
//  ApplyForServiceTableViewController.swift
//  LookLabApp
//
//  Created by Dmitrii Galatskii on 02.06.2023.
//

import UIKit

final class ApplyForServiceTableViewController: UITableViewController {
    
    var masters: [Master]!
    let typesOfServices = DataStore.shared.typeOfMaster
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .clear
        view.backgroundColor = .systemBrown
        view.setGradientBackground()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateMasters()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        typesOfServices.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "specializationCell") else { return  UITableViewCell()}
        
        var content = cell.defaultContentConfiguration()
        content.text = typesOfServices[indexPath.row]
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let masterSelectionVC = segue.destination as? ApplyMasterTableViewController else { return }
        guard let index = tableView.indexPathForSelectedRow else { return }
        
        let filteredMasters = masters.filter { $0.typeOfMaster == typesOfServices[index.row] }
        masterSelectionVC.masters = filteredMasters
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    private func updateMasters() {
        guard let tabBarController = tabBarController as? TabBarController else { return }
        masters = tabBarController.masters
    }
    
}
