//
//  ApplyForServiceTableViewController.swift
//  LookLabApp
//
//  Created by Dmitrii Galatskii on 02.06.2023.
//

import UIKit

final class ApplyForServiceTableViewController: UITableViewController {
    
    //MARK: - Methods
    
    var masters: [Master]!
    let typeOfServece = DataStore.shared.typeOfMaster
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
       
        tableView.dataSource = self
        masters = Master.getMasters() // получаем список мастеров
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        typeOfServece.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "specializationCell", for: indexPath)
       
        var content = cell.defaultContentConfiguration()
        content.text = typeOfServece[indexPath.row]
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Navigation
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let index = tableView.indexPathForSelectedRow else {return}
        guard let applyMasterVC = segue.destination as? ApplyMasterTableViewController else {return}
        
        let filteredMasters = masters.filter { $0.typeOfMaster == typeOfServece[index.row] }
            applyMasterVC.masters = filteredMasters
        }
        
    }
    





