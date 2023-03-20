//
//  UITextField+Extension.swift
//  AlcoolGasolinaVC
//
//  Created by Thalita Prado Auad on 17/03/23.
//

import Foundation
import UIKit

extension UITextField {
    
    func addDoneButtonOnKeyboard() {
        let doneTooBar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width,  height: 50))
        doneTooBar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done = UIBarButtonItem(title: "Ok", style: .done, target: self, action: #selector(doneButtonAction))
        
        let items = [flexSpace, done]
        doneTooBar.items = items
        doneTooBar.sizeToFit()
        self.inputAccessoryView = doneTooBar
    }
    @objc func doneButtonAction() {
        self.resignFirstResponder()
    }
}
