//
//  PersistenceController.swift
//  NewsApp
//
//  Created by Uresha Lakshani on 2022-08-21.
//

import Foundation
import CoreData

class PersistenceController {
    
    static let shared = PersistenceController()
    
    private init() {}
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "UserDB")
        container.loadPersistentStores(completionHandler: { _, error in
            _ = error.map { fatalError("Unresolved error \($0)") }
        })
        return container
    }()
    
    var mainContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func backgroundContext() -> NSManagedObjectContext {
        return persistentContainer.newBackgroundContext()
    }
}

extension PersistenceController{
    
    func saveUser(email : String, password : String) ->  AuthResponse?{
        
        let context = PersistenceController.shared.backgroundContext()
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "email == %@", email)
        
        do{
            let results = try context.fetch(fetchRequest)
            if results.count == 0{
                
                print("No User data")
                let entity = User.entity()
                let userData = User(entity: entity, insertInto: context)
                userData.email = email
                userData.password = password
                
                do {
                    try context.save()
                    self.saveLoggedUser(email: email)
                    return  AuthResponse(status: true, message: "Success")
                } catch let error {
                    print("Error: \(error)")
                }
                
            }else{
                return  AuthResponse(status: false, message: "You have already register")
              
            }
        }catch{
            debugPrint(error)
        }
        
        return nil
    }
    
    func saveLoggedUser(email : String){
        let context = PersistenceController.shared.backgroundContext()
        
        let entity = LoggedUser.entity()
        let userData = LoggedUser(entity: entity, insertInto: context)
        userData.email = email
        
        do {
            try context.save()
           
        } catch let error {
            print("Error: \(error)")
        }
        
    }
    
    func loadUserData() -> LoggedUser? {
        let context = PersistenceController.shared.backgroundContext()
        let fetchRequest: NSFetchRequest<LoggedUser> = LoggedUser.fetchRequest()
        
        do {
            let result = try context.fetch(fetchRequest).first
            return result
        }
        catch {
            debugPrint(error)
        }
        
        return nil
    }
    
    func loginUser(email : String, password : String) -> AuthResponse?{
        let context = PersistenceController.shared.backgroundContext()
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "email = %@ AND password = %@", email, password)
        
        do{
            let results = try context.fetch(fetchRequest)
            if results.count == 0{
                return AuthResponse(status: false, message: "Invalid signin credentials please check email & password")
            }else{
                self.saveLoggedUser(email: email)
                return AuthResponse(status: true, message: "Success")
            }
        }catch{
            debugPrint(error)
        }
        
        return nil
    }
    
    func deleteUserData() {
        let context = PersistenceController.shared.backgroundContext()
        let fetchRequest: NSFetchRequest<LoggedUser> = LoggedUser.fetchRequest()
        
        do {
            let userData = try context.fetch(fetchRequest)
            userData.forEach{ context.delete($0) }
            
            do {
                try context.save()
            } catch let error {
                print("Error: \(error)")
            }
        } catch let error {
            print("Error: \(error)")
        }
    }
    
}

struct AuthResponse{
    var status : Bool
    var message : String
}
