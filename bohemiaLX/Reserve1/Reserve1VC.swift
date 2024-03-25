//
//  Reserve1VC.swift
//  bohemiaLX
//
//  Created by Pedro Ribeiro on 24/03/2024.
//

import UIKit

class Reserve1VC: UIViewController {
    
    var reserve1Screen: Reserve1Screen?
    
    override func loadView() {
        reserve1Screen = Reserve1Screen()
        view = reserve1Screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        
    }
    
}
