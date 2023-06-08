//
//  AboutUsViewController.swift
//  LookLabApp
//
//  Created by Dmitrii Galatskii on 02.06.2023.
//

import UIKit

final class AboutUsViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet var gearImage: UIImageView!
    
    @IBOutlet var devOne: UILabel!
    @IBOutlet var devTwo: UILabel!
    @IBOutlet var devThree: UILabel!
    @IBOutlet var devFour: UILabel!
    
    //MARK: - Private properties
    var developers: [User]!
    
    //MARK: - View life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.setGradientBackground()
        setupDevelopers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        makeAnimation()
    }
    
    //MARK: - Private methods
    private func setupDevelopers() {
        for developer in developers {
            switch developer.personName {
            case "Dmitrii": devOne.text = developer.fullName.uppercased()
            case "Egor": devTwo.text = developer.fullName.uppercased()
            case "Fedor": devThree.text = developer.fullName.uppercased()
            case "Roman": devFour.text = developer.fullName.uppercased()
            default:
                print("Hello, Anna")
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
