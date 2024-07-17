//
//  HomeViewController.swift
//  FirebaseTutorial
//
//  Created by Cesar Garduno on 7/17/24.
//

import UIKit
import FirebaseAuth

enum ProviderType: String {
    case basic
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

        title = "Inicio"
        emailLabel.text = email
        providerLabel.text = provider.rawValue
    }
    
    @IBAction func logOutAction(_ sender: Any) {
        switch provider {
        case .basic:
            do {
                try Auth.auth().signOut()
                navigationController?.popViewController(animated: true)
            } catch {
                let alertController = UIAlertController(title: "Error", message: "Se ha producido un error cerrando la sesión", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                present(alertController, animated: true, completion: nil)
            }
        }
    }
}
