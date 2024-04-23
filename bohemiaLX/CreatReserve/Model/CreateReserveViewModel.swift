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
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let  selecDate = dateFormatter.string(from: reservation.date)
        
        let db = Firestore.firestore()
        db.collection("reservations/1/\(selecDate)").document(reservation.id).setData([
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
    
//    // MARK: Abaixar teclado
//    
//    public func textFieldShouldReturn(textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return true
//    }
    
}









// MARK: Entender o que foi feito, e criar a função que vai popular o exemplo acima e fazer a conexão com o firebase.
