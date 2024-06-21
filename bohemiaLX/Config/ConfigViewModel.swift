import Foundation
import FirebaseAuth

class ConfigViewModel {
    
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
    
    func deleteAccount(withPassword password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        guard let user = Auth.auth().currentUser, let email = user.email else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Nenhum usuário logado"])))
            return
        }
        
        let credential = EmailAuthProvider.credential(withEmail: email, password: password)
        
        user.reauthenticate(with: credential) { authResult, error in
            if let error = error {
                completion(.failure(error))
            } else {
                user.delete { error in
                    if let error = error {
                        completion(.failure(error))
                    } else {
                        completion(.success(()))
                    }
                }
            }
        }
    }
}

