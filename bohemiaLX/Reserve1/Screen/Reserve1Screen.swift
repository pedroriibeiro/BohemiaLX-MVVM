//
//  Reserve1Screen.swift
//  bohemiaLX
//
//  Created by Pedro Ribeiro on 24/03/2024.
//

import UIKit

protocol Reserve1ScreenProtocol: AnyObject {
    func customNavigation()
}

class Reserve1Screen: UIView {
    
    private weak var delegate: Reserve1ScreenProtocol?
    
    public func delegate(delegate: Reserve1ScreenProtocol?) {
        self.delegate = delegate
    }
    
    
    lazy var subImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "azulzao")
        return image
    }()
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.showsVerticalScrollIndicator = false
        tv.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1.0) /* #343434*/
        tv.layer.cornerRadius = 12
        tv.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        
        return tv
    }()
    
    lazy var plusButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("+", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.textColor = .black
        button.tintColor = .white
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 40)
        button.titleLabel?.textAlignment = .right
        button.backgroundColor = .none
        button.addTarget(self, action: #selector(tappedPlusButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedPlusButton(_ sender: UIButton) {
        print("ok")
        delegate?.customNavigation()
        
    }
    
    public func configProtocolsTableView(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        tableView.delegate = delegate
        tableView.dataSource = dataSource
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
        addSubview(tableView)
        addSubview(plusButton)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 100),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            
            plusButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            plusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        
        ])
    }
}
