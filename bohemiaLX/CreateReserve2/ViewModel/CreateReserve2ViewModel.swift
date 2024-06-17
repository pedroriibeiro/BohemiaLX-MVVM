//
//  CreateReserve2ViewModel.swift
//  bohemiaLX
//
//  Created by Pedro Ribeiro on 23/05/2024.
//

import Foundation
import Firebase

class CreateReserve2ViewModel {
    
    var reservations: [Reservation] = []
    
    func addReservation(reservation: Reservation, completion: @escaping(Result<Void, Error>) -> Void) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let  selecDate = dateFormatter.string(from: reservation.date)
        
        let db = Firestore.firestore()
        db.collection("reservations/2/\(selecDate)")
            .addDocument(data:  ["name": reservation.name,
                                 "numberOfPerson": reservation.numberOfPerson,
                                 "contato": reservation.contact,
                                 "date": reservation.date
                                 
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
    
    
    
    
}
