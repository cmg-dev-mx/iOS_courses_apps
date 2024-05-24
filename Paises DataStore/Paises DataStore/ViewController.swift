//
//  ViewController.swift
//  Paises DataStore
//
//  Created by Cesar Morales Garduño on 5/23/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!

    private let myCountries = ["Mexico", "USA", "Canada", "Brazil", "Argentina", "Chile", "Colombia", "Peru", "Ecuador", "Bolivia", "Uruguay", "Paraguay", "Venezuela", "Guatemala", "Honduras", "El Salvador", "Nicaragua", "Costa Rica", "Panama", "Cuba", "Puerto Rico", "Republica Dominicana", "Haiti", "Jamaica", "Trinidad y Tobago", "Barbados", "Bahamas", "Belice", "Guyana", "Surinam", "Guyana Francesa"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.dataSource = self
        myTableView.delegate = self
    }
    
    @IBAction func addBtnAction(_ sender: Any) {
        print("Añadir Datos")
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myCountries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
            cell?.textLabel?.font = UIFont.systemFont(ofSize: 20)   
        }
        cell!.textLabel?.text = myCountries[indexPath.row]
        return cell!
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Pais: \(myCountries[indexPath.row])")
    }
}
