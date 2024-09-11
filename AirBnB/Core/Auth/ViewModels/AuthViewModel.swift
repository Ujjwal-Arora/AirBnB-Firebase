//
//  AuthViewModel.swift
//  AirBnB
//
//  Created by Ujjwal Arora on 11/09/24.
//

import Foundation
import Firebase
import FirebaseAuth
import SwiftUI
import FirebaseFirestore

@MainActor
class AuthViewModel : ObservableObject {
    @Published var currentUserSession : FirebaseAuth.User? = nil
    
    @Published var email : String = ""
    @Published var password : String = ""
    @Published var fullname : String = ""
    @Published var profilePhoto : Image?
    @Published var profilePhotoUrl : String?

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
            try await self.uploadUserDataToFirestore(id : result.user.uid)

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
    func uploadUserDataToFirestore(id : String) async throws{
        let newUser = UsersModel(email: email, password: password, profilePhotoUrl: profilePhotoUrl)
        guard let encodedUser = try? Firestore.Encoder().encode(newUser) else { return }
        try await Firestore.firestore().collection("users").document(id).setData(encodedUser)
    }
}
