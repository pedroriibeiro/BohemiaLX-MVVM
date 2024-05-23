//
//  CreateReserve2VC.swift
//  bohemiaLX
//
//  Created by Pedro Ribeiro on 23/05/2024.
//

import UIKit

class CreateReserve2VC: UIViewController {

    var createReserve2Screen: CreateReserve2Screen?
    
    override func loadView() {
        createReserve2Screen = CreateReserve2Screen()
        view = createReserve2Screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
    }

}
