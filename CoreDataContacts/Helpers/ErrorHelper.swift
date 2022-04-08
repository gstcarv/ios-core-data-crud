//
//  ErrorHelper.swift
//  CoreDataContacts
//
//  Created by Gustavo Carvalho on 08/04/22.
//

import Foundation
import UIKit

class ErrorHelper {
    
    static func handleError(_ context: UIViewController, message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        context.present(alert, animated: true, completion: nil)
    }
    
}
