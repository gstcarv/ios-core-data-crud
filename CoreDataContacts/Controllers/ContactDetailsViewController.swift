//
//  ContactDetailsViewController.swift
//  CoreDataContacts
//
//  Created by Gustavo Carvalho on 08/04/22.
//

import UIKit
import CoreData

class ContactDetailsViewController: UIViewController {

    public var selectedContactId: NSManagedObjectID!;
    
    private var contactData: Contact!
    
    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "openEditContact" {
            let contactRegisterController = segue.destination as! ContactRegisterViewController
            
            contactRegisterController.editingContact = contactData
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        do {
            let contactManager = ContactCoreDataManager()
            
            contactData = try contactManager.getById(id: selectedContactId)
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/YYYY"
            
            nameLabel.text = contactData.name
            emailLabel.text = contactData.email
            phoneLabel.text = contactData.phoneNumber
            createdAtLabel.text = dateFormatter.string(from: contactData.createdAt!)
            
            if let imageData = contactData.image {
                photoImage.image = UIImage(data: imageData)
            }
            
            
        } catch {
            ErrorHelper.handleError(self, message: "Error occurs when loading contact details")
            self.navigationController?.popViewController(animated: true)
        }
    }

}
