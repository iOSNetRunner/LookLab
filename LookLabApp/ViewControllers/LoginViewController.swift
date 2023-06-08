//
//  LoginViewController.swift
//  LookLabApp
//
//  Created by Dmitrii Galatskii on 02.06.2023.
//

import UIKit

final class LoginViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet var usernameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    //MARK: - Public properties
    var users: [User]!
    
    // MARK: - View life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.setGradientBackground()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        for viewController in viewControllers {
            if let accountVC = viewController as? AccountViewController {
                accountVC.username = usernameTF.text
            }
        }
    }
    
    //MARK: - Override Methods
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    //MARK: - IBActions
    @IBAction func loginButtonTapped() {
        guard usernameTF.text != "", passwordTF.text != "" else {
                showAlert(withTitle: "OOPS!", andMessage: "Fields can't be empty!")
                return
        }
        guard usernameTF.text == checkUsername(from: usernameTF.text ?? ""), passwordTF.text == checkPassword(from: passwordTF.text ?? "") else {
            showAlert(withTitle: "Wrong input",
                      andMessage: "Please, enter correct username and password",
                      textField: passwordTF)
            return
        }
        performSegue(withIdentifier: "openAccountVC", sender: nil)
    }
    
    @IBAction func forgotInputData(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(withTitle: "Username reminder", andMessage: "You can use any of these usernames:\n\n \(getUsernames())\n\n 🧐")
        : showAlert(withTitle: "Password reminder", andMessage: "You can use these passwords:\n\n \(getPasswords())\n\n 🤔")
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        usernameTF.text = ""
        passwordTF.text = ""
    }
    
    //MARK: - Private Methods
    private func checkUsername(from input: String) -> String {
        var usernames: [String] = []
        var checkedUsername = ""
        
        for user in users {
            usernames.append(user.username)
        }
        
        if usernames.contains(input) {
            checkedUsername = input
        }
        return checkedUsername
    }
    
    private func checkPassword(from input: String) -> String {
        var passwords: [String] = []
        var checkedPassword = ""
        
        for user in users {
            passwords.append(user.password)
        }
        
        if passwords.contains(input) {
            checkedPassword = input
        }
        
        return checkedPassword
    }
    
    private func getUsernames() -> String {
        var usernames: [String] = []
        for user in users {
            usernames.append(user.username)
        }
        return usernames.joined(separator: "\n\n")
    }
    
    private func getPasswords() -> String {
        var passwords: [String] = []
        for user in users {
            passwords.append(user.password)
        }
        return passwords.joined(separator: "\n\n")
    }
    
    private func showAlert(withTitle title: String, andMessage message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let closeAction = UIAlertAction(title: "Close", style: .destructive) { _ in
            textField?.text = ""
        }
        alert.addAction(closeAction)
        present(alert, animated: true)
    }
}
