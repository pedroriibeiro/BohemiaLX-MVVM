//
//  Reserve2Model.swift
//  bohemiaLX
//
//  Created by Pedro Ribeiro on 23/05/2024.
//

import Firebase
import UIKit

protocol Reserve2ModelProtocol: AnyObject {
    func success()
    func error()
}

class Reserve2VModel: NSObject {
    
    var dataAtual: Date = Date()
    
    private weak var delegate: Reserve2ModelProtocol?
    
    public func delegate(delegate: Reserve2ModelProtocol?) {
        self.delegate = delegate
    }
    
    func deleteReservation(reservationID: String, date: Date, completion: @escaping(Result<Void, Error>) -> Void) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let  selecDate = dateFormatter.string(from: date)
        print(reservationID)
        let db = Firestore.firestore()
        db.collection("reservations/2/\(selecDate)").document(reservationID).delete { error in
            if let error = error {
                print("Não foi possível excluir a reserva:", error)
                completion(.failure(error))
            } else {
                print("Reserva excluída com sucesso")
                
                completion(.success(()))
            }
        }
    }
    
    var reservation: [Reservation] = []
    
    func getCurrentDate() -> String {
        
        return dataAtual.getDateString(format: "dd-MM-yyyy / HH:mm")
        
    }
    
    func getReserve() {
        
        let  dateSelect = dataAtual.getDateString(format: "yyyy-MM-dd")
        
        let db = Firestore.firestore()
        db.collection("reservations/2/\(dateSelect)").getDocuments(completion: { [weak self] snapshot, error in
            
            guard let self, let snapshot else {
                print("Não foi possível buscar as informações", error?.localizedDescription ?? "...deu ruim")
                return
            }
            
            self.reservation = snapshot.documents.map { document in
                let reservations = document.data()
                
                let name = reservations["name"] as? String ?? ""
                let numberOfPerson = reservations["numberOfPerson"] as? Int ?? 0
                let contato = reservations["contato"] as? String ?? ""
                // MARK: Buscar no firebase como acessar uma data/horário
                let date = reservations["date"] as? Timestamp
                
                return Reservation(
                    id: document.documentID,
                    name: name,
                    numberOfPerson: numberOfPerson,
                    contact: contato,
                    date: date?.dateValue() ?? Date())
            }
            // AQUI CRIEI O COMPLETION QUE O POLI PEDIU
            if error != nil {
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
