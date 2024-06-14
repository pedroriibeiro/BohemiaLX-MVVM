//
//  Reserve2VC.swift
//  bohemiaLX
//
//  Created by Pedro Ribeiro on 23/05/2024.
//

import UIKit
import Firebase

class Reserve2VC: UIViewController {
    
    var reserve2Screen: Reserve2Screen?
    var reserve2Model: Reserve2VModel = Reserve2VModel()
    
    override func loadView() {
        reserve2Screen = Reserve2Screen()
        view = reserve2Screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 34/255, green: 44/255, blue: 81/255, alpha: 1.0)
        reserve2Screen?.configProtocolsTableView(delegate: self, dataSource: self)
        reserve2Screen?.delegate(delegate: self)
        reserve2Model.delegate(delegate: self)
        fetchRequest()
    }
    
    func fetchRequest() {
        reserve2Model.getReserve()
        TableViewVisibility()
    }
    
    private func TableViewVisibility() {
        reserve2Screen?.tableView.isHidden = reserve2Model.numberOfItems == 0
        reserve2Screen?.emptyAlertLabel.isHidden = reserve2Model.numberOfItems != 0
    }
    
    
}

extension Reserve2VC: Reserve2ModelProtocol {
    func success() {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            reserve2Screen?.configDateLabel(data: reserve2Model.getCurrentDate())
            reserve2Screen?.tableView.reloadData()
            TableViewVisibility()
        }
    }
    
    func error() {
        print("deu ruim na busca")
    }
}

extension Reserve2VC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reserve2Model.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell2.identifier, for: indexPath) as?
        TableViewCell2
        cell?.setupHomeCell(data: reserve2Model.loadCurrentReserve(indexPath: indexPath))
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
                
                
                
                let reservation = self.reserve2Model.reservation[indexPath.row]
                let reservationID = reservation.id
                let date = reservation.date
                
                self.reserve2Model.deleteReservation(reservationID: reservationID, date: date) { result in
                    switch result {
                    case .success:
                        self.reserve2Model.getReserve()
                        
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

extension Reserve2VC: Reserve2ScreenProtocol {
    func customPicker(selectDate: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self else { return }
            reserve2Screen?.configDateLabel(data: reserve2Model.getCurrentDate())
            reserve2Model.getReserve()
            reserve2Screen?.tableView.reloadData()
        }
    }
    
    func customPickerDate(date: Date) {
        reserve2Model.updateDate(date)
    }
    
    func customNavigation() {
        let vc: CreateReserve2VC = CreateReserve2VC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

extension Reserve2VC: CreateReserve2VCProtocol {
    func refreshRequest() {
        fetchRequest()
        reserve2Screen?.tableView.reloadData()
    }
    
   
}
