//
//  Reserve1VC.swift
//  bohemiaLX
//
//  Created by Pedro Ribeiro on 24/03/2024.
//

import UIKit

class Reserve1VC: UIViewController {
    
    var reserve1Screen: Reserve1Screen?
    var reserve1ViewModel: Reserve1ViewModel = Reserve1ViewModel()
    
    override func loadView() {
        reserve1Screen = Reserve1Screen()
        view = reserve1Screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        reserve1Screen?.configProtocolsTableView(delegate: self, dataSource: self)
        reserve1Screen?.delegate(delegate: self)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        reserve1ViewModel.reservation
    }
    
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.reserve1Screen?.tableView.reloadData()
        }
    }
    
}

extension Reserve1VC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(reserve1ViewModel.reservation.count)
        return reserve1ViewModel.reservation.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as?
        TableViewCell
        cell?.setupHomeCell()
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
}

extension Reserve1VC: Reserve1ScreenProtocol {
    func customNavigation() {
        let vc3: CreateReserveVC = CreateReserveVC()
        let nav = UINavigationController(rootViewController: vc3)
        present(nav, animated: true)
    }
    
    
}
