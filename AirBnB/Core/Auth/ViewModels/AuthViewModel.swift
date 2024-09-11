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
    @Published var currentAuthUserSession : FirebaseAuth.User? = nil
    @Published var currentUser : UsersModel?
    
    @Published var email : String = ""
    @Published var password : String = ""
    @Published var fullname : String = ""
    @Published var profilePhoto : Image?
    @Published var profilePhotoUrl : String?

    var authService = Auth.auth()
    
    init() {
        Task{
            try await fetchUserDataFromFirestore()
        }
    }
    func logIn() async throws{
        do {
            let result = try await authService.signIn(withEmail: email, password: password)
            self.currentAuthUserSession =  result.user
            print("login func done : \(result.user.email ?? "no user")")
            try await fetchUserDataFromFirestore()

        }catch{
            print(error.localizedDescription)
        }
    }
    func signUp() async throws{
        do {
            let result = try await authService.createUser(withEmail: email, password: password)
            self.currentAuthUserSession =  result.user
            print("signup func done : \(result.user.email ?? "no user")")
            try await self.uploadUserDataToFirestore(id : result.user.uid)
            try await fetchUserDataFromFirestore()
        }catch{
            print(error.localizedDescription)
        }
    }
    func signOut(){
        do {
            try authService.signOut()
            self.currentAuthUserSession = nil
            self.currentUser = nil
            print("signOut func done : \(currentAuthUserSession?.email ?? "no user")")
        }catch{
            print(error.localizedDescription)
        }
    }
    func uploadUserDataToFirestore(id : String) async throws{
        let newUser = UsersModel(email: email, password: password, profilePhotoUrl: profilePhotoUrl,fullname: fullname)
        guard let encodedUser = try? Firestore.Encoder().encode(newUser) else { return }
        try await Firestore.firestore().collection("users").document(id).setData(encodedUser)
    }
    func fetchUserDataFromFirestore() async throws{
        self.currentAuthUserSession = authService.currentUser
        guard let uid = currentAuthUserSession?.uid else {return}
        self.currentUser = try await Firestore.firestore().collection("users").document(uid).getDocument(as: UsersModel.self)
        print(currentUser ?? "no user")
    }
}
