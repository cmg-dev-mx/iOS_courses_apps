//
//  ModifyConstraintsViewController.swift
//  AdvancedAutoLayout
//
//  Created by Cesar Morales Garduño on 5/19/24.
//

import UIKit

class ModifyConstraintsViewController: UIViewController {

    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var topConstraints: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        heightConstraint.constant = 300
        topConstraints.constant = 64
    }
}
