import UIKit

class ConfigVC: UIViewController {
    
    var configScreeen: ConfigScreen?
    var viewModel: ConfigViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 34/255, green: 44/255, blue: 81/255, alpha: 1.0)
        viewModel = ConfigViewModel()
        configScreeen?.delegate(delegate: self)
    }
    
    override func loadView() {
        configScreeen = ConfigScreen()
        view = configScreeen
    }
    
    private func navigateToLogin() {
        let vc = HomeVC() // Certifique-se de que você tenha um controlador de login
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let delegate = windowScene.delegate as? SceneDelegate,
           let window = delegate.window {
            window.rootViewController = nav
            UIView.transition(with: window, duration: 0.5, options: .transitionFlipFromRight, animations: nil, completion: nil)
        }
    }
}

extension ConfigVC: ConfigScreenProtocol {
    func logout() {
        let alert = UIAlertController(title: "Confirmar", message: "Você deseja sair?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Sair", style: .destructive, handler: { [weak self] _ in
            self?.viewModel?.logout { [weak self] result in
                switch result {
                case .success:
                    self?.navigateToLogin()
                case .failure(let error):
                    self?.showAlert(title: "Erro", message: error.localizedDescription)
                }
            }
        }))
        present(alert, animated: true)
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    
    
    func delete() {
        let alert = UIAlertController(title: "Confirmar", message: "Digite sua senha para deletar sua conta:", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Senha"
            textField.isSecureTextEntry = true
        }
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Deletar", style: .destructive, handler: { [weak self] _ in
            guard let self = self,
                  let textFields = alert.textFields,
                  let password = textFields.first?.text,
                  !password.isEmpty else {
                self?.showAlert(title: "Erro", message: "Senha não pode estar vazia")
                return
            }
            self.viewModel?.deleteAccount(withPassword: password) { result in
                switch result {
                case .success:
                    // Limpar o estado de login
                    self.resetLoginState()
                    // Redirecionar para a tela de login
                    self.navigateToLogin()
                case .failure(let error):
                    self.showAlert(title: "Erro", message: error.localizedDescription)
                }
            }
        }))
        present(alert, animated: true)
    }
    private func resetLoginState() {
        
        NotificationCenter.default.post(name: Notification.Name("UserLoggedOut"), object: nil)
    }
    
}

