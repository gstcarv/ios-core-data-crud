//
//  ContactRegisterViewController.swift
//  CoreDataContacts
//
//  Created by Gustavo Carvalho on 08/04/22.
//

import UIKit

class ContactRegisterViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var phoneNumberField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        validateFields()
    }
    
    @IBAction func handleSaveContact(_ sender: UIButton) {
        let contactData = ContactRegisterData()
        
        contactData.name = nameField!.text
        contactData.email = emailField!.text
        contactData.phoneNumber = phoneNumberField!.text
        
        let contactsManager = ContactCoreDataManager()
        
        do {
            _ = try contactsManager.add(contactData)
            self.navigationController?.popViewController(animated: true)
        } catch {
            ErrorHelper.handleError(self, message: "Error occurs saving contact. Try again later")
        }
    }
    
    @IBAction func onChangeField(_ sender: Any) {
        validateFields()
    }
    
    func validateFields () {
        var isValid = true
        
        if  nameField.text!.isEmpty || nameField.text!.count < 4 {
            isValid = false
        }
        
        if emailField.text!.isEmpty || !emailField.text!.contains("@") || !emailField.text!.contains(".") || nameField.text!.count < 4 {
            isValid = false
        }
        
        if phoneNumberField.text!.isEmpty || phoneNumberField.text!.count < 8 {
            isValid = false
        }
        
        if isValid {
            saveButton.isEnabled = true
        } else {
            saveButton.isEnabled = false
        }
    }
}
