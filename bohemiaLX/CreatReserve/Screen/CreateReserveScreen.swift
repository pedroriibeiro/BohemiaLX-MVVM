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
    
    var selecDate: String?
    var texto: String?
    var numero: Int?
    
    private weak var delegate: CreateReserveScreenProtocol?
    public func delegate(delegate: CreateReserveScreenProtocol?) {
        self.delegate = delegate
    }
    
    lazy var titleLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.font = .boldSystemFont(ofSize: 30)
        lb.text = "Criar nova reserva"
        lb.textAlignment = .center
        lb.textColor = .white
        return lb
    }()
    
    lazy var nameTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.attributedPlaceholder = NSAttributedString(string: "Digite o nome do cliente", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 34/255, green: 44/255, blue: 81/255, alpha: 1.0)])
        tf.textColor = UIColor(red: 34/255, green: 44/255, blue: 81/255, alpha: 1.0)
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 12
        tf.layer.borderWidth = 1.0
        tf.layer.borderColor = UIColor.black.cgColor
        return tf
    }()
    
    lazy var quantidadeTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .numberPad
        tf.attributedPlaceholder = NSAttributedString(string: "Informe a quantidade de pessoas", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 34/255, green: 44/255, blue: 81/255, alpha: 1.0)])
        tf.textColor = UIColor(red: 34/255, green: 44/255, blue: 81/255, alpha: 1.0)
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
        tf.backgroundColor = .white
        tf.borderStyle = .roundedRect
        tf.keyboardType = .numberPad
        tf.attributedPlaceholder = NSAttributedString(string: "Contacto (opcional)", attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 34/255, green: 44/255, blue: 81/255, alpha: 1.0)])
        tf.textColor = UIColor(red: 34/255, green: 44/255, blue: 81/255, alpha: 1.0)
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
        datePicker.backgroundColor = .white
        datePicker.tintColor = UIColor(red: 34/255, green: 44/255, blue: 81/255, alpha: 1.0)
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
        selecDate = dateFormatter.string(from: sender.date)
        print("Data: \(selecDate ?? "")")
        //delegate.self
    }
    
    lazy var confirmButton: UIButton = {
        let button: UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Reservar", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 22)
        button.titleLabel?.textAlignment = .right
        button.backgroundColor = .white
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(tappedConfirmButton), for: .touchUpInside)
        return button
    }()
    
    @objc func tappedConfirmButton(_ sender: UIButton) {
        print("ok")
        
        let numberOfPerson = Int(quantidadeTextField.text ?? "")
        
        let reservation = Reservation(id: "", name: nameTextField.text ?? "", numberOfPerson: numberOfPerson ?? 0, contact: contactoTextField.text ?? "", date: selecDatePicker.date)
        
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
            
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
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
            selecDatePicker.widthAnchor.constraint(equalToConstant: 200),
            
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

