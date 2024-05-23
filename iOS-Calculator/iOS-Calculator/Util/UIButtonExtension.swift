//
//  UIButtonExtension.swift
//  iOS-Calculator
//
//  Created by Cesar Morales Garduño on 5/22/24.
//

import UIKit

private let orange = UIColor(red: 254/255, green: 148/255, blue: 0/255, alpha: 1)

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

    func selectOperation(_ selected: Bool) {
        backgroundColor = selected ? .white : orange
        setTitleColor(selected ? .black : .purple, for: .normal)
    }
}
