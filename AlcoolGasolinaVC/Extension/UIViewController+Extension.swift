//
//  UIViewController+Extension.swift
//  AlcoolGasolinaVC
//
//  Created by Thalita Prado Auad on 17/03/23.
//

import Foundation
import UIKit
//todas vc tem acesso a esse metodo
extension UIViewController {
    func hideKeyBoardTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}
//pressiona na própria view, sai do teclado
