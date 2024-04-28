//
//  RegisterVCViewController.swift
//  bohemiaLX
//
//  Created by Pedro Ribeiro on 15/03/2024.
//

import UIKit

class RegisterVC: UIViewController {
    
    var registerScreen: RegisterScreen?
    private var viewModel: HomeViewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        registerScreen?.delegate(delegate: self)
        view.backgroundColor = (UIColor(red: 34/255, green: 44/255, blue: 81/255, alpha: 1.0))
    }
    
    override func loadView() {
        registerScreen = RegisterScreen()
        view = registerScreen
    }

}

extension RegisterVC: RegisterScreenProtocol {
    func customBody() {
        print("ta ok")
        viewModel.registerUser(email: registerScreen?.emailTextField.text ?? "", password: registerScreen?.passwordTextField.text ?? "")
    }
}

