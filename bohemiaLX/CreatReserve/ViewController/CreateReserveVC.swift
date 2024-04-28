//
//  CreateReserveVC.swift
//  bohemiaLX
//
//  Created by Pedro Ribeiro on 02/04/2024.
//

import UIKit

class CreateReserveVC: UIViewController {

    var createReserveScreen: CreateReserveScreen?
    var createReserveViewModel: CreateReserveViewModel?
    
    override func loadView() {
        createReserveScreen = CreateReserveScreen()
        view = createReserveScreen
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 34/255, green: 44/255, blue: 81/255, alpha: 1.0)
        createReserveScreen?.delegate(delegate: self)
        createReserveViewModel = CreateReserveViewModel()
        createReserveScreen?.configTextFieldDelegate(delegate: self)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
           // Quando o usuário termina de editar o texto no campo de texto, você pode acessar o texto e convertê-lo para uma string
           if let text = textField.text {
               let stringFromTextField = String(text)
               // Faça o que for necessário com a string aqui
               print((stringFromTextField))
           }
       }

    
}

// MARK: Confirmar amanhã se essa lógica faz sentido

extension CreateReserveVC: CreateReserveScreenProtocol {
    func didEnterData(data: Reservation) {
        
        createReserveViewModel?.addReservation(reservation: data, completion: { _ in
            
        })
    }
    
}

extension CreateReserveVC: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        print(#function)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        textField.resignFirstResponder()
        return false
    }
}
