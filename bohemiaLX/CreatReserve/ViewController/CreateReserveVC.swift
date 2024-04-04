//
//  CreateReserveVC.swift
//  bohemiaLX
//
//  Created by Pedro Ribeiro on 02/04/2024.
//

import UIKit

class CreateReserveVC: UIViewController {

    var createReserveScreen: CreateReserveScreen?
    
    override func loadView() {
        createReserveScreen = CreateReserveScreen()
        view = createReserveScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1.0) /* #343434*/
        createReserveScreen?.delegate(delegate: self)
    }
    
}

extension CreateReserveVC: CreateReserveScreenProtocol {
    
}

