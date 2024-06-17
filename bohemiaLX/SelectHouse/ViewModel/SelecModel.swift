//
//  SelecModel.swift
//  bohemiaLX
//
//  Created by Pedro Ribeiro on 23/05/2024.
//

import Foundation
import FirebaseAuth

class AuthViewModel {
    
    func logout(completion: @escaping (Result<Void, Error>) -> Void) {
        do {
            try Auth.auth().signOut()
            completion(.success(()))
        } catch let error {
            completion(.failure(error))
        }
    }
}
