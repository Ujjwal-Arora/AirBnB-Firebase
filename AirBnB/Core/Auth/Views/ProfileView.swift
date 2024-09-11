//
//  ProfileView.swift
//  AirBnB
//
//  Created by Ujjwal Arora on 11/09/24.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct ProfileView: View {
    @StateObject private var vm = AuthViewModel()
    var body: some View {
        VStack{
            Text(vm.profilePhotoUrl ?? "no photo url")
            
            Text(Auth.auth().currentUser?.email ?? "no user")
            
            Text(vm.authService.currentUser?.email ?? "no user")
            
            NavigationLink {
                LoginView(vm: vm)
            } label: {
                Text("LogIn")
            }
            NavigationLink {
                SignUpView(vm: vm)
            } label: {
                Text("Create an acount")
            }
            Button("signOut") {
                
                vm.signOut()
            }

        }.navigationTitle("Profile view")
    }
    
}

#Preview {
    NavigationStack{
        ProfileView()
    }
}
