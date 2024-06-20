//
//  PinVC.swift
//  bohemiaLX
//
//  Created by Pedro Ribeiro on 15/06/2024.
//

import UIKit

class PinVC: UIViewController {
    
    var pinScreen: PinScreen?
    
    override func loadView() {
        pinScreen = PinScreen()
        view = pinScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 34/255, green: 44/255, blue: 81/255, alpha: 1.0)
        pinScreen?.delegate(delegate: self)
        setupTextFieldObserver()
        updateNextButtonState()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        pinScreen?.pinTextField.becomeFirstResponder()
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return false
    }
    
    private func setupTextFieldObserver() {
        pinScreen?.pinTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    private func updateNextButtonState() {
        let pin = pinScreen?.pinTextField.text ?? ""
        let isPinCorrect = (pin == "1100")
        pinScreen?.nextButton.isEnabled = isPinCorrect
        pinScreen?.nextButton.setTitleColor(isPinCorrect ? .systemBlue : .lightGray, for: .normal)
    }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        updateNextButtonState()
    }
}

extension PinVC: PinScreenProtocol {
    func customNavigation() {
//        let vc3: SelectVC = SelectVC()
//        vc3.modalPresentationStyle = .currentContext
        // MARK: Altera o fluxo de navegação para a select ser a principal
        
//        let nav = UINavigationController(rootViewController: vc3)
//        nav.modalPresentationStyle = .currentContext
//        present(nav, animated: true)
        
        let vc: SelectVC = SelectVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
