//
//  PasswordModel.swift
//  bohemiaLX
//
//  Created by Pedro Ribeiro on 23/05/2024.
//

import Foundation
import FirebaseAuth

class PasswordViewModel {
    
    func resetPassword(email: String, completion: @escaping (Result<Void, Error>) -> Void) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(()))
            }
        }
    }
}
