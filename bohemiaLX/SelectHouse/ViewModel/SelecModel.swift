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
            // Realiza o logout do usuário
            try Auth.auth().signOut()
            
            // Limpa o token de autenticação dos UserDefaults
            UserDefaults.standard.removeObject(forKey: "authToken")
            UserDefaults.standard.set(false, forKey: "UsuarioLogado") // Define o status de login como falso
            
            // Chama a conclusão com sucesso
            completion(.success(()))
        } catch let error {
            // Em caso de erro, chama a conclusão com o erro
            completion(.failure(error))
        }
    }
}
