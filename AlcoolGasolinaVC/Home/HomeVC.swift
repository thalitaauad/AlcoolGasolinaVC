//
//  ViewController.swift
//  AlcoolGasolinaVC
//
//  Created by Thalita Prado Auad on 14/03/23.
//

import UIKit

class HomeVC: UIViewController {

    var screen: HomeScreen?
    
    override func loadView() { //instanciar a screen e faz view receber screen
        screen = HomeScreen()
        view = screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .black
        screen?.delegate(delegate: self)
    }


}

extension HomeVC: HomeScreenDelegate {
    func tappedStartButton() { //apresenta calculatorVC
        let vc = CalculatorVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
