//
//  CreateReserveViewModel.swift
//  bohemiaLX
//
//  Created by Pedro Ribeiro on 05/04/2024.
//

import Foundation
import Firebase

class CreateReserveViewModel {
    
    var reservations: [Reservation] = []
    
    func addReservation(reservation: Reservation, completion: @escaping(Result<Void, Error>) -> Void) {
        
        let db = Firestore.firestore()
        db.collection("reservations/1/2024-04-08").document(reservation.id).setData([
            "name": reservation.name,
            "numberOfPerson": reservation.numberOfPerson,
            "date": reservation.date,
            
        ]) { error in
            if let error = error {
                print("Não foi possível localizar os dados")
                completion(.failure(error))
            } else {
                print("Sucesso ao buscar os dados")
                completion(.success(()))
            }
        }
    }
    
    // MARK: Preciso procurar a documentação para que o filtro se aplique para ser atualizado todos os dias com as informações apenas do dia
    func getReserve() -> [Reservation] {
        
        let db = Firestore.firestore()
        db.collection("reservations").getDocuments(completion: { snapshot, error in
            guard let snapshot else {
                print("Não foi possível buscar as informações", error)
                return
            }
            
            for reservation in snapshot.documents {
                let reservations = reservation.data()
                
                let name = reservations["name"] as? String ?? ""
                let numberOfPerson = reservations["numberOfPerson"] as? Int ?? 0
                let contato = reservations["contato"] as? String ?? ""
                let date = reservations["date"] as? Date ?? Date.now
                let reservation = Reservation(name: name,
                                              numberOfPerson: numberOfPerson,
                                              contact: contato,
                                              date: date)
                self.reservations.append(reservation)
                
            }
        })
        
        return reservations
    }
    
    // MARK: Abaixar teclado
    
    public func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}









// MARK: Entender o que foi feito, e criar a função que vai popular o exemplo acima e fazer a conexão com o firebase.
