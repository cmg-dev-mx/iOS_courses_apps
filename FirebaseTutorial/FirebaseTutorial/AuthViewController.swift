//
//  AuthViewController.swift
//  FirebaseTutorial
//
//  Created by Cesar Garduno on 7/17/24.
//

import UIKit
import FirebaseAnalytics
import FirebaseAuth
import FirebaseCore
import GoogleSignIn
import FirebaseRemoteConfig

class AuthViewController: UIViewController {

    @IBOutlet weak var authStackView: UIStackView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var googleButton: UIButton!
    @IBOutlet weak var crashButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Autenticación"
        
        Analytics.logEvent("HomeScreen", parameters: ["message": "Integracion de Firebase completada"])

        // Comprobar la sesión del usuario

        let defaults = UserDefaults.standard
        if let email = defaults.string(forKey: "email"), let provider = defaults.string(forKey: "provider") {
            authStackView.isHidden = true
            navigationController?.pushViewController(HomeViewController(email: email, provider: ProviderType(rawValue: provider)!), animated: false)
        }

        // Configuración de Google Sign In
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config

        // Remote config
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 60

        let remoteConfig = RemoteConfig.remoteConfig()
        remoteConfig.configSettings = settings
        remoteConfig.setDefaults([
            "error_button_text": NSString("Forzar Crash"),
            "show_error_button": NSNumber(true)
        ])
        
        remoteConfig.fetchAndActivate { status, error in
            if status != .error {
                let showButton = remoteConfig["show_error_button"].boolValue
                let buttonText = remoteConfig["error_button_text"].stringValue
                
                DispatchQueue.main.async {
                    self.crashButton.isHidden = !showButton
                    self.crashButton.setTitle(buttonText, for: .normal) 
                }
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        authStackView.isHidden = false
    }

    @IBAction func signUpAction(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                self.showHome(result: result, error: error, provider: .basic)
            }
        }
    }
    
    @IBAction func logInAction(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                self.showHome(result: result, error: error, provider: .basic)
            }
        }
    }
    
    @IBAction func googleAction(_ sender: Any) {
        GIDSignIn.sharedInstance.signOut()
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { result, error in
            if error == nil && result?.user != nil {
                guard let user = result?.user, let idToken = user.idToken?.tokenString else { return }
                
                let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: user.accessToken.tokenString)
                
                Auth.auth().signIn(with: credential) { (result, error) in
                    self.showHome(result: result, error: error, provider: .google)
                }
            }
        }
    }
    
    @IBAction func crashAction(_ sender: Any) {
        fatalError("Crash was triggered")
    }
    
    private func showHome(result: AuthDataResult?, error: Error?, provider: ProviderType) {
        if let result = result, error == nil {
            self.navigationController?.pushViewController(HomeViewController(email: result.user.email!, provider: provider), animated: true)
        } else {
            let alertController = UIAlertController(title: "Error", message: "Se ha producido un error de autenticación mediante \(provider.rawValue)", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }
    }
}
