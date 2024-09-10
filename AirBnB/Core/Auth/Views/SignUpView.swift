//
//  SignUpView.swift
//  AirBnB
//
//  Created by Ujjwal Arora on 11/09/24.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct SignUpView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var vm : AuthViewModel

    var body: some View {
        VStack{
            TextField("Enter email", text: $vm.email)
            TextField("Enter password", text: $vm.password)
            Text(Auth.auth().currentUser?.email ?? "no user")

            Text(vm.authService.currentUser?.email ?? "no user")
            Button("SignUp") {
                Task{
                    try await vm.signUp()
                    if vm.currentUserSession != nil{
                        dismiss()
                    }
                }
            }

        }.navigationTitle("SignUp view")
    }
}

#Preview {
    NavigationStack{
        SignUpView(vm: AuthViewModel())
    }
}
