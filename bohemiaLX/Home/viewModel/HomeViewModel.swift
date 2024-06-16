//
//  HomeViewModel.swift
//  bohemiaLX
//
//  Created by Pedro Ribeiro on 27/03/2024.
//

import UIKit
import Firebase

class HomeViewModel {

    private var auth = Auth.auth()
    
    public func login(email: String, password: String) {
        auth.signIn(withEmail: email, password: password) { authResult, error in
            if error == nil {
                print("sucess login")
            } else {
                print("Error login: \(error?.localizedDescription ?? "")")
            }
        }
    }
    
    
}
