//
//  LoginViewModel.swift
//  Location
//
//  Created by macbook on 26/07/2022.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    let mockApi = MockApi()
    var profile: DataInformationElement? = nil
    var map: DataInformationElement? = nil
    var information: DataInformationElement? = nil
    
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    private func isPasswordValid(_ password : String) -> Bool{
        let passwordFormat = "^(?=.*[A-Z])(?=.*[a-z])(?=.*?[0-9])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", passwordFormat)
        return passwordTest.evaluate(with: password)
    }
    
    private func validView(email: String, password: String) -> String? {
        if !self.isValidEmail(email) {
            return "Email is invalid"
        }
        
        if !self.isPasswordValid(password) {
            return "Password is invalid"
        }
        
        // Do same like other validation as per needed
        
        return nil
        
    }

    func loginSubmit(email: String, password: String)  -> String?{
       
        return validView(email: email, password: password)
    }
}
