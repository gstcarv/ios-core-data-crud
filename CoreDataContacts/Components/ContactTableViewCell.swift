//
//  ContactTableViewCell.swift
//  CoreDataContacts
//
//  Created by Gustavo Carvalho on 08/04/22.
//

import UIKit

class ContactTableViewCell: UITableViewCell {

    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
