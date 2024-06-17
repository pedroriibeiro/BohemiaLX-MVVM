import UIKit
import Firebase

class HomeViewModel {
    private var auth = Auth.auth()
    weak var viewController: UIViewController?
    
    func logarUsuario(email: String, senha: String, viewController: UIViewController) {
        Auth.auth().signIn(withEmail: email, password: senha) { [weak self] success, error in
            guard let self = self else { return }
            if let error = error {
                print("Erro ao logar: \(error.localizedDescription)")
                let alert = UIAlertController(title: "Erro", message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                viewController.present(alert, animated: true)
            } else {
                print("Sucesso! O usuário está logado")
                UserDefaults.standard.set(true, forKey: "UsuarioLogado")
                
                // Aqui você deve informar ao HomeVC que o login foi bem sucedido
                if let homeVC = viewController as? HomeVC {
                    homeVC.loginSuccessful()
                }
            }
        }
    }

}
