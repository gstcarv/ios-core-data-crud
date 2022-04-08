//
//  CoreDataManager.swift
//  CoreDataContacts
//
//  Created by Gustavo Carvalho on 08/04/22.
//

import Foundation
import CoreData
import UIKit

class CoreDataManager<T, U> {
    
    private var persistentContainer: NSPersistentContainer!
    
    internal init() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        persistentContainer = appDelegate.persistentContainer
    }
    
    internal final func getContext () -> NSManagedObjectContext {
        return persistentContainer.viewContext;
    }
    
    func add(_ entity: T) throws -> U {
        fatalError("Not implemented")
    }
    
    func update (id: UUID, entity: T) throws -> U {
        fatalError("Not implemented")
    }
    
    func delete (id: UUID) throws {
        fatalError("Not implemented")
    }
    
    func getAll () throws -> [U] {
        fatalError("Not implemented")
    }
    
}
