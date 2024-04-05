//
//  CreateReserveVC.swift
//  bohemiaLX
//
//  Created by Pedro Ribeiro on 02/04/2024.
//

import UIKit

class CreateReserveVC: UIViewController {

    var createReserveScreen: CreateReserveScreen?
    
    override func loadView() {
        createReserveScreen = CreateReserveScreen()
        view = createReserveScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1.0) /* #343434*/
        createReserveScreen?.delegate(delegate: self)
    }
    
    struct Reservation {
        let id: String // Identificador único da reserva
        let name: String //
        let numberOfPerson: Int // Quantidade de pessoas na reserva
        let date: Date // Data da reserva
        let time: String // Horário da reserva
    }
    
}

extension CreateReserveVC: CreateReserveScreenProtocol {
    
}

