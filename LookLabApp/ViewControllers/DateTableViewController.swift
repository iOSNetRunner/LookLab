//
//  DateTableViewController.swift
//  LookLabApp
//
//  Created by Dmitrii Galatskii on 02.06.2023.
//

import UIKit

final class DateTableViewController: UITableViewController {
    
    var master: Master!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = .clear
        view.backgroundColor = .systemBrown
        view.setGradientBackground()
        navigationController?.navigationBar.barTintColor = .systemBrown
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        master.sessionOptions.count
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let contentView = UIView()
        contentView.backgroundColor = .clear
        let sectionTitle = UILabel(
            frame: CGRect(
                x: 16, y: 3,
                width: tableView.frame.width,
                height: 20)
        )
        sectionTitle.text = master.sessionOptions[section].date
        sectionTitle.font = UIFont.boldSystemFont(ofSize: 17)
        sectionTitle.textColor = .lightGray
        contentView.addSubview(sectionTitle)
        return contentView
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        master.sessionOptions[section].hours.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "dateCell") else { return UITableViewCell() }
        
        var content = cell.defaultContentConfiguration()
        let hours = master.sessionOptions[indexPath.section].hours
        let selectedHour = hours[indexPath.row]
        content.text = selectedHour
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let checkDetailsVC = segue.destination as? ConfirmationViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        
        let selectedDate = master.sessionOptions[indexPath.section].date
        let selectedHour = master.sessionOptions[indexPath.section].hours[indexPath.row]
        
        checkDetailsVC.master = master
        checkDetailsVC.date = selectedDate
        checkDetailsVC.hour = selectedHour
    }
}
