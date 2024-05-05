//
//  ViewController.swift
//  Fabrica Automoviles
//
//  Created by Cesar Morales Garduño on 4/30/24.
//

import UIKit

class ViewController: UIViewController {
    
    private var carType: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onClickCreateBasicCarBtn(_ sender: Any) {
        carType = 0
        performSegue(withIdentifier: "DetailVC", sender: self)
    }
    
    @IBAction func onClickCreateMazdaBtn(_ sender: Any) {
        carType = 1
        performSegue(withIdentifier: "DetailVC", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if let detailVC = segue.destination as? DetailViewController {
           detailVC.car = self.carType
       }
    }
}

