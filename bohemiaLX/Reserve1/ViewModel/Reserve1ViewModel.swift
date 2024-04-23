//
//  Reserve1ViewModel.swift
//  bohemiaLX
//
//  Created by Pedro Ribeiro on 23/04/2024.
//
import Firebase
import UIKit

class Reserve1ViewModel: NSObject {
    
    var reservation: [Reservation] = []
    
    func getReserve(selecDate: Date, completion: @escaping(Result<[Reservation], Error>) -> Void) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let  dateSelect = dateFormatter.string(from: selecDate)
        
        let db = Firestore.firestore()
        db.collection("reservations/1/\(dateSelect)").getDocuments(completion: { snapshot, error in
            guard let snapshot else {
                print("Não foi possível buscar as informações", error)
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
            //completion
                    })
    
    }

}
