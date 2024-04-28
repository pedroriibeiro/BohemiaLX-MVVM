//
//  SelectVC.swift
//  bohemiaLX
//
//  Created by Pedro Ribeiro on 24/03/2024.
//

import UIKit

class SelectVC: UIViewController {

    var selectScreen: SelectScreen?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 34/255, green: 44/255, blue: 81/255, alpha: 1.0)
        selectScreen?.delegate(delegate: self)
        
    }
    
    override func loadView() {
        selectScreen = SelectScreen()
        view = selectScreen
    }
    
}

extension SelectVC: SelectScreenProtocol {
    func customNavigation() {
        let vc2: Reserve1VC = Reserve1VC()
        navigationController?.pushViewController(vc2, animated: true)
        
    }
    
    
}
