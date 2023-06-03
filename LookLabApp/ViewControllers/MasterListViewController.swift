//
//  MasterListViewController.swift
//  LookLabApp
//
//  Created by Dmitrii Galatskii on 02.06.2023.
//

import UIKit

final class MasterListViewController: UITableViewController {
    
    var master: [Master]!
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        master.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "masterNameCell", for: indexPath)
        let master = master[indexPath.row]
        var content = cell.defaultContentConfiguration()
       
        content.text = master.fullName
        content.image = master.masterImageName
        
        cell.contentConfiguration = content
        return cell
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let index = tableView.indexPathForSelectedRow else {return}
        guard let selectMasterVC = segue.destination as? SelectedMasterViewController else {return}
        selectMasterVC.master = master[index.row]
    }
    

}
