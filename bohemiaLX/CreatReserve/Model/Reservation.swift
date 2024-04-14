//
//  Reservation.swift
//  bohemiaLX
//
//  Created by Pedro Ribeiro on 06/04/2024.
//

import Foundation
    
    struct Reservation {
        let id: String = UUID().uuidString
        let name: String //
        let numberOfPerson: Int // Quantidade de pessoas na reserva
        let contact: String
        let date: Date // Data da reserva
    }
    

