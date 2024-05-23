//
//  UIButtonExtension.swift
//  iOS-Calculator
//
//  Created by Cesar Morales Garduño on 5/22/24.
//

import UIKit

extension UIButton {

    func round() {
        layer.cornerRadius = bounds.height / 2
        clipsToBounds = true
    }

    func shine() {
        UIView.animate(withDuration: 0.1) {
            self.alpha = 0.5
        } completion: { _ in
            UIView.animate(withDuration: 0.1) {
                self.alpha = 1
            }
        }
    }
}