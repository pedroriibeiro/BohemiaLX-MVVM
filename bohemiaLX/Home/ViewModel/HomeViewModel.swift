import UIKit
import Firebase

class HomeViewModel {
    private var auth = Auth.auth()
    weak var viewController: UIViewController?
    
    func logarUsuario(email: String, senha: String, viewController: UIViewController) {
        Auth.auth().signIn(withEmail: email, password: senha) { [weak self] authResult, error in
            guard let self = self else { return }
            
            if let error = error {
                print("Erro ao logar: \(error.localizedDescription)")
                let alert = UIAlertController(title: "Falha ao logar", message: "O e-mail ou senha é inválido.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                viewController.present(alert, animated: true)
            } else {
                print("Sucesso! O usuário está logado")
                
                
                if let user = authResult?.user {
                    user.getIDTokenResult(completion: { (tokenResult, error) in
                        guard let token = tokenResult?.token else {
                            print("Erro ao obter token de autenticação: \(error?.localizedDescription ?? "Erro desconhecido")")
                            return
                        }
                        
                        UserDefaults.standard.set(token, forKey: "authToken")
                        UserDefaults.standard.set(true, forKey: "UsuarioLogado")
                        
                        
                        if let homeVC = viewController as? HomeVC {
                            homeVC.loginSuccessful()
                        }
                    })
                }
            }
        }
    }
}

