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
        view.backgroundColor = .red
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
