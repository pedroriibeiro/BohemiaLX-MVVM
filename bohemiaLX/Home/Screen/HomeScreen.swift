//
//  HomeScreen.swift
//  bohemiaLX
//
//  Created by Pedro Ribeiro on 02/03/2024.
//

import UIKit

protocol HomeScreenProtocol: AnyObject {
    func CustomNavRegister()
    func customNavForgotPass()
    func customNavNext()
    }

class HomeScreen: UIView {
    
    private weak var delegate: HomeScreenProtocol?
    
    public func delegate(delegate: HomeScreenProtocol?) {
        self.delegate = delegate
    }
    
    lazy var subImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "azulzao")
        return image
    }()
    
    lazy var nameLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "𝐁𝐨𝐡𝐞𝐦𝐢𝐚 𝐋𝐗"
        lb.textColor = .white
        lb.font = .systemFont(ofSize: 50)
        return lb
    }()
    
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
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
    
    lazy var nextButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Entrar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22)
        button.titleLabel?.textAlignment = .right
        button.backgroundColor = .none
        button.addTarget(self, action: #selector(tappedNextButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedNextButton(_ sender: UIButton) {
        print("ok")
        delegate?.customNavNext()
    }
    
    lazy var line1: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "----------------"
        lb.textColor = .white
        lb.font = .systemFont(ofSize: 20)
        return lb
    }()
    
    lazy var line2: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "----------------"
        lb.textColor = .white
        lb.font = .systemFont(ofSize: 20)
        return lb
    }()
    
    lazy var registerButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Cadastre-se", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.titleLabel?.textAlignment = .right
        button.backgroundColor = .none
        button.addTarget(self, action: #selector(tappedRegisterButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedRegisterButton(_ sender: UIButton) {
        delegate?.CustomNavRegister()
            print("okay")
        }
    
    
    lazy var forgotPassword: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Esqueceu a senha?", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.titleLabel?.textAlignment = .right
        button.backgroundColor = .none
        button.addTarget(self, action: #selector(tappedForgotPassword), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedForgotPassword(_ sender: UIButton) {
        delegate?.customNavForgotPass()
        print("Ok!!!")
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
        addSubview(subImageView)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(nameLabel)
        addSubview(nextButton)
        addSubview(line1)
        addSubview(line2)
        addSubview(registerButton)
        addSubview(forgotPassword)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            subImageView.topAnchor.constraint(equalTo: topAnchor),
            subImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            subImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            subImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 60),
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        
            emailTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 60),
            emailTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            emailTextField.widthAnchor.constraint(equalToConstant: 300),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 40),
            passwordTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            passwordTextField.widthAnchor.constraint(equalToConstant: 300),
            
            nextButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 50),
            nextButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 150),
            
            line1.topAnchor.constraint(equalTo: nextButton.topAnchor, constant: -10),
            line1.centerXAnchor.constraint(equalTo: centerXAnchor),
            line1.widthAnchor.constraint(equalToConstant: 150),
            
            line2.topAnchor.constraint(equalTo: nextButton.bottomAnchor, constant: -15),
            line2.centerXAnchor.constraint(equalTo: centerXAnchor),
            line2.widthAnchor.constraint(equalToConstant: 150),
            
            registerButton.topAnchor.constraint(equalTo: nextButton.bottomAnchor, constant: 60),
            registerButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            registerButton.widthAnchor.constraint(equalToConstant: 150),
            
            forgotPassword.topAnchor.constraint(equalTo: nextButton.bottomAnchor, constant: 120),
            forgotPassword.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            forgotPassword.widthAnchor.constraint(equalToConstant: 200),
           
        ])
    }
}
