//
//  SelectScreen.swift
//  bohemiaLX
//
//  Created by Pedro Ribeiro on 24/03/2024.
//

import UIKit

protocol SelectScreenProtocol: AnyObject {
    func customNavigation()
    func customNavigation2()
    func logout()
}

class SelectScreen: UIView {
    
    private weak var delegate: SelectScreenProtocol?
    
    public func delegate(delegate: SelectScreenProtocol?) {
        self.delegate = delegate
    }
    
    lazy var LabelOne: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Selecione a unidade que deseja acessar: "
        lb.textAlignment = .left
        lb.numberOfLines = 0
        lb.font = .boldSystemFont(ofSize: 22)
        lb.textColor = .white
        return lb
    }()
    
    lazy var stAntonioButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("🔵 BohemiaLX - Santo António", for: .normal)
        button.backgroundColor = .white.withAlphaComponent(0.8)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.titleLabel?.textAlignment = .natural
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(tappedStAntonioButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedStAntonioButton(_ sender: UIButton) {
        print("ok")
        delegate?.customNavigation()
    }
    
    lazy var seButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("🔵  BohemiaLX - Sé", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.titleLabel?.textAlignment = .natural
        button.layer.cornerRadius = 12
        button.backgroundColor = .white.withAlphaComponent(0.8)
        button.addTarget(self, action: #selector(tappedSeButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedSeButton(_ sender: UIButton) {
        print("okay!")
        delegate?.customNavigation2()
    }
    
    lazy var logoutButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sair", for: .normal)
        button.setTitleColor(UIColor(red: 34/255, green: 44/255, blue: 81/255, alpha: 1.0)
                             , for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.titleLabel?.textAlignment = .natural
        button.layer.cornerRadius = 12
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(tappedLogoutButton), for: .touchUpInside)
        
        let logoutImage = UIImage(systemName: "arrowshape.backward.fill")
        button.setImage(logoutImage, for: .normal)
        button.tintColor = .systemRed
        button.isHidden = true
        return button
    }()
    
    @objc func tappedLogoutButton(_ sender: UIButton) {
        print("okay!")
        delegate?.logout()
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
        addSubview(LabelOne)
        addSubview(stAntonioButton)
        addSubview(seButton)
        addSubview(logoutButton)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            LabelOne.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 80),
            LabelOne.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            LabelOne.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            
            stAntonioButton.topAnchor.constraint(equalTo: LabelOne.bottomAnchor,constant: 60),
            stAntonioButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 40),
            stAntonioButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            
            seButton.topAnchor.constraint(equalTo: stAntonioButton.bottomAnchor, constant: 40),
            seButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 40),
            seButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            
            logoutButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            logoutButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            logoutButton.widthAnchor.constraint(equalToConstant: 60)
            
        ])
    }
    
}
