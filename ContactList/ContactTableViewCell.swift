//
//  ContactTableViewCell.swift
//  ContactList
//
//  Created by Irfan on 30/10/26.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    
    static let identifier = "ContactTableViewCell"
    private let initialsLabel = UILabel()
    private let nameLabel = UILabel()
    private let emailLabel = UILabel()
    private let phoneNumberLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    func setupUI() {
        initialsLabel.backgroundColor = .systemBlue
        initialsLabel.textColor = .white
        initialsLabel.textAlignment = .center
        initialsLabel.font = .boldSystemFont(ofSize: 18)
        initialsLabel.layer.cornerRadius = 25
        initialsLabel.layer.masksToBounds = true
        
        nameLabel.font = .boldSystemFont(ofSize: 16)
        phoneNumberLabel.font = .systemFont(ofSize: 14)
        phoneNumberLabel.textColor = .secondaryLabel
        
        emailLabel.font = .systemFont(ofSize: 13)
        emailLabel.textColor = .secondaryLabel
        
        let stackView = UIStackView(arrangedSubviews: [
            nameLabel,
            phoneNumberLabel,
            emailLabel
        ])
        stackView.axis = .vertical
        stackView.spacing = 4
        
        contentView.addSubview(initialsLabel)
        contentView.addSubview(stackView)
        initialsLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            initialsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                        initialsLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                        initialsLabel.widthAnchor.constraint(equalToConstant: 50),
                        initialsLabel.heightAnchor.constraint(equalToConstant: 50),

                        stackView.leadingAnchor.constraint(equalTo: initialsLabel.trailingAnchor, constant: 16),
                        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
                        stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                        stackView.topAnchor.constraint(greaterThanOrEqualTo: contentView.topAnchor, constant: 12),
                        stackView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -12)
        ])
        
    
        
        
    }
    
    func configure(with contact: Contact ) {
        nameLabel.text = contact.name
        phoneNumberLabel.text = contact.phoneNumber
        emailLabel.text = contact.email
        initialsLabel.text = String(contact.name.prefix(1)).uppercased()
    }
}
