//
//  RegisterModel.swift
//  bohemiaLX
//
//  Created by Pedro Ribeiro on 23/05/2024.
//

import Foundation
import Firebase
import FirebaseAuth

class RegisterModel {
    
    private var auth = Auth.auth()
    
    public func registerUser(email: String, password: String) {
        auth.createUser(withEmail: email, password: password) { authResult, error in
            if error == nil {
                print("sucess register")
            } else {
                print("Error register: \(error?.localizedDescription ?? "")")
            }
        }
    }
    
}
