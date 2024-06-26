//
//  ViewController.swift
//  TablasColecciones
//
//  Created by Cesar Morales Garduño on 4/27/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!

    private let myContries = ["Mexico", "USA", "Canada", "Brazil", "Argentina", "Chile", "Peru", "Colombia", "Venezuela", "Ecuador", "Bolivia", "Paraguay", "Uruguay"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.dataSource = self
        myTableView.delegate = self

        myTableView.register(UINib(nibName: "MyCustomTableViewCell", bundle: nil), forCellReuseIdentifier: "myCustomCell")
    }
}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Celdas simples"
        } else {
            return "Celdas custom"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myContries.count
    }

    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section == 0 {
            return "Footer para celdas simples"
        } else {
            return "Footer para celdas custom"
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 50
        } else {
            return UITableView.automaticDimension 
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            var cell = tableView.dequeueReusableCell(withIdentifier: "myCell")
            if cell == nil {
                cell = UITableViewCell(style: .default, reuseIdentifier: "myCell")
                cell?.backgroundColor = .gray
                cell?.textLabel?.font = UIFont.systemFont(ofSize: 20)
                cell?.accessoryType = .disclosureIndicator
            }

            cell!.textLabel?.text = myContries[indexPath.row]
            return cell!
        } else {
            let cell = myTableView.dequeueReusableCell(withIdentifier: "myCustomCell", for: indexPath) as? MyCustomTableViewCell
            cell?.myFirstLabel.text = String(indexPath.row + 1)
            cell?.mySecondLabel.text = myContries[indexPath.row]

            if indexPath.row == 2 {
                cell!.mySecondLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ac nunc sed justo lacinia tincidunt. Nullam euismod, nisl a ultrices tincidunt, nunc nunc tincidunt nisl, id tincidunt nunc nisl id nunc. Sed auctor, nisl a ultrices tincidunt, nunc nunc tincidunt nisl, id tincidunt nunc nisl id nunc."
            }

            return cell!
        }
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Seleccionaste el país: \(myContries[indexPath.row])")
    }
}
