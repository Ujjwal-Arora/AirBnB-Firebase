//
//  AuthViewModel.swift
//  AirBnB
//
//  Created by Ujjwal Arora on 11/09/24.
//

import Foundation
import Firebase
import FirebaseAuth

@MainActor
class AuthViewModel : ObservableObject {
    @Published var currentUserSession : FirebaseAuth.User? = nil
    
    @Published var email : String = ""
    @Published var password : String = ""

    var authService = Auth.auth()
    
    init() {
        currentUserSession = authService.currentUser
    }
    func logIn() async throws{
        do {
            let result = try await authService.signIn(withEmail: email, password: password)
            self.currentUserSession =  result.user
            print("login func done : \(result.user.email ?? "no user")")

        }catch{
            print(error.localizedDescription)
        }
    }
    func signUp() async throws{
        do {
            let result = try await authService.createUser(withEmail: email, password: password)
            self.currentUserSession =  result.user
            print("signup func done : \(result.user.email ?? "no user")")

        }catch{
            print(error.localizedDescription)
        }
    }
    func signOut(){
        do {
            try authService.signOut()
            self.currentUserSession = nil
            print("signOut func done : \(currentUserSession?.email ?? "no user")")


        }catch{
            print(error.localizedDescription)
        }
    }
}
