import UIKit
import Firebase
import FirebaseAuth

class RegisterVC: UIViewController {
    
    var registerScreen: RegisterScreen?
    private var viewModel: RegisterModel = RegisterModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 34/255, green: 44/255, blue: 81/255, alpha: 1.0)
        
        // Chame o método configCertification para configurar os botões da barra de navegação
        configCertification()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    
    override func loadView() {
        registerScreen = RegisterScreen()
        registerScreen?.delegate(delegate: self)
        registerScreen?.delegateTextField(delegate: self)
        view = registerScreen
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    private func configCertification() {
        let privacePolicyButton = UIBarButtonItem(image: UIImage(systemName: "doc"), style: .done, target: self, action: #selector(openPrivacePolicy))
        let termsOfUseButton = UIBarButtonItem(image: UIImage(systemName: "doc.fill"), style: .done, target: self, action: #selector(openTermsOfUse)) // Corrigido para chamar openTermsOfUse
        navigationItem.rightBarButtonItems = [privacePolicyButton, termsOfUseButton]
    }
    
    @objc func openPrivacePolicy() {
        self.openSafariPageWith(url: "https://doc-hosting.flycricket.io/bohemialx-privacy-policy/d931f227-fe08-475a-91af-8674450f11e6/privacy")
    }
    
    @objc func openTermsOfUse() {
        self.openSafariPageWith(url: "https://doc-hosting.flycricket.io/bohemialx-terms-of-use/a75adc22-6370-47bf-8778-3f0bb39dac1c/terms")
    }
}

extension RegisterVC: RegisterScreenProtocol {
    func customBody() {
        print("Tudo certo")
        
        let presentingViewController = self
        
        // Verificação se as senhas são iguais
        if registerScreen?.passwordTextField.text == registerScreen?.confirmPasswordTextField.text {
            print("Senhas iguais. Prosseguir com o login.")
            
            // Chamada para a função de registro de usuário
            viewModel.registerUser(email: registerScreen?.emailTextField.text ?? "",
                                   password: registerScreen?.passwordTextField.text ?? "",
                                   presentingViewController: presentingViewController)
        } else {
            // Exibir alerta informando que as senhas não coincidem
            let alert = UIAlertController(title: "Erro", message: "As senhas não coincidem.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
}

// A extensão para UITextFieldDelegate deve ser separada
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

