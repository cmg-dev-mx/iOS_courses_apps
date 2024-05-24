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
        // Crear alerta
        let alert = UIAlertController(title: "Agregar Pais", message: "Ingresa el nombre del pais", preferredStyle: .alert)

        // Crear y configurar botón de alerta
        let botonAlerta = UIAlertAction(title: "Añadir", style: .default) { (action) in
            // Crear nuevo pais
            let nuevoPais = Pais(context: self.context)
            nuevoPais.nombre = alert.textFields![0].text
            // Guardar pais
            do {
                try self.context.save()
                self.recuperarDatos()
            } catch {
                print("Error guardando datos")
            }
        }

        // Agregar botón a alerta
        alert.addAction(botonAlerta)

        // Agregar campo de texto a alerta
        alert.addTextField { (textField) in
            textField.placeholder = "Nombre del pais"
        }

        // Mostrar alerta
        present(alert, animated: true, completion: nil)
    }

    private func recuperarDatos() {
        do {
            self.myCountries = try context.fetch(Pais.fetchRequest())
            DispatchQueue.main.async {
                self.myTableView.reloadData()
            }
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
