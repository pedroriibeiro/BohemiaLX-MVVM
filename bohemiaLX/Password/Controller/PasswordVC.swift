import UIKit

class PasswordVC: UIViewController, PasswordScreenProtocol {
    
    var passwordScreen: PasswordScreen?
    var viewModel: PasswordViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 34/255, green: 44/255, blue: 81/255, alpha: 1.0)
        
        viewModel = PasswordViewModel()
        passwordScreen?.setDelegate(delegate: self)
    }
    
    override func loadView() {
        passwordScreen = PasswordScreen()
        view = passwordScreen
    }
    
    func tappedRegisterButton() {
        guard let email = passwordScreen?.emailTextField.text, !email.isEmpty else {
            showAlert(title: "Erro", message: "Por favor, insira um e-mail.")
            return
        }
        
        viewModel?.resetPassword(email: email) { [weak self] result in
            switch result {
            case .success:
                self?.showAlert(title: "Sucesso", message: "Email de recuperação de senha enviado.")
            case .failure(let error):
                self?.showAlert(title: "Erro", message: error.localizedDescription)
            }
        }
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

