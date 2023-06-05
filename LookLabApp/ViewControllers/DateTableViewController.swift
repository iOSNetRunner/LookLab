//
//  DateTableViewController.swift
//  LookLabApp
//
//  Created by Dmitrii Galatskii on 02.06.2023.
//

import UIKit

final class DateTableViewController: UITableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
    var master: Master!
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        master.sessionOptions[section].date
    
    
        master.sessionOptions[section].date
        master.sessionOptions[section].hours.count
    

        master.sessionOptions[section].hours.count
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var content = cell.defaultContentConfiguration()
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "dateCell") else { return UITableViewCell() }
        
        content.text = selectedHour
        let hours = master.sessionOptions[indexPath.section].hours
        
        return cell
    }
        
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let checkDetailsVC = segue.destination as? ConfirmationViewController else { return }
        
        let selectedDay = master.sessionOptions[indexPath.section].date
        let selectedHour = master.sessionOptions[indexPath.section].hours[indexPath.row]
        
        let selectedDay = master.sessionOptions[indexPath.section].date
        let selectedHour = master.sessionOptions[indexPath.section].hours[indexPath.row]
        checkDetailsVC.hour = selectedHour
    }
        checkDetailsVC.date = selectedDay

}
