//
//  HomeTableViewCell.swift
//  bohemiaLX
//
//  Created by Pedro Ribeiro on 01/04/2024.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    static let identifier: String = "TableViewCell"
    
    lazy var screen: HomeTableViewCellScreen = {
        let view = HomeTableViewCellScreen()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        addSubView()
        setupConstraints()
    }
    
    private func addSubView() {
        contentView.addSubview(screen)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
        
            screen.topAnchor.constraint(equalTo: contentView.topAnchor),
            screen.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            screen.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            screen.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        
        ])
    }
    
    public func setupHomeCell() {
        screen.nameLabel.text = "Nome: "
        screen.surnameLabel.text = "Sobrenome: "
        screen.phoneLabel.text = "Telefone: "
    }
    
}
