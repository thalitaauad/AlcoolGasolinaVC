//
//  CalculatorVC.swift
//  AlcoolGasolinaVC
//
//  Created by Thalita Prado Auad on 14/03/23.
//

import UIKit

class CalculatorVC: UIViewController {

    var screen: CalculatorScreen?
    var alert: Alert?
    
    override func loadView() {
        screen = CalculatorScreen() //dando "vida" à screen
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyBoardTappedAround()
        
        alert = Alert(controller: self)//aciona o alert
        screen?.delegate(delegate: self) //assinando protocolo
        view.backgroundColor = .black
    }
    //verifica se tectField foi preenchido
    func validateTextFields() -> Bool {
        
        guard let ethanolPrice = screen?.ethanolPriceTextField.text else { return false }
        guard let gasPrice = screen?.gasPriceTextField.text else { return false }
        
        if ethanolPrice.isEmpty && gasPrice.isEmpty {
            alert?.showAlertInformation(title: "!!!!!", message: "Informe os valores do Álcool e da Gasolina")
            return false
        } else if ethanolPrice.isEmpty {
                alert?.showAlertInformation(title: "!!!!!", message: "Informe o valor do Álcool")
                return false
        } else if gasPrice.isEmpty {
            alert?.showAlertInformation(title: "!!!!!", message: "Informe o valor da Gasolina")
            return false
        }
        
        return true
    }
}

extension CalculatorVC: CalculatorScreenDelegate {
    func tappedCalculateButton() {
    
        if validateTextFields() {

            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal

            let ethanolPrice: Double = (formatter.number(from: screen?.ethanolPriceTextField.text ?? "0.0") as? Double) ?? 0.0
            let gasPrice: Double = (formatter.number(from: screen?.gasPriceTextField.text ?? "0.0") as? Double) ?? 0.0

            var vc: ResultVC? //cria view controller

            if ethanolPrice / gasPrice > 0.7 {
                print("Melhor utilizar gasolina")
                vc = ResultVC(bestFuel: .gas) //passa vc como gas
            } else {
                print("Melhor utilizar álcool")
                vc = ResultVC(bestFuel: .ethanol)//passa vc como ethanol
            }

            navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
        }
    }
    
    func tappedBackButton() {
        navigationController?.popViewController(animated: true) //volta pra tela anterior
    }
}
