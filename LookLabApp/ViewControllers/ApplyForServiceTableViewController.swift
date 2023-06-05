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


}
