//
//  CreateConstraintsViewController.swift
//  AdvancedAutoLayout
//
//  Created by Cesar Morales Garduño on 5/19/24.
//

import UIKit

class CreateConstraintsViewController: UIViewController {

    @IBOutlet weak var grayView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Constraints de tamaño programáticamente
        grayView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        grayView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        // Constraints de posición programáticamente
        grayView.translatesAutoresizingMaskIntoConstraints = false
        view.addConstraint(
            NSLayoutConstraint(
                item: grayView!, 
                attribute: .leading, 
                relatedBy: .equal, 
                toItem: view, 
                attribute: .leading, 
                multiplier: 1000, 
                constant: 16
            )
        )

        grayView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
    }
}
