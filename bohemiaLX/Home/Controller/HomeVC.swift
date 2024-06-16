//
//  ViewController.swift
//  bohemiaLX
//
//  Created by Pedro Ribeiro on 02/03/2024.
//

import UIKit

class HomeVC: UIViewController {

    private var homeScreen: HomeScreen?
    private var viewModel: HomeViewModel = HomeViewModel()
    
    override func loadView() {
        homeScreen = HomeScreen()
        view = homeScreen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        homeScreen?.delegate(delegate: self)
    }
        
    }
extension HomeVC: HomeScreenProtocol {
    func customNavNext() {
        
        let vc3: PinVC = PinVC()
        navigationController?.pushViewController(vc3, animated: true)
        
        
        let email = homeScreen?.emailTextField.text ?? ""
        let senha = homeScreen?.passwordTextField.text ?? ""
        viewModel.login(email: email, password: senha)
    }
    
    func customNavForgotPass() {
        let vc2: PasswordVC = PasswordVC()
        navigationController?.pushViewController(vc2, animated: true)
    }
    
    func CustomNavRegister() {
        let vc: RegisterVC = RegisterVC()
        navigationController?.pushViewController(vc, animated: true)
     
    }
    
}
