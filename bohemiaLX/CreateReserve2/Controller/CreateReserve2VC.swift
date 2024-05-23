//
//  CreateReserve2VC.swift
//  bohemiaLX
//
//  Created by Pedro Ribeiro on 23/05/2024.
//

import UIKit

protocol CreateReserve2VCProtocol: AnyObject {
    func refreshRequest()
}

class CreateReserve2VC: UIViewController {
    
    private weak var delegate: CreateReserve2VCProtocol?
    public func delegate(delegate: CreateReserve2VCProtocol?) {
        self.delegate = delegate
    }

    var createReserve2Screen: CreateReserve2Screen?
    var createReserve2ViewModel: CreateReserve2ViewModel?
    
    override func loadView() {
        createReserve2Screen = CreateReserve2Screen()
        view = createReserve2Screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 34/255, green: 44/255, blue: 81/255, alpha: 1.0)
        createReserve2Screen?.delegate(delegate: self)
        createReserve2ViewModel = CreateReserve2ViewModel()
        createReserve2Screen?.configTextFieldDelegate(delegate: self)
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

extension CreateReserve2VC: CreateReserve2ScreenProtocol {
    func didEnterData(data: Reservation) {
        
        createReserve2ViewModel?.addReservation(reservation: data, completion: { [weak self] result in
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
    
extension CreateReserve2VC: UITextFieldDelegate {
    
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
    

