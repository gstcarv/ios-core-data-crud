//
//  ContactCoreDataManager.swift
//  CoreDataContacts
//
//  Created by Gustavo Carvalho on 08/04/22.
//

import Foundation
import CoreData

class ContactCoreDataManager: CoreDataManager<ContactRegisterData, Contact> {
    
    override init() {
        super.init()
    }
    
    override func add(_ entity: ContactRegisterData) throws -> Contact {
        let contact = Contact(context: self.getContext())
        
        contact.name = entity.name
        contact.email = entity.email
        contact.phoneNumber = entity.phoneNumber
        contact.createdAt = Date.now
        contact.image = entity.image.jpegData(compressionQuality: 1)
        
        try self.getContext().save()
        
        return contact
    }
    
    override func getAll() throws -> [Contact] {
        let fetchRequest = Contact.fetchRequest();
        
        let sortByDate = NSSortDescriptor(key: #keyPath(Contact.createdAt), ascending: false)
        
        fetchRequest.sortDescriptors = [sortByDate]
        
        return try getContext().fetch(fetchRequest)
    }
    
    override func getById(id: NSManagedObjectID) throws -> Contact {
        return try getContext().existingObject(with: id) as! Contact
    }
}
