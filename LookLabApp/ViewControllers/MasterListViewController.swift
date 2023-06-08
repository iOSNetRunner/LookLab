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
    }
    
    //MARK: - Table View Data Source
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
        
        switch master.experience {
        case "Trainee":
            content.secondaryText = "\(master.typeOfMaster)\n⭐️⭐️⭐️"
        case "Master":
            content.secondaryText = "\(master.typeOfMaster)\n⭐️⭐️⭐️⭐️"
        default:
            content.secondaryText = "\(master.typeOfMaster)\n⭐️⭐️⭐️⭐️⭐️"
        }
        
        content.image = UIImage(named: masters[indexPath.section].masterImageName)
        content.imageProperties.cornerRadius = tableView.rowHeight / 2
        cell.backgroundColor = .clear
        content.textProperties.color = .lightGray
        content.textProperties.font = UIFont.boldSystemFont(ofSize: 17)
        content.secondaryTextProperties.color = .white
        cell.contentConfiguration = content
        
        return cell
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let index = tableView.indexPathForSelectedRow else {return}
        guard let selectMasterVC = segue.destination as? SelectedMasterViewController else {return}
        selectMasterVC.master = masters[index.section]
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
}
