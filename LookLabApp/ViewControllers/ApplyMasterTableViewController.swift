//
//  ApplyMasterTableViewController.swift
//  LookLabApp
//
//  Created by Dmitrii Galatskii on 02.06.2023.
//
import UIKit

final class ApplyMasterTableViewController: UITableViewController {
    
    //MARK: - Private properties
    var masters: [Master]!
    
    //MARK: - View life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 60
        view.backgroundColor = .systemBrown
        enableBarSettings()
        setTablewViewBackgroundToGradient()
    }
    
    //MARK: - Table View Data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        masters.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "masterCell") else { return  UITableViewCell()}
        
        var content = cell.defaultContentConfiguration()
        content.text = masters[indexPath.row].fullName
        
        if masters[indexPath.row].typeOfMaster == "Nail Service" {
            content.image = UIImage(named: "nailService")
        } else if masters[indexPath.row].typeOfMaster == "Shaving" {
            content.image = UIImage(named: "shave")
        } else if masters[indexPath.row].typeOfMaster == "Hair Styling" {
            content.image = UIImage(named: "hairStyle")
        }
        cell.contentConfiguration = content
        
        return cell
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dateAndTimeSelectionVC = segue.destination as? DateTableViewController else { return }
        guard let index = tableView.indexPathForSelectedRow else { return }
        
        let master = masters[index.row]
        
        dateAndTimeSelectionVC.master = master
    }
}
