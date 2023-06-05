//
//  MasterListViewController.swift
//  LookLabApp
//
//  Created by Dmitrii Galatskii on 02.06.2023.
//

import UIKit

final class MasterListViewController: UITableViewController {
    
    var masters: [Master]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 100
        tableView.backgroundColor = .systemBrown
        
        
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
        content.image = UIImage(named: masters[indexPath.section].masterImageName)
        content.imageProperties.cornerRadius = tableView.rowHeight / 2
        cell.backgroundColor = .systemBrown
                
        return cell
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let contentView = UIView()
        contentView.backgroundColor = .brown
        
        let tableFullname = UILabel(
            frame: CGRect(
                x: 16,
                y: 3,
                width: tableView.frame.width,
                height: 20
            )
        )
        
        tableFullname.text = masters[section].fullName
        tableFullname.font = UIFont.boldSystemFont(ofSize: 17)
        tableFullname.textColor = .white
        contentView.addSubview(tableFullname)
        
        return contentView
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let index = tableView.indexPathForSelectedRow else {return}
        guard let selectMasterVC = segue.destination as? SelectedMasterViewController else {return}
        selectMasterVC.master = masters[index.section]
    }
    
}
