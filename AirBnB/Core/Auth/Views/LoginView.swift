//
//  LoginView.swift
//  AirBnB
//
//  Created by Ujjwal Arora on 11/09/24.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct LoginView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var vm : AuthViewModel
    var body: some View {
        VStack{
            TextField("Enter email", text: $vm.email)
            TextField("Enter password", text: $vm.password)
            Text(Auth.auth().currentUser?.email ?? "no user")

            Text(vm.authService.currentUser?.email ?? "no user")
            Button("logIn") {
                Task{
                    try await vm.logIn()
                    if vm.currentAuthUserSession != nil{
                        dismiss()
                    }
                }
            }
        }.navigationTitle("LogIn View")
    }
}

#Preview {
    NavigationStack{
        LoginView(vm: AuthViewModel())
    }
}
