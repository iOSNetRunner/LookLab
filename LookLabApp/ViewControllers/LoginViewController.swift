//
//  LoginViewController.swift
//  LookLabApp
//
//  Created by Dmitrii Galatskii on 02.06.2023.
//

import UIKit

final class LoginViewController: UIViewController {
    
    
    @IBOutlet var usernameTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    
    var users: [User]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tabBarController.viewControllers else { return }
        
        for viewController in viewControllers {
            if let accountVC = viewController as? AccountViewController {
                accountVC.users = users
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    
    
    @IBAction func loginButtonTapped() {
        guard usernameTF.text == "11", passwordTF.text == "11" else {
            showAlert(withTitle: "Wrong input",
                      andMessage: "Please, enter correct username and password",
                      textField: passwordTF)
            return
        }
        performSegue(withIdentifier: "toTabBar", sender: nil)
    }
    
    @IBAction func forgotInputData(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(withTitle: "Username reminder", andMessage: "Your username is  !\n 🧐")
        : showAlert(withTitle: "Password reminder", andMessage: "Your password is  !\n 🤔")
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        usernameTF.text = ""
        passwordTF.text = ""
    }
    
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
    
    
    private func showAlert(withTitle title: String, andMessage message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let closeAction = UIAlertAction(title: "Close", style: .destructive) { _ in
            textField?.text = ""
        }
        alert.addAction(closeAction)
        present(alert, animated: true)
    }
  

}
