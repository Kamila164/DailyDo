//
//  AuthManager.swift
//  DailyDo
//
//  Created by Kamila on 9/5/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class AuthManager {
    static let share = AuthManager()
    private let db = Firestore.firestore()
    private let auth = Auth.auth()
    
    private init() {}
    
    func registerUser(with userRequest: RegisterUserRequest, completion: @escaping (Bool, Error?) -> Void) {
        let userName = userRequest.userName
        let email = userRequest.email
        let password = userRequest.password
        
        auth.createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(false, error)
                return
            }
            
            guard let resultUser = result?.user else {
                completion(false, nil)
                return
            }
            
            self.db.collection("users")
                .document(resultUser.uid)
                .setData([
                    "username": userName,
                    "email": email
                ]) { error in
                    if let error = error {
                        completion(false, error)
                        return
                    }
                    completion(true, nil)
                }
        }
    }
    
}
