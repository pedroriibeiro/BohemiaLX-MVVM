//
//  CreateReserveVC.swift
//  bohemiaLX
//
//  Created by Pedro Ribeiro on 02/04/2024.
//

import UIKit

protocol CreateReserveVCProtocol: AnyObject {
  func refreshRequest()
}

class CreateReserveVC: UIViewController {
    
    private weak var delegate: CreateReserveVCProtocol?

    public func delegate(delegate: CreateReserveVCProtocol?) {
      self.delegate = delegate
    }

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
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
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
        
        createReserveViewModel?.addReservation(reservation: data, completion: { [weak self] result in
          guard let self else { return }
          switch result {
          case .success(let success):
            dismiss(animated: true)
            delegate?.refreshRequest()
          case .failure(let failure):
            print("deu ruim chara!!")
          }
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
