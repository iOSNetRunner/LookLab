//
//  MasterListViewController.swift
//  LookLabApp
//
//  Created by Dmitrii Galatskii on 02.06.2023.
//

import UIKit

final class MasterListViewController: UITableViewController {
    struct Master {
        let names: [String]
        let surNames: [String]
        let typeOfMaster: [String]
        let experience: [String]
        let phone: [String]
        let masterImageName: UIImage
        let pricesPerService: [String]
        
        var fullName: String {"\(names) \(surNames)"}
    }
    var master: [Master]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

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
        //selectMasterVC.master = master[index.row]
    }
    

}
