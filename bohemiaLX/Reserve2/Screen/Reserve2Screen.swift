//
//  Reserve2Screen.swift
//  bohemiaLX
//
//  Created by Pedro Ribeiro on 23/05/2024.
//

import UIKit

protocol Reserve2ScreenProtocol: AnyObject {
    func customNavigation()
}

class Reserve2Screen: UIView {
    
    private weak var delegate: Reserve2ScreenProtocol?
    
    public func delegate(delegate: Reserve2ScreenProtocol?) {
        self.delegate = delegate
    }
    
    lazy var labelData: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "yyyy-MM-dd"
        lb.textAlignment = .left
        lb.numberOfLines = 0
        lb.font = .boldSystemFont(ofSize: 18)
        lb.textColor = .lightGray
        return lb
    }()
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.showsVerticalScrollIndicator = false
        tv.backgroundColor = .lightGray
        tv.layer.cornerRadius = 12
        tv.register(TableViewCell2.self, forCellReuseIdentifier: TableViewCell2.identifier)
        
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
    
    public func configDateLabel(data: String) {
        labelData.text = data
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
        addSubview(labelData)
        addSubview(tableView)
        addSubview(plusButton)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            labelData.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            labelData.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 100),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            
            plusButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            plusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        
        ])
    }
}
