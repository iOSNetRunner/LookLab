//
//  ApplyMasterTableViewController.swift
//  LookLabApp
//
//  Created by Dmitrii Galatskii on 02.06.2023.
//
import UIKit

final class ApplyMasterTableViewController: UITableViewController {
    
    var masters: [Master]!
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        masters.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "masterCell") else { return  UITableViewCell()}
        
        var content = cell.defaultContentConfiguration()
        content.text = masters[indexPath.row].fullName
        cell.contentConfiguration = content
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let dateAndTimeSelectionVC = segue.destination as? DateTableViewController else { return }
        guard let index = tableView.indexPathForSelectedRow else { return }
        
        let master = masters[index.row]
        
        dateAndTimeSelectionVC.master = master
    }
}
