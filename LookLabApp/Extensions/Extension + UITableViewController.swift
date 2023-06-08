//
//  Extension +UITableViewController.swift
//  LookLabApp
//
//  Created by Egor Kruglov on 08.06.2023.
//

import UIKit

extension UITableViewController {
    func setTablewViewBackgroundToGradient() {
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
    
    func enableBarSettings() {
        navigationController?.navigationBar.barTintColor = .systemBrown
        
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .black
        
        tabBarController?.tabBar.standardAppearance = appearance
        tabBarController?.tabBar.scrollEdgeAppearance = tabBarController?.tabBar.standardAppearance
    }
}
