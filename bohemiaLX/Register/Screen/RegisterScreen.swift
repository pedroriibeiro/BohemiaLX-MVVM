import UIKit

protocol RegisterScreenProtocol: AnyObject {
    func customBody()
}

class RegisterScreen: UIView {
    
    private weak var delegate: RegisterScreenProtocol?
    
    public func delegate(delegate: RegisterScreenProtocol?) {
        self.delegate = delegate
    }
    
    lazy var registerLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Cadastro: "
        lb.textAlignment = .left
        lb.font = .boldSystemFont(ofSize: 28)
        lb.textColor = .white
        return lb
    }()
    
    lazy var registerLabel2: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Crie uma conta com e-mail e senha:"
        lb.numberOfLines = 0
        lb.textAlignment = .left
        lb.textColor = .white
        lb.font = .systemFont(ofSize: 20)
        return lb
    }()
    
    lazy var registerLabel3: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "A criação de contas é destinadas apenas aos colaboradores da empresa."
        lb.numberOfLines = 0
        lb.textAlignment = .left
        lb.textColor = .systemRed
        lb.font = .systemFont(ofSize: 14)
        return lb
    }()
    
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1.0) /* #343434*/
        tf.borderStyle = .roundedRect
        tf.keyboardType = .emailAddress
        tf.attributedPlaceholder = NSAttributedString(string: "Digite seu e-mail", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.4)])
        tf.textColor = .white
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 12
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.white.cgColor
        return tf
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1.0) /* #343434*/
        tf.borderStyle = .roundedRect
        tf.attributedPlaceholder = NSAttributedString(string: "Digite sua senha", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.4)])
        tf.textColor = .white
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 12
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.white.cgColor
        tf.isSecureTextEntry = true
        return tf
    }()
    
    lazy var confirmPasswordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1.0) /* #343434*/
        tf.borderStyle = .roundedRect
        tf.attributedPlaceholder = NSAttributedString(string: "Confirme sua senha", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.4)])
        tf.textColor = .white
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 12
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.white.cgColor
        tf.isSecureTextEntry = true
        return tf
    }()
    
    lazy var registerButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Confirmar dados", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.titleLabel?.textAlignment = .right
        button.backgroundColor = .white
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(tappedRegisterButton), for: .touchUpInside)
        button.isEnabled = true
        return button
    }()
    
    @objc func tappedRegisterButton(_ sender: UIButton) {
        print("ok")
        
        delegate?.customBody()
    }
    
    func delegateTextField(delegate: UITextFieldDelegate) {
        emailTextField.delegate = delegate
        passwordTextField.delegate = delegate
    }
    
    private func addElements() {
        addSubview(registerLabel)
        addSubview(registerLabel2)
        addSubview(registerLabel3)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(confirmPasswordTextField)
        addSubview(registerButton)
        
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            registerLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor ,constant: 60),
            registerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            
            registerLabel2.topAnchor.constraint(equalTo: registerLabel.bottomAnchor, constant: 40),
            registerLabel2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            registerLabel2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            registerLabel3.topAnchor.constraint(equalTo: registerLabel2.bottomAnchor, constant: 8),
            registerLabel3.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            registerLabel3.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            emailTextField.topAnchor.constraint(equalTo: registerLabel3.bottomAnchor, constant: 40),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            confirmPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            confirmPasswordTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            confirmPasswordTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            registerButton.topAnchor.constraint(equalTo: confirmPasswordTextField.bottomAnchor, constant: 40),
            registerButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            registerButton.widthAnchor.constraint(equalToConstant: 200),
                                                    
        ])
    }
}

