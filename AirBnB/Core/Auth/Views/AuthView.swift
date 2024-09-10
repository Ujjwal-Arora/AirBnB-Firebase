//
//  AuthView.swift
//  AirBnB
//
//  Created by Ujjwal Arora on 11/09/24.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct AuthView: View {
    @StateObject private var vm = AuthViewModel()
    var body: some View {
        TextField("Enter email", text: $vm.email)
        TextField("Enter password", text: $vm.password)
        Text(Auth.auth().currentUser?.email ?? "no user")

        Text(vm.authService.currentUser?.email ?? "no user")
        Button("logIn") {
            Task{
                try await vm.logIn()
            }
        }
        Button("SignUp") {
            Task{
                try await vm.signUp()
            }
        }
        Button("signOut") {
            
                 vm.signOut()
        }
    }
    
}

#Preview {
    AuthView()
}
