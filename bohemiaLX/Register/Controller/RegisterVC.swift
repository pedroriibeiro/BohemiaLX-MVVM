import UIKit

class RegisterVC: UIViewController {
    
    var registerScreen: RegisterScreen?
    private var viewModel: HomeViewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 34/255, green: 44/255, blue: 81/255, alpha: 1.0)
        
        // Configurar delegados dos text fields
        registerScreen?.delegate(delegate: self)
        
        // Adicionar gesto de toque para dispensar o teclado
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    override func loadView() {
        registerScreen = RegisterScreen()
        view = registerScreen
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension RegisterVC: RegisterScreenProtocol {
    func customBody() {
        print("ta ok")
        viewModel.registerUser(email: registerScreen?.emailTextField.text ?? "", password: registerScreen?.passwordTextField.text ?? "")
    }
}

extension RegisterVC: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        textField.resignFirstResponder()
        return true
    }
}

