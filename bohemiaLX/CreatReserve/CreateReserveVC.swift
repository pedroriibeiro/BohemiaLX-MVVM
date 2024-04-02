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
        createReserveScreen?.delegate(delegate: self)

    }
    
}

extension CreateReserveVC: CreateReserveScreenProtocol {
    func customNavigation() {
        <#code#>
    }
    
    
}
