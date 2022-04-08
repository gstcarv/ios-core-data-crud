//
//  ContactsTableViewController.swift
//  CoreDataContacts
//
//  Created by Gustavo Carvalho on 08/04/22.
//

import UIKit

class ContactsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var addContactButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self;
        tableView.dataSource = self;
        
        addContactButton.layer.shadowColor = UIView().tintColor.cgColor
        addContactButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        addContactButton.layer.shadowOpacity = 0.5
        addContactButton.layer.shadowRadius = 10
        addContactButton.layer.masksToBounds = false
        addContactButton.layer.cornerRadius = 4.0
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath);
        
        return cell;
    }
}
