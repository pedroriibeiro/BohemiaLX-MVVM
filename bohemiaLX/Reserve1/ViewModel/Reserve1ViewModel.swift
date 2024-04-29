//
//  Reserve1ViewModel.swift
//  bohemiaLX
//
//  Created by Pedro Ribeiro on 23/04/2024.
//
import Firebase
import UIKit

protocol Reserve1ViewModelProtocol: AnyObject {
  func success()
  func error()
}

class Reserve1ViewModel: NSObject {

  private weak var delegate: Reserve1ViewModelProtocol?

  public func delegate(delegate: Reserve1ViewModelProtocol?) {
    self.delegate = delegate
  }

  var reservation: [Reservation] = []

  func getReserve(selecDate: Date) {

    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .medium
    dateFormatter.timeStyle = .none
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let  dateSelect = dateFormatter.string(from: selecDate)

    let db = Firestore.firestore()
    db.collection("reservations/1/\(dateSelect)").getDocuments(completion: { [weak self] snapshot, error in

      guard let self, let snapshot else {
        print("Não foi possível buscar as informações", error?.localizedDescription ?? "...deu ruim")
        return
      }

      self.reservation = snapshot.documents.map { document in
        let reservations = document.data()

        let name = reservations["name"] as? String ?? ""
        let numberOfPerson = reservations["numberOfPerson"] as? Int ?? 0
        let contato = reservations["contato"] as? String ?? ""
        let date = reservations["date"] as? Date ?? Date()
        return Reservation(name: name,
                           numberOfPerson: numberOfPerson,
                           contact: contato,
                           date: date)
      }
      // AQUI CRIEI O COMPLETION QUE O POLI PEDIU
      if let error {
        delegate?.error()
      } else {
        print("sucesso ao receber dados")
        delegate?.success()
      }
    })


  }

  var numberOfItems: Int {
    reservation.count
  }

  func loadCurrentReserve(indexPath: IndexPath) -> Reservation {
    return reservation[indexPath.row]
  }

}
