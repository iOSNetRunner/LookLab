import UIKit

final class MasterListViewController: UITableViewController {
    
    //MARK: - Private properties
    var masters: [Master]!
    
    //MARK: - View life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBrown
        enableBarSettings()
        setTablewViewBackgroundToGradient()
        tableView.rowHeight = 100
        tableView.sectionHeaderHeight = 36
    }
    
    //MARK: - Table View Data Source
    override func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numbersOfTypeMaster(section: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "masterNameCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        
        let master = filterMasterOfType(masters: masters, section: indexPath.section)
        
        content.text = master[indexPath.row].fullName
        switch master[indexPath.row].experience {
        case "Trainee":
            content.secondaryText = "⭐️⭐️⭐️"
        case "Master":
            content.secondaryText = "⭐️⭐️⭐️⭐️"
        default:
            content.secondaryText = "⭐️⭐️⭐️⭐️⭐️"
        }
        
        content.image = UIImage(named: master[indexPath.row].masterImageName)
        content.imageProperties.cornerRadius = tableView.rowHeight / 2
        cell.backgroundColor = .clear
        content.textProperties.color = .lightGray
        content.textProperties.font = UIFont.boldSystemFont(ofSize: 17)
        content.secondaryTextProperties.color = .white
        cell.contentConfiguration = content
        
        return cell
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let contentView = UIView()
        contentView.backgroundColor = .systemBrown.withAlphaComponent(0.7)
        
        let tableFullname = UILabel(
            frame: CGRect(
                x: 60,
                y: 6,
                width: 130,
                height: 20
            )
        )
        let tableIcon = UIImageView(frame: CGRect(
            x: 16,
            y: 3,
            width: 30,
            height: 30))
        
        
        switch section {
        case 0:
            tableFullname.text = "Hair Styling"
            tableIcon.image = UIImage(named: "nailService")
            
        case 1:
            tableFullname.text = "Shaving"
            tableIcon.image = UIImage(named: "shave")
        default :  tableFullname.text = "Nail Service"
                tableIcon.image = UIImage(named:"hairStyle")
        }
       
        tableFullname.font = UIFont.boldSystemFont(ofSize: 20)
        tableFullname.textColor = .black
        contentView.addSubview(tableFullname)
        contentView.addSubview(tableIcon)
        
        return contentView
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let index = tableView.indexPathForSelectedRow else {return}
        guard let selectMasterVC = segue.destination as? SelectedMasterViewController else {return}
        switch index.section {
        case 0:
            let master = filterMasterOfType(masters: masters, section: 0)
            selectMasterVC.master = master[index.row]
        case 1:
            let master = filterMasterOfType(masters: masters, section: 1)
            selectMasterVC.master = master[index.row]
        default:
            let master = filterMasterOfType(masters: masters, section: 2)
            selectMasterVC.master = master[index.row]
        }
    }
    
    //MARK: - Background & Bar Settings
    private func setTablewViewBackgroundToGradient() {
        let gradientLayer = CAGradientLayer()
        let gradientBackgroundColors = [UIColor.clear.cgColor,
                                         UIColor.black.cgColor]
        
        gradientLayer.colors = gradientBackgroundColors
        gradientLayer.locations = [0.0, 1.0]
        
        gradientLayer.frame = tableView.bounds
        let backgroundView = UIView(frame: tableView.bounds)
        backgroundView.layer.insertSublayer(gradientLayer, at: 0)
        tableView.backgroundView = backgroundView
    }
    
    private func enableBarSettings() {
        navigationController?.navigationBar.barTintColor = .systemBrown
        
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .black
        
        tabBarController?.tabBar.standardAppearance = appearance
        tabBarController?.tabBar.scrollEdgeAppearance = tabBarController?.tabBar.standardAppearance
    }
    
   // MARK: - Privat func
    private func numbersOfTypeMaster(section: Int ) -> Int {
        var number = 0
        for master in masters {
            if master.typeOfMaster == "Hair Styling" && section == 0 {
               number += 1
            }
            if master.typeOfMaster == "Shaving" && section == 1 {
               number += 1
            }
            if master.typeOfMaster == "Nail Service" && section == 2 {
                number += 1
            }
        }
        return number
    }
    private func filterMasterOfType(masters: [Master], section: Int) -> [Master] {
        var filterMaster: [Master] = []
        for master in masters {
            if master.typeOfMaster == "Hair Styling" && section == 0 {
                filterMaster.append(master)
            }
            if master.typeOfMaster == "Shaving" && section == 1 {
                filterMaster.append(master)
            }
            if master.typeOfMaster == "Nail Service" && section == 2 {
                filterMaster.append(master)
            }
            
        }
        return filterMaster
    }
}
