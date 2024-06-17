//
//  PinScreen.swift
//  bohemiaLX
//
//  Created by Pedro Ribeiro on 15/06/2024.
//

import UIKit

protocol PinScreenProtocol: AnyObject {
    func customNavigation()
}

class PinScreen: UIView {
    
    private weak var delegate: PinScreenProtocol?
    
    public func delegate(delegate: PinScreenProtocol?) {
        self.delegate = delegate
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var titleLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = .boldSystemFont(ofSize: 24)
        lb.text = "DIGITE O PIN DE ACESSO"
        lb.textAlignment = .center
        lb.textColor = .white
        return lb
    }()
    
    lazy var subtitleLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = .systemFont(ofSize: 16)
        lb.text = "somente pessoas autorizadas"
        lb.textAlignment = .center
        lb.textColor = .white
        return lb
    }()
    
    lazy var pinTextField: UITextField = {
        let tf = UITextField()
        tf.autocapitalizationType = .none
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1.0) /* #343434*/
        tf.borderStyle = .roundedRect
        tf.attributedPlaceholder = NSAttributedString(string: "Digite o pin", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.4)])
        tf.textColor = .white
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 12
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.white.cgColor
        tf.isSecureTextEntry = true
        tf.keyboardType = .numberPad
        return tf
    }()
    
    lazy var nextButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Continuar >", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.titleLabel?.textAlignment = .right
        button.backgroundColor = .white
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(tappedNextButton), for: .touchUpInside)
        button.isEnabled = false
        return button
    }()
    
    @objc func tappedNextButton(_ sender: UIButton) {
        print("ok")
        
        delegate?.customNavigation()
        
    }
    
    private func addElements() {
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(pinTextField)
        addSubview(nextButton)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 80),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            subtitleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            pinTextField.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 48),
            pinTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            pinTextField.widthAnchor.constraint(equalToConstant: 220),
            
            nextButton.topAnchor.constraint(equalTo: pinTextField.bottomAnchor, constant: 80),
            nextButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
            
            
            
        ])
    }
    
}
