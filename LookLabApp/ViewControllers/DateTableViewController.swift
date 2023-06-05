//
//  DateTableViewController.swift
//  LookLabApp
//
//  Created by Dmitrii Galatskii on 02.06.2023.
//

import UIKit

final class DateTableViewController: UITableViewController {

    var master: Master!
  
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        master.sessionOptions.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        master.sessionOptions[section].0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        master.sessionOptions[section].1.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dateCell", for: indexPath)

        var content = cell.defaultContentConfiguration()
        let hours = master.sessionOptions[indexPath.section].1
        let selectedHour = hours[indexPath.row]
        content.text = selectedHour
        cell.contentConfiguration = content

        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let checkDetailsVC = segue.destination as? ConfirmationViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        
        let selectedDay = master.sessionOptions[indexPath.section].0
        let selectedHour = master.sessionOptions[indexPath.section].1[indexPath.row]
        
        checkDetailsVC.master = master
        checkDetailsVC.day = selectedDay
        checkDetailsVC.hour = selectedHour
    }
    

}
