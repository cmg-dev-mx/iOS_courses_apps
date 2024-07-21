//
//  HomeViewController.swift
//  FirebaseTutorial
//
//  Created by Cesar Garduno on 7/17/24.
//

import UIKit
import FirebaseAuth
import GoogleSignIn

enum ProviderType: String {
    case basic
    case google
}

class HomeViewController: UIViewController {

    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var providerLabel: UILabel!
    @IBOutlet weak var logOutButton: UIButton!

    private let email: String
    private let provider: ProviderType
    
    init(email: String, provider: ProviderType) {
        self.email = email
        self.provider = provider
        
        super.init(nibName: "HomeViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.setHidesBackButton(true, animated: false)

        title = "Inicio"
        emailLabel.text = email
        providerLabel.text = provider.rawValue

        // Guardamos los datos del usuario

        let defaults = UserDefaults.standard
        defaults.set(email, forKey: "email")
        defaults.set(provider.rawValue, forKey: "provider")
        defaults.synchronize()
    }
    
    @IBAction func logOutAction(_ sender: Any) {
        // Borramos los datos del usuario

                let defaults = UserDefaults.standard
                defaults.removeObject(forKey: "email")
                defaults.removeObject(forKey: "provider")
                defaults.synchronize()

        switch provider {
        case .basic: 
            firebaseLogOut()
        case .google: 
            GIDSignIn.sharedInstance.signOut()
            firebaseLogOut()
        }
        navigationController?.popViewController(animated: true)
    }

    private func firebaseLogOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            let alertController = UIAlertController(title: "Error", message: "Se ha producido un error cerrando la sesión", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
            present(alertController, animated: true, completion: nil)
        }
    }
}
