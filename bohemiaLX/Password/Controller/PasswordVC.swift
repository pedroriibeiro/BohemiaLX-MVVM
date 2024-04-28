//
//  PasswordVC.swift
//  bohemiaLX
//
//  Created by Pedro Ribeiro on 17/03/2024.
//

import UIKit

class PasswordVC: UIViewController {
    
    var passwordScreen: PasswordScreen?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = (UIColor(red: 34/255, green: 44/255, blue: 81/255, alpha: 1.0))
    }
    
    override func loadView() {
        passwordScreen = PasswordScreen()
        view = passwordScreen
    }
 
    }
