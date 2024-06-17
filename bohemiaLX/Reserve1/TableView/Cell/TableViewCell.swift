//
//  HomeTableViewCell.swift
//  bohemiaLX
//
//  Created by Pedro Ribeiro on 01/04/2024.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    static let identifier: String = "TableViewCell"
    
    lazy var screen: TableViewCellScreen = {
        let view = TableViewCellScreen()
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
    
    public func setupHomeCell(data: Reservation) {
        screen.nameLabel.text = "Nome: \(data.name)"
        screen.qtdLabel.text = "Quantidade \(data.numberOfPerson)"
        screen.phoneLabel.text = "Contato: \(data.contact)"
        screen.timeLabel.text = "Horário: \(data.date.getDateString(format: "HH:mm"))"
    }
    
}
