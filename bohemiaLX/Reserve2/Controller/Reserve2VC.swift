//
//  Reserve2VC.swift
//  bohemiaLX
//
//  Created by Pedro Ribeiro on 23/05/2024.
//

import UIKit

class Reserve2VC: UIViewController {
    
    var reserve2Screen: Reserve2Screen?
   // var reserve2Model = Reserve2Model()
    
    override func loadView() {
        reserve2Screen = Reserve2Screen()
        view = reserve2Screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 34/255, green: 44/255, blue: 81/255, alpha: 1.0)
        reserve2Screen?.configProtocolsTableView(delegate: self, dataSource: self)
        reserve2Screen?.delegate(delegate: self)
    }
    
}

extension Reserve2VC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

extension Reserve2VC: Reserve2ScreenProtocol {
    func customNavigation() {
        let vc: CreateReserve2VC = CreateReserve2VC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
