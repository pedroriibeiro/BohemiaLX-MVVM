//
//  BetaVC.swift
//  bohemiaLX
//
//  Created by Pedro Ribeiro on 21/06/2024.
//

import UIKit

class BetaVC: UIViewController {

    var betaScreen: BetaScreen?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 34/255, green: 44/255, blue: 81/255, alpha: 1.0)
    }
    
    override func loadView() {
        betaScreen = BetaScreen()
        view = betaScreen
    }
 
}
