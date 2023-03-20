//
//  ResultVCViewController.swift
//  AlcoolGasolinaVC
//
//  Created by Thalita Prado Auad on 16/03/23.
//

import UIKit

//
enum BestFuel: String {
    case gas = "Gasolina"
    case ethanol = "Álcool"
}

class ResultVC: UIViewController {
    
    var screen: ResultScreen?
    let bestFuel: BestFuel
    
    init(bestFuel: BestFuel) { //construtor para passar resultado
        self.bestFuel = bestFuel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        screen = ResultScreen()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //assinar protocol
        screen?.delegate(delegate: self)
        screen?.resultLabel.text = bestFuel.rawValue //exibe resultado 

    }
    
    func popViewController() {
        navigationController?.popViewController(animated: true) //retorna para tela anterior
        
    }
}

extension ResultVC: ResultScreenDelegate {
    func tappedCalculateButton() {
        popViewController()
    }
    
    func tappedBackButton() {
        popViewController()
    }
    
    
}
