//
//  BetaScreen.swift
//  bohemiaLX
//
//  Created by Pedro Ribeiro on 21/06/2024.
//

import UIKit

class BetaScreen: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(titleLabel)
    }
    
    lazy var titleLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = .systemFont(ofSize: 20)
        lb.numberOfLines = 0
        lb.lineBreakMode = .byWordWrapping
        lb.text = "Essa função ainda não está disponível. Em breve atualizaremos :("
        lb.textAlignment = .center
        lb.textColor = .lightGray
        return lb
    }()
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
        
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 200),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        
        
        ])
    }
    
}
