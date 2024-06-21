//
//  ConfigScreen.swift
//  bohemiaLX
//
//  Created by Pedro Ribeiro on 21/06/2024.
//

import UIKit

protocol ConfigScreenProtocol: AnyObject {
    func logout()
    func delete()
}

class ConfigScreen: UIView {
    
    private weak var delegate: ConfigScreenProtocol?
    
    public func delegate(delegate: ConfigScreenProtocol?) {
        self.delegate = delegate
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(logoutButton)
        addSubview(deleteButton)
    }
   
    lazy var logoutButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("  Sair", for: .normal)
        button.setTitleColor(UIColor.white
                             , for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.titleLabel?.textAlignment = .natural
        button.layer.cornerRadius = 12
        button.backgroundColor = .none
        button.addTarget(self, action: #selector(tappedLogoutButton), for: .touchUpInside)
        
        let logoutImage = UIImage(systemName: "return")
        button.setImage(logoutImage, for: .normal)
        button.tintColor = .white
        
        return button
    }()
    
    @objc func tappedLogoutButton(_ sender: UIButton) {
        print("okay!")
        delegate?.logout()
    }
    
    lazy var deleteButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("  Apagar conta", for: .normal)
        button.setTitleColor(UIColor.white
                             , for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.titleLabel?.textAlignment = .natural
        button.layer.cornerRadius = 12
        button.backgroundColor = .none
        button.addTarget(self, action: #selector(tappedDeleteButton), for: .touchUpInside)
        
        let logoutImage = UIImage(systemName: "delete.backward")
        button.setImage(logoutImage, for: .normal)
        button.tintColor = .white
        
        return button
    }()
    
    @objc func tappedDeleteButton(_ sender: UIButton) {
        print("okay!")
        delegate?.delete()
    }
    
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
        
            logoutButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 160),
            logoutButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoutButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            logoutButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            deleteButton.topAnchor.constraint(equalTo: logoutButton.bottomAnchor, constant: 40),
            deleteButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            deleteButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            deleteButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)

        
        ])
    }
    
}
