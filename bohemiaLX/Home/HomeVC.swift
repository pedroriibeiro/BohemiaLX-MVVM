//
//  ViewController.swift
//  bohemiaLX
//
//  Created by Pedro Ribeiro on 02/03/2024.
//

import UIKit

class HomeVC: UIViewController {

    var homeScreen: HomeScreen?
    
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
    func customNavigation3() {
        let vc3: SelectVC = SelectVC()
        vc3.modalPresentationStyle = .currentContext
        // MARK: Altera o fluxo de navegação para a select ser a principal
        let nav = UINavigationController(rootViewController: vc3)
        present(nav, animated: true)
    }
    
    func customNavigation2() {
        let vc2: PasswordVC = PasswordVC()
        navigationController?.pushViewController(vc2, animated: true)
    }
    
    func customNavigation() {
        let vc: RegisterVC = RegisterVC()
        navigationController?.pushViewController(vc, animated: true)
     
    }
    
}
