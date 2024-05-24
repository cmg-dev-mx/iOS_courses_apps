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

        // 6. Añadir funcionalidad para editar
        let alert = UIAlertController(title: "Editar Pais", message: "Ingresa el nuevo nombre del pais", preferredStyle: .alert)
        alert.addTextField { (textField) in
            textField.text = self.myCountries![indexPath.row].nombre
        }
        let botonEditar = UIAlertAction(title: "Editar", style: .default) { (action) in
            self.myCountries![indexPath.row].nombre = alert.textFields![0].text
            do {
                try self.context.save()
                self.recuperarDatos()
            } catch {
                print("Error editando datos")
            }
        }
        alert.addAction(botonEditar)
        present(alert, animated: true, completion: nil)
    }

    // 5. Añadir funcionalildad de swipe para eliminar
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let accionEliminar = UIContextualAction(style: .destructive, title: "Eliminar") { (action, view, completionHandler) in
            // Eliminar pais
            self.context.delete(self.myCountries![indexPath.row])
            // Guardar cambios
            do {
                try self.context.save()
                self.recuperarDatos()
            } catch {
                print("Error eliminando datos")
            }
        }
        return UISwipeActionsConfiguration(actions: [accionEliminar])
    }
}
