//
//  TabBarController.swift
//  LookLabApp
//
//  Created by Dmitrii Galatskii on 02.06.2023.
//

import UIKit

final class TabBarController: UITabBarController {
    
    private let masters = Master.getMasters()

    override func viewDidLoad() {
        super.viewDidLoad()
        transferData()
    }
    
    private func transferData() {
        guard let viewControllers else { return }
        
        for viewController in viewControllers {
            if let navigationVC = viewController as? UINavigationController {
                if let masterListVC = navigationVC.topViewController as? MasterListViewController {
//                    masterListVC.masters = masters
                } else if let applyForServiceVC = navigationVC.topViewController as? ApplyForServiceTableViewController {
//                    applyForServiceVC.masters = masters
                }
            }
        }
    }
    
}
