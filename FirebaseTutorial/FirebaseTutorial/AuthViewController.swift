//
//  AuthViewController.swift
//  FirebaseTutorial
//
//  Created by Cesar Garduno on 7/17/24.
//

import UIKit
import FirebaseAnalytics
import FirebaseAuth

class AuthViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Autenticación"
        
        Analytics.logEvent("HomeScreen", parameters: ["message": "Integracion de Firebase completada"])
    }

    @IBAction func signUpAction(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                if let result = result, error == nil {
                    self.navigationController?.pushViewController(HomeViewController(email: result.user.email!, provider: .basic), animated: true)
                } else {
                    let alertController = UIAlertController(title: "Error", message: "Se ha producido un error registrando el usuario", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func logInAction(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                if let result = result, error == nil {
                    self.navigationController?.pushViewController(HomeViewController(email: result.user.email!, provider: .basic), animated: true)
                } else {
                    let alertController = UIAlertController(title: "Error", message: "Se ha producido un error accediendo al usuario", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
}

