//
//  TabBarController.swift
//  LookLabApp
//
//  Created by Dmitrii Galatskii on 02.06.2023.
//

import UIKit

final class TabBarController: UITabBarController {
    
    private let masters = Master.getMasters()
    var user: [User]!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
