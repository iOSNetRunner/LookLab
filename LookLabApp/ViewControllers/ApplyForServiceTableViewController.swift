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
        tableView.rowHeight = 60
        tableView.backgroundColor = .systemBrown
        
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        typesOfServices.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "specializationCell") else { return  UITableViewCell()}
        
        let imageShaiving = "free-icon-clipper-3331475"
        let imageHair = "free-icon-haircut-4428089"
        let imageNail = "free-icon-nail-7029463"
        
        
        var content = cell.defaultContentConfiguration()
        content.text = typesOfServices[indexPath.row]
        if typesOfServices[indexPath.item] == "Nail Service" {
            content.image = UIImage(named: imageNail)
        } else if typesOfServices[indexPath.item] == "Shaving" {
            content.image = UIImage(named: imageShaiving)
        } else if typesOfServices[indexPath.item] == "Hair Styling" {
            content.image = UIImage(named: imageHair)
        }
        cell.backgroundColor = .systemBrown
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
    

 
