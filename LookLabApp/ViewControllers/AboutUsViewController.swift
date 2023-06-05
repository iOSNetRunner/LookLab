//
//  AboutUsViewController.swift
//  LookLabApp
//
//  Created by Dmitrii Galatskii on 02.06.2023.
//

import UIKit

final class AboutUsViewController: UIViewController {
    
    @IBOutlet var gearImage: UIImageView!
    
    @IBOutlet var devOne: UILabel!
    @IBOutlet var devTwo: UILabel!
    @IBOutlet var devThree: UILabel!
    @IBOutlet var devFour: UILabel!
    
    var developers: [User]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradientBackground()
        setupDevelopers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        makeAnimation()
    }
    
    private func setupDevelopers() {
        for developer in developers {
            switch developer.personName {
            case "Dmitrii": devOne.text = developer.fullName.uppercased()
            case "Egor": devTwo.text = developer.fullName.uppercased()
            case "Fedor": devThree.text = developer.fullName.uppercased()
            default:
                devFour.text = developer.fullName.uppercased()
            }
        }
    }
    
    private func makeAnimation() {
        UIView.animate(withDuration: 2) {
            self.gearImage.alpha = 0.15
            self.devOne.alpha = 1
            self.devTwo.alpha = 1
            self.devThree.alpha = 1
            self.devFour.alpha = 1
        }
    }
}
