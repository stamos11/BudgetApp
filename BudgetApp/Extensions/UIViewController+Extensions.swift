//
//  UIViewController+Extensions.swift
//  BudgetApp
//
//  Created by stamoulis nikolaos on 23/5/24.
//

import Foundation
import UIKit

extension UIViewController {
    
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
    }
}
