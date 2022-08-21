//
//  SignInVM.swift
//  NewsApp
//
//  Created by Uresha Lakshani on 2022-08-21.
//

import Foundation

class SignInVM: ObservableObject{
    
    @Published var isShowAlert = false
    @Published var alertMessage = ""
    @Published var alertTitle = ""
    
    @Published var email : String = ""
    @Published var password : String = ""
    
}

//Validator
extension SignInVM{
    
    func validateFields() -> Bool{
        if !Validator().isValidEmail(email) || email.isEmpty{
            isShowAlert = true
            alertMessage = "Invalid email address"
            alertTitle = "Error"
            return false
        }else if !Validator().isValidPasswordValidator(value: password) || password.isEmpty {
            isShowAlert = true
            alertMessage = "Invalid password"
            alertTitle = "Error"
            return false
        }
        
        return true
    }
    
}

//SignIn
extension SignInVM{
    func signIn() -> Bool{
        let res = PersistenceController.shared.loginUser(email: email, password: password)
        if res != nil && res!.status{
            return true
        }else{
            isShowAlert = true
            alertMessage = res?.message ?? "error"
            alertTitle = "Error"
            return false
        }
        
    }
}
