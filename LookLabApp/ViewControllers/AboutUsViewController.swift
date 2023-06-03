//
//  AboutUsViewController.swift
//  LookLabApp
//
//  Created by Dmitrii Galatskii on 02.06.2023.
//

import UIKit

final class AboutUsViewController: UIViewController {
    
    @IBOutlet var devOne: UILabel!
    @IBOutlet var devTwo: UILabel!
    @IBOutlet var devThree: UILabel!
    @IBOutlet var devFour: UILabel!
    
    var developers: [User]!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDevelopers()
    }

    private func setupDevelopers() {
        for developer in developers {
            switch developer.personName {
            case "Dmitrii": devOne.text = developer.fullName
            case "Egor": devTwo.text = developer.fullName
            case "Fedor": devThree.text = developer.fullName
            default:
                devFour.text = developer.fullName
            }
        }
    }
}
