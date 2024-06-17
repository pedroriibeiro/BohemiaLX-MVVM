import UIKit
import Firebase
import FirebaseAuth

class RegisterModel {
    
    private var auth = Auth.auth()
    
    public func registerUser(email: String, password: String, presentingViewController: UIViewController?) {
        auth.createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("Error register: \(error.localizedDescription)")
            } else {
                print("Success register")
                
                
                let alert = UIAlertController(title: "Registro bem-sucedido", message: "Você foi registrado com sucesso! Volte a tela de login para entrar.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                
                
                if let viewController = presentingViewController {
                    DispatchQueue.main.async {
                        viewController.present(alert, animated: true, completion: nil)
                    }
                } else {
                    
                    print("Erro: não foi possível apresentar o alerta pois o view controller não está disponível.")
                }
            }
        }
    }
}

