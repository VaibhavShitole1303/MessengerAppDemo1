//
//  AuthService.swift
//  MessengerAppDemo
//
//  Created by Neosao Services on 23/04/24.
//

import Foundation
import Firebase

class AuthService {
    
    @Published var  userSession : FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
        print("DEBUG : user session id \(userSession?.uid)")
    }
    func loginUser(withEmail email: String , password :String) async throws{
        print("DEBUG :login  with email \(email) /n password \(password)")
        do{
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
        }catch{
            print(" DEBUG :Failed to Sign in user \(error.localizedDescription)")
        }
    }
    
    func createUser(withEmail email: String , password :String, fullName: String) async throws{
        do{
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            print("DEBUG :created user \(result.user.uid)")
        }catch{
            print(" DEBUG :Failed to created user \(error.localizedDescription)")
        }
    }
    
    func signOut(){
        do{
            try Auth.auth().signOut()    // this sign out on back end
            self.userSession = nil  // this update routing logic
        }catch{
            print("DEBUG : Error \(error.localizedDescription)")
        }
    }
}
