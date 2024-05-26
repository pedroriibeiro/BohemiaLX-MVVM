//
//  Reserve1VC.swift
//  bohemiaLX
//
//  Created by Pedro Ribeiro on 24/03/2024.
//

import UIKit
import Firebase

class Reserve1VC: UIViewController {
    
    var reserve1Screen: Reserve1Screen?
    var reserve1ViewModel: Reserve1ViewModel = Reserve1ViewModel()
    var createReserveViewModel = CreateReserveViewModel()
    
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
        reserve1ViewModel.getReserve()
    }
    
}

extension Reserve1VC: Reserve1ViewModelProtocol {
    func success() {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            reserve1Screen?.configDateLabel(data: reserve1ViewModel.getCurrentDate())
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
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { [weak self] (_, _, completionHandler) in
            guard let self = self else { return }
            
            let messageAlert = UIAlertController(title: "Excluir reserva", message: "Tem certeza que deseja excluir?", preferredStyle: .alert)
            let cancelDelete = UIAlertAction(title: "Cancelar", style: .cancel, handler: { _ in
                completionHandler(false)
            })
            let confirmAction = UIAlertAction(title: "Confirmar", style: .destructive, handler: { _ in
                
                
                
                let reservation = self.reserve1ViewModel.reservation[indexPath.row]
                let reservationID = reservation.id
                let date = reservation.date
                
                self.reserve1ViewModel.deleteReservation(reservationID: reservationID, date: date) { result in
                    switch result {
                    case .success:
                        self.reserve1ViewModel.getReserve()
                        
                    case .failure(let error):
                        print("Erro ao excluir a reserva:", error)
                    }
                    completionHandler(true)
                }
            })
            
            messageAlert.addAction(cancelDelete)
            messageAlert.addAction(confirmAction)
            
            self.present(messageAlert, animated: true, completion: nil)
            
        }
        let configSwipe = UISwipeActionsConfiguration(actions: [deleteAction])
        configSwipe.performsFirstActionWithFullSwipe = false
        return configSwipe
    }
    
    
    
}

extension Reserve1VC: Reserve1ScreenProtocol {
    func customNavigation() {
        let vc3 = CreateReserveVC()
        vc3.delegate(delegate: self)
        let nav = UINavigationController(rootViewController: vc3)
        present(nav, animated: true)
    }
    
    func customPicker(selectDate: String) {
        // Você pode atualizar a data aqui, se necessário
        // Exemplo: reserve1ViewModel.dataAtual = selectedDate
        
        // Em seguida, recarregue os dados da tabela
        fetchRequest()
        reserve1Screen?.tableView.reloadData()
    }
}
    
    extension Reserve1VC: CreateReserveVCProtocol {
        func refreshRequest() {
            fetchRequest()
        }
    }
    
