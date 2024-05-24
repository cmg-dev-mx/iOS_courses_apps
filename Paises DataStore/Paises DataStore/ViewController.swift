//
//  ViewController.swift
//  Paises DataStore
//
//  Created by Cesar Morales Garduño on 5/23/24.
//

import UIKit
// 1. Importar la librería Core Data
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!

    // 2. Referencia al managed object context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    // 3. Cambiar a variable de tipo pais sin datos iniciales
    private var myCountries:[Pais]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.dataSource = self
        myTableView.delegate = self

        // 4. Recuperar datos
        recuperarDatos()
    }
    
    @IBAction func addBtnAction(_ sender: Any) {
        print("Añadir Datos")
    }

    private func recuperarDatos() {
        do {
            self.myCountries = try context.fetch(Pais.fetchRequest())
            myTableView.reloadData()
        } catch {
            print("Error recuperando datos")
        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myCountries!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
            cell?.textLabel?.font = UIFont.systemFont(ofSize: 20)   
        }
        cell!.textLabel?.text = myCountries![indexPath.row].nombre
        return cell!
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Pais: \(myCountries![indexPath.row])")
    }
}
