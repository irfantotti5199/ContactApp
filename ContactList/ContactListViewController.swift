//
//  ContactListViewController.swift
//  ContactList
//
//  Created by Irfan on 30/10/26.
//

import Foundation
import UIKit


class ContactListViewController: UIViewController {
    
    let tableView = UITableView()
    
    let contacts: [Contact] = [
        Contact(id: 1, name: "Irfan", phoneNumber: "8010937498", email: "rirniuu@gmail.com"),
        Contact(id: 2, name: "Suhana", phoneNumber: "8010937498", email: "rirniuu@gmail.com"),
        Contact(id: 3, name: "Isra", phoneNumber: "8010937498", email: "rirniuu@gmail.com"),
        Contact(id: 4, name: "Inaya", phoneNumber: "8010937498", email: "rirniuu@gmail.com"),
        Contact(id: 5, name: "Totti", phoneNumber: "8010937498", email: "rirniuu@gmail.com"),
        Contact(id: 6, name: "Ganeem", phoneNumber: "8010937498", email: "rirniuu@gmail.com"),
        Contact(id: 7, name: "Jubeda", phoneNumber: "8010937498", email: "rirniuu@gmail.com"),
        Contact(id: 8, name: "Totti", phoneNumber: "8010937498", email: "rirniuu@gmail.com"),
        Contact(id: 9, name: "Totti", phoneNumber: "8010937498", email: "rirniuu@gmail.com"),
        Contact(id: 10, name: "Totti", phoneNumber: "8010937498", email: "rirniuu@gmail.com"),
        Contact(id: 11, name: "Totti", phoneNumber: "8010937498", email: "rirniuu@gmail.com"),
        Contact(id: 12, name: "Totti", phoneNumber: "8010937498", email: "rirniuu@gmail.com"),
        Contact(id: 13, name: "Totti", phoneNumber: "8010937498", email: "rirniuu@gmail.com")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Contacts"
        view.backgroundColor = .white
        setupTableView()
        
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        tableView.register(ContactTableViewCell.self, forCellReuseIdentifier: ContactTableViewCell.identifier)
        
        tableView.dataSource = self
        
    }
}

extension ContactListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ContactTableViewCell.identifier, for: indexPath) as! ContactTableViewCell
        
        let contact = contacts[indexPath.row]
        cell.configure(with: contact)
        return cell
        
        /*
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "ContactCell")
        let contact = contacts[indexPath.row]
        cell.textLabel?.text = contact.name
        cell.detailTextLabel?.text = contact.phoneNumber
        
        return cell
         */
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
}
