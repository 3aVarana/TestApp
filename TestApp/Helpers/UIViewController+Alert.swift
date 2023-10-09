//
//  UIViewController+Alert.swift
//  TestApp
//
//  Created by Admin on 10/9/23.
//

import Foundation
import UIKit

extension UIViewController {
    func showErrorAlert(with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
