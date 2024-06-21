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
        // Instantiate the initial view controller you want to navigate to (e.g., LoginViewController)
        let vc = HomeVC()
        
        vc.hidesBottomBarWhenPushed = true
        navigationController?.setViewControllers([vc], animated: true)
        
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

