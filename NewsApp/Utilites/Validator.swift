//
//  Validator.swift
//  NewsApp
//
//  Created by Uresha Lakshani on 2022-08-21.
//

import Foundation

class Validator{
    
    func isValidEmail(_ email: String) -> Bool{
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func isValidPasswordValidator(value : String) -> Bool{
        if(value.count > 7){
           return true
        }
        return false
    }
    
    func confirmPasswordValidator(value : String, value2 : String?) -> Bool {
        if(value.count < 7){
            return false
        }
        if(value != value2){
            return false
        }
        return true
    }
}
