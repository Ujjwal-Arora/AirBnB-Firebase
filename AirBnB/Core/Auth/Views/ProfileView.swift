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
            Text(vm.profilePhotoUrl ?? "no photo url in publisher")
            
            Text(vm.currentUser?.profilePhotoUrl ?? "no photo url in current user")
            
            if let imageUrlString = vm.currentUser?.profilePhotoUrl{
                let url = URL(string: imageUrlString)
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                } placeholder: {
                    ProgressView()
                }
            }else {
                Text("no image in async image")
            }
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
