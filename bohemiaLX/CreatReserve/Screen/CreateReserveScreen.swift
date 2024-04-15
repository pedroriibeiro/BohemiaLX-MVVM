//
//  CreateReserveScreen.swift
//  bohemiaLX
//
//  Created by Pedro Ribeiro on 02/04/2024.
//

import UIKit

protocol CreateReserveScreenProtocol: AnyObject {
    func didEnterData(data: Reservation)
}

class CreateReserveScreen: UIView {
    
    private weak var delegate: CreateReserveScreenProtocol?
    public func delegate(delegate: CreateReserveScreenProtocol?) {
        self.delegate = delegate
    }
    
    lazy var titleLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Criar nova reserva"
        lb.textAlignment = .left
        lb.textColor = .white
        lb.font = .systemFont(ofSize: 30)
        return lb
    }()
    
    lazy var nameTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1.0) /* #343434*/
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.attributedPlaceholder = NSAttributedString(string: "Digite o nome do cliente", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.4)])
        tf.textColor = .white
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 12
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.white.cgColor
        return tf
    }()
    
    lazy var quantidadeTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1.0) /* #343434*/
        tf.borderStyle = .roundedRect
        tf.keyboardType = .numberPad
        tf.attributedPlaceholder = NSAttributedString(string: "Informe a quantidade de pessoas", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.4)])
        tf.textColor = .white
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 12
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.white.cgColor
        return tf
    }()
    
    lazy var contactoTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1.0) /* #343434*/
        tf.borderStyle = .roundedRect
        tf.keyboardType = .numberPad
        tf.attributedPlaceholder = NSAttributedString(string: "Contacto (opcional)", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.4)])
        tf.textColor = .white
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 12
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.white.cgColor
        return tf
    }()
    
    lazy var selecDatePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.datePickerMode = .dateAndTime
        datePicker.locale = .current
        datePicker.backgroundColor = .lightGray
        datePicker.tintColor = .systemBlue
        datePicker.preferredDatePickerStyle = .automatic
        datePicker.minimumDate = Date()
        datePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
        return datePicker
    }()
    
    @objc func dateChanged(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        dateFormatter.dateFormat = "yyyy-MM-dd"
        //delegate.self
    }
    
    lazy var confirmButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Reservar", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22)
        button.titleLabel?.textAlignment = .right
        button.backgroundColor = .white.withAlphaComponent(0.9)
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(tappedConfirmButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedConfirmButton(_ sender: UIButton) {
        print("ok")
        
        
        
        let reservation = Reservation(name: nameTextField.text ?? "", numberOfPerson: 1, contact: contactoTextField.text ?? "", date:selecDatePicker.date)
        
        delegate?.didEnterData(data: reservation)
        
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
        addSubview(titleLabel)
        addSubview(nameTextField)
        addSubview(quantidadeTextField)
        addSubview(contactoTextField)
        addSubview(selecDatePicker)
        addSubview(confirmButton)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            nameTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 60),
            nameTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameTextField.widthAnchor.constraint(equalToConstant: 300),
            
            quantidadeTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 40),
            quantidadeTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            quantidadeTextField.widthAnchor.constraint(equalToConstant: 300),
            
            contactoTextField.topAnchor.constraint(equalTo: quantidadeTextField.bottomAnchor, constant: 40),
            contactoTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            contactoTextField.widthAnchor.constraint(equalToConstant: 300),
            
            selecDatePicker.topAnchor.constraint(equalTo: contactoTextField.bottomAnchor, constant: 40),
            selecDatePicker.centerXAnchor.constraint(equalTo: centerXAnchor),
            selecDatePicker.widthAnchor.constraint(equalToConstant: 185),
            
            confirmButton.topAnchor.constraint(equalTo: selecDatePicker.bottomAnchor, constant: 60),
            confirmButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            confirmButton.widthAnchor.constraint(equalToConstant: 200),
            
        ])
    }
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate) {
        nameTextField.delegate = delegate
        contactoTextField.delegate = delegate
        quantidadeTextField.delegate = delegate
        
    }
    
}
