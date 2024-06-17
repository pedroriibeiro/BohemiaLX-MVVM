//
//  TabBarVC.swift
//  bohemiaLX
//
//  Created by Pedro Ribeiro on 16/06/2024.
//

import UIKit

class TabBarVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSomeTabBarItems()
        
    }
    
    func addSomeTabBarItems() {
        let vc1 = UINavigationController(rootViewController: SelectVC())
        let vc2 = UINavigationController(rootViewController: HomeVC())
        setViewControllers([vc1, vc2], animated: false)
        tabBar.tintColor = .systemBlue
        tabBar.unselectedItemTintColor = .lightGray.withAlphaComponent(0.5)
        tabBar.backgroundColor = .black.withAlphaComponent(0.99)
        
        guard let items = tabBar.items else {return}
        items[0].image = UIImage(systemName: "house.fill")
        items[1].image = UIImage(systemName: "backward.circle.fill")
        items[0].title = "Home"
        items[1].title = "Sair"
    }
    
}

