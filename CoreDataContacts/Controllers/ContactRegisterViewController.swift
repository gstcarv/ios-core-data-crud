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
    @IBOutlet weak var photoThumbnail: UIButton!
    
    public var editingContact: Contact? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if editingContact != nil {
            nameField.text = editingContact?.name
            emailField.text = editingContact?.email
            phoneNumberField.text = editingContact?.phoneNumber
            
            if let image = editingContact?.image {
                photoThumbnail.setBackgroundImage(UIImage(data: image), for: .normal)
                userHasSelectedImage = true
            }
            
            saveButton.setTitle("Update contact", for: .normal)
            navigationItem.title = "Edit \(editingContact!.name ?? "")"
        }
        
        validateFields()
    }
    
    @IBAction func handleSaveContact(_ sender: UIButton) {
        let contactData = ContactRegisterData()
        
        contactData.name = nameField!.text
        contactData.email = emailField!.text
        contactData.phoneNumber = phoneNumberField!.text
        contactData.image = photoThumbnail.backgroundImage(for: .normal)
        
        let contactsManager = ContactCoreDataManager()
        
        do {
            if editingContact == nil {
                _ = try contactsManager.add(contactData)
            } else {
                _ = try contactsManager.update(id: editingContact!.objectID, entity: contactData)
            }
            
            self.navigationController?.popViewController(animated: true)
        } catch {
            ErrorHelper.handleError(self, message: "Error occurs saving contact. Try again later")
        }
    }
    
    @IBAction func onPhotoChangePress(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func onChangeField(_ sender: Any) {
        validateFields()
    }
    
    var userHasSelectedImage = false
    
    func validateFields () {
        var isValid = true
        
        if (!userHasSelectedImage) {
            isValid = false
        }
        
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

extension ContactRegisterViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate  {
 
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
        if let selected = info[.editedImage] as? UIImage {
            photoThumbnail.setBackgroundImage(selected, for: .normal)
            userHasSelectedImage = true
        }
        
        validateFields()
        picker.dismiss(animated: true, completion: nil)
    }
    
}
