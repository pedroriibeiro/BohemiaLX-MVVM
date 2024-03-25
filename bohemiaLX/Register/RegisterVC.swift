//
//  RegisterVCViewController.swift
//  bohemiaLX
//
//  Created by Pedro Ribeiro on 15/03/2024.
//

import UIKit

class RegisterVC: UIViewController {
    
    var registerScreen: RegisterScreen?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func loadView() {
        registerScreen = RegisterScreen()
        view = registerScreen
    }

}


