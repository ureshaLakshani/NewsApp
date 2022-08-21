//
//  SignUpVM.swift
//  NewsApp
//
//  Created by Uresha Lakshani on 2022-08-21.
//

import Foundation

class SignUpVM: ObservableObject{
    
    //MARK: - Variables
    @Published var isShowAlert = false
    @Published var alertMessage = ""
    @Published var alertTitle = ""
    
    @Published var email : String = ""
    @Published var password : String = ""
    @Published var confirmPassword : String = ""
}

//Validator
extension SignUpVM{
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
        }else if !Validator().confirmPasswordValidator(value: password, value2: confirmPassword) || confirmPassword.isEmpty{
            isShowAlert = true
            alertMessage = "Password and Confirm password does not match"
            alertTitle = "Error"
            return false
        }
        
        return true
    }
}

//SignUp
extension SignUpVM{
    func signUp() -> Bool{
        let res = PersistenceController.shared.saveUser(email: email, password: password)
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
