//
//  CreateReserveViewModel.swift
//  bohemiaLX
//
//  Created by Pedro Ribeiro on 05/04/2024.
//

import Foundation
import Firebase

class CreateReserveViewModel {
    
    func addReservation(reservation: CreateReserveVC.Reservation, completion: @escaping(Result<Void, Error>) -> Void) {
        
                let db = Firestore.firestore()
            db.collection("reservations").document(reservation.id).setData([
                "name": reservation.name,
                "numberOfPeople": reservation.numberOfPerson,
                "date": reservation.date,
                "time": reservation.time
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
//
