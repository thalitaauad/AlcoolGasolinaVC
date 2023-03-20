//
//  Alert.swift
//  AlcoolGasolinaVC
//
//  Created by Thalita Prado Auad on 15/03/23.
//

import UIKit
//alerta para quando o user nao inserir dados no textField
class Alert {
    let controller: UIViewController //somente UIViewCotnroller consegue acesar um present
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func showAlertInformation(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "ok", style: .default)
        alertController.addAction(okButton)
        controller.present(alertController, animated: true)
    }
    
}
