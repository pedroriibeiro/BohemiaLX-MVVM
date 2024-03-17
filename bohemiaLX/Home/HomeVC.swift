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
    }


}

