//
//  MasterListViewController.swift
//  LookLabApp
//
//  Created by Dmitrii Galatskii on 02.06.2023.
//

import UIKit

final class MasterListViewController: UITableViewController {
    
    var masters: [Master]!
    

    // MARK: - Table view data source

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        masters.count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "masterNameCell", for: indexPath)
        let master = masters[indexPath.section]
        var content = cell.defaultContentConfiguration()
       
        content.text = master.fullName
        content.image = UIImage(named: masters[indexPath.row].masterImageName)
        
        cell.contentConfiguration = content
        return cell
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        masters[section].typeOfMaster
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let index = tableView.indexPathForSelectedRow else {return}
        print(index)
        guard let selectMasterVC = segue.destination as? SelectedMasterViewController else {return}
        selectMasterVC.master = masters[index.section]
    }
    

}
