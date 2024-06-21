//
//  FirstCell.swift
//  bohemiaLX
//
//  Created by Pedro Ribeiro on 20/06/2024.
//

import UIKit

class FirstCell: UICollectionViewCell {
    
    static let identifier = "FirstCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        //imageView.image = UIImage(systemName: "person")
        imageView.tintColor = .lightGray
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 12
        return imageView
    }()
    
    lazy var iconNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white.withAlphaComponent(0.8)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    func configure(with image: UIImage?, labelText: String) {
           iconImageView.image = image
           iconNameLabel.text = labelText
       }
    
    func setupView() {
        layer.masksToBounds = true
        layer.cornerRadius = 12
        contentView.backgroundColor = UIColor(red: 45/255, green: 55/255, blue: 70/255, alpha: 1.0)
        contentView.addSubview(iconImageView)
        contentView.addSubview(iconNameLabel)
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.iconImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            self.iconImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.iconImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            self.iconImageView.heightAnchor.constraint(equalToConstant: 100),
            
            self.iconNameLabel.topAnchor.constraint(equalTo: self.iconImageView.bottomAnchor, constant: 4),
            self.iconNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            self.iconNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            //self.iconNameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16)
        ])
    }
    
}
