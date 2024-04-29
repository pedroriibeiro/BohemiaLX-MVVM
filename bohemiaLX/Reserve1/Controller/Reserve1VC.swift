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
    view.backgroundColor = UIColor(red: 34/255, green: 44/255, blue: 81/255, alpha: 1.0)
    reserve1Screen?.configProtocolsTableView(delegate: self, dataSource: self)
    reserve1Screen?.delegate(delegate: self)
    reserve1ViewModel.delegate(delegate: self)
    fetchRequest()
  }

  func fetchRequest() {
    reserve1ViewModel.getReserve(selecDate: Date())
  }

}

extension Reserve1VC: Reserve1ViewModelProtocol {
  func success() {
    DispatchQueue.main.async { [weak self] in
      guard let self else { return }
      reserve1Screen?.tableView.reloadData()
    }
  }

  func error() {
    print("deu ruim na busca")
  }
}

extension Reserve1VC: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return reserve1ViewModel.numberOfItems
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as?
    TableViewCell
    cell?.setupHomeCell(data: reserve1ViewModel.loadCurrentReserve(indexPath: indexPath))
    return cell ?? UITableViewCell()
  }

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 120
  }

}

extension Reserve1VC: Reserve1ScreenProtocol {
  func customNavigation() {
    let vc3: CreateReserveVC = CreateReserveVC()
    vc3.delegate(delegate: self)
    let nav = UINavigationController(rootViewController: vc3)
    present(nav, animated: true)
  }
}

extension Reserve1VC: CreateReserveVCProtocol {
  func refreshRequest() {
    fetchRequest()
  }
}

