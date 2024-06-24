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
    
//    override func viewWillAppear(_ animated: Bool) {
//        navigationController?.setNavigationBarHidden(true, animated: animated)
//    }
//    
    func loginSuccessful() {
        let vc3: TabBarVC = TabBarVC()
        vc3.modalPresentationStyle = .currentContext
        // MARK: Altera o fluxo de navegação para a select ser a principal
        
        let nav = UINavigationController(rootViewController: vc3)
        nav.modalPresentationStyle = .currentContext
        present(nav, animated: true)
    }
    
    
}
extension HomeVC: HomeScreenProtocol {
    func customWithoutLogin() {
        let vc3: TabBarVC = TabBarVC()
        vc3.modalPresentationStyle = .currentContext
        // MARK: Altera o fluxo de navegação para a select ser a principal
        
        let nav = UINavigationController(rootViewController: vc3)
        nav.modalPresentationStyle = .currentContext
        present(nav, animated: true)
    }
    
    func customNavNext() {
        let email = homeScreen?.emailTextField.text ?? ""
        let senha = homeScreen?.passwordTextField.text ?? ""
        viewModel.logarUsuario(email: email, senha: senha, viewController: self)
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
