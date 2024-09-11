//
//  SignUpView.swift
//  AirBnB
//
//  Created by Ujjwal Arora on 11/09/24.
//

import SwiftUI
import Firebase
import FirebaseAuth
import PhotosUI

struct SignUpView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var vm : AuthViewModel
    @StateObject var photoPickerVM = PhotoPickerViewModel()

    var body: some View {
        VStack{
            if let uiImage = photoPickerVM.outputUiImage{
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
            }else {
                Image(systemName: "person.circle")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
            }
            
            Button("click for storage") {
                Task{
                    try await photoPickerVM.uploadUiImageToFirebaseStorage()
                }
            }
            Text(photoPickerVM.imageUrl ?? "no url")
            
            PhotosPicker(selection: $photoPickerVM.selectedPickerItem) {
                Text("Chage Profile Photo")
            }
            
            TextField("Enter email", text: $vm.email)
            TextField("Enter password", text: $vm.password)
            Text(Auth.auth().currentUser?.email ?? "no user")

            Text(vm.authService.currentUser?.email ?? "no user")
            Button("SignUp") {
                Task{
                    if photoPickerVM.outputUiImage != nil {
                        try await photoPickerVM.uploadUiImageToFirebaseStorage()
                        vm.profilePhotoUrl = photoPickerVM.imageUrl
                    }
                    try await vm.signUp()
                    if vm.currentAuthUserSession != nil{
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
