
import UIKit

protocol PasswordScreenProtocol: AnyObject {
    func tappedRegisterButton()
}

class PasswordScreen: UIView {
    
    weak var delegate: PasswordScreenProtocol?
    
    public func setDelegate(delegate: PasswordScreenProtocol?) {
        self.delegate = delegate
    }
    
    lazy var passwordLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Recuperar senha: "
        lb.textAlignment = .left
        lb.font = .boldSystemFont(ofSize: 28)
        lb.textColor = .white
        return lb
    }()
    
    lazy var passwordLabel2: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "  Digite seu e-mail para solicitar a recuperação da senha: "
        lb.numberOfLines = 0
        lb.textAlignment = .left
        lb.textColor = .white
        lb.font = .systemFont(ofSize: 20)
        return lb
    }()
    
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1.0)
        tf.borderStyle = .roundedRect
        tf.attributedPlaceholder = NSAttributedString(string: "E-mail", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.4)])
        tf.autocapitalizationType = .none
        tf.textColor = .white
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 12
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.white.cgColor
        tf.isSecureTextEntry = false
        return tf
    }()
    
    lazy var forgotPasswordButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Confirmar", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.titleLabel?.textAlignment = .right
        button.backgroundColor = .white
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(tappedRegisterButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedRegisterButton(_ sender: UIButton) {
        delegate?.tappedRegisterButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(passwordLabel)
        addSubview(passwordLabel2)
        addSubview(emailTextField)
        addSubview(forgotPasswordButton)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            passwordLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 80),
            passwordLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            
            passwordLabel2.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 60),
            passwordLabel2.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            passwordLabel2.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            emailTextField.topAnchor.constraint(equalTo: passwordLabel2.bottomAnchor, constant: 60),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            emailTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            forgotPasswordButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 60),
            forgotPasswordButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            forgotPasswordButton.widthAnchor.constraint(equalToConstant: 120),
        ])
    }
}
