import UIKit

class SelectVC: UIViewController {
    
    var selectScreen: SelectScreen?
    var viewModel: AuthViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 34/255, green: 44/255, blue: 81/255, alpha: 1.0)
        selectScreen?.delegate(delegate: self)
        viewModel = AuthViewModel()
        configCertification()
    }
    
    override func loadView() {
        selectScreen = SelectScreen()
        view = selectScreen
    }
    
    private func navigateToLogin() {
        let homeVC = HomeVC()
        navigationController?.setViewControllers([homeVC], animated: true)
    }
    
    private func configCertification() {
        let privacePolicyButton = UIBarButtonItem(image: UIImage(systemName: "doc"), style: .done, target: self, action: #selector(openPrivacePolicy))
        let termsOfUseButton = UIBarButtonItem(image: UIImage(systemName: "doc.fill"), style: .done, target: self, action: #selector(openPrivacePolicy))
        navigationItem.rightBarButtonItems = [privacePolicyButton, termsOfUseButton]
    }
    
    @objc func openPrivacePolicy() {
        self.openSafariPageWith(url: "https://doc-hosting.flycricket.io/bohemialx-privacy-policy/d931f227-fe08-475a-91af-8674450f11e6/privacy")
    }
    
    @objc func openTermsOfUse() {
        self.openSafariPageWith(url: "https://doc-hosting.flycricket.io/bohemialx-terms-of-use/a75adc22-6370-47bf-8778-3f0bb39dac1c/terms")
    }
    
    
}

extension SelectVC: SelectScreenProtocol {
    func customNavigation2() {
        let vc2: Reserve2VC = Reserve2VC()
        navigationController?.pushViewController(vc2, animated: true)
    }
    
    func customNavigation() {
        let vc1: Reserve1VC = Reserve1VC()
        navigationController?.pushViewController(vc1, animated: true)
    }
    
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
}

