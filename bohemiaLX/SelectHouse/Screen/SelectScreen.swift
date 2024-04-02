//
//  SelectScreen.swift
//  bohemiaLX
//
//  Created by Pedro Ribeiro on 24/03/2024.
//

import UIKit

protocol SelectScreenProtocol: AnyObject {
    func customNavigation()
}

class SelectScreen: UIView {
    
    private weak var delegate: SelectScreenProtocol?
    
    public func delegate(delegate: SelectScreenProtocol?) {
        self.delegate = delegate
    }
    
    lazy var subImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "azulzao")
        return image
    }()
    
    lazy var LabelOne: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = " Selecione a unidade que deseja acessar: "
        lb.textAlignment = .left
        lb.numberOfLines = 0
        lb.font = .boldSystemFont(ofSize: 24)
        lb.textColor = .white
        return lb
    }()

    lazy var stAntonioButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("⚪️  BohemiaLX - Santo António", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.titleLabel?.textAlignment = .left
        button.backgroundColor = .none
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
        button.setTitle("⚪️  BohemiaLX - Sé", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.titleLabel?.textAlignment = .left
        button.backgroundColor = .none
        button.addTarget(self, action: #selector(tappedSeButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedSeButton(_ sender: UIButton) {
        print("okay!")
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
        addSubview(LabelOne)
        addSubview(stAntonioButton)
        addSubview(seButton)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            subImageView.topAnchor.constraint(equalTo: topAnchor),
            subImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            subImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            subImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            LabelOne.topAnchor.constraint(equalTo: topAnchor, constant: 140),
            LabelOne.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            LabelOne.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            stAntonioButton.topAnchor.constraint(equalTo: LabelOne.bottomAnchor,constant: 100),
            stAntonioButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 40),
            
            seButton.topAnchor.constraint(equalTo: stAntonioButton.bottomAnchor, constant: 60),
            seButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 40)
            
        ])
    }
    
}
