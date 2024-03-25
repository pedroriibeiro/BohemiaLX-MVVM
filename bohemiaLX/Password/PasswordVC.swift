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
        
        
        
    }
    
    override func loadView() {
        passwordScreen = PasswordScreen()
        view = passwordScreen
    }
 
    }
