//
//  ViewController.swift
//  App Persistencia
//
//  Created by Cesar Morales Garduño on 5/23/24.
//

import UIKit

class ViewController: UIViewController {

    private let kMyKey = "MY_KEY"   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getAction(_ sender: Any) {
        if let value = UserDefaults.standard.string(forKey: kMyKey) {
            showAlert(message: value)
        } else {
            showAlert(message: "No hay un valor para esta clave")
        }
    }
    
    @IBAction func putAction(_ sender: Any) {
        UserDefaults.standard.set("Hello World", forKey: kMyKey)
        UserDefaults.standard.synchronize()
        showAlert(message: "Hemos guardado un valor")
    }
    
    @IBAction func deleteAction(_ sender: Any) {
        UserDefaults.standard.removeObject(forKey: kMyKey)
        UserDefaults.standard.synchronize()
        showAlert(message: "Hemos borrado un valor")
    }

    private func showAlert(message: String) {
        let alert = UIAlertController(title: "My UserDefaults", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

