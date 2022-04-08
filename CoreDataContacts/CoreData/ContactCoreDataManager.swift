//
//  ContactCoreDataManager.swift
//  CoreDataContacts
//
//  Created by Gustavo Carvalho on 08/04/22.
//

import Foundation

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
        
        try self.getContext().save()
        
        return contact
    }
    
    override func getAll() throws -> [Contact] {
        return try getContext().fetch(Contact.fetchRequest())
    }
    
}