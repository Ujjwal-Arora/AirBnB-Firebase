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
    @StateObject var photoPickerVM = PhotoPickerViewModel1()
    @State private var selectedPickerItemInSignUp : PhotosPickerItem?

    var body: some View {
        VStack{
            if let uiImage = photoPickerVM.outputUiImages.first{
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
                    try await photoPickerVM.uploadUiImageToFirebaseStorage(folderName: "profileImages")
                }
            }
            Text(photoPickerVM.firebaseStorageImageUrls.first ?? "no url")
            
            PhotosPicker(selection: $selectedPickerItemInSignUp) {
                Text("Chage Profile Photo")
            }.onChange(of: selectedPickerItemInSignUp) { oldValue, newValue in
                if let item = newValue{
                    Task{
                        try await photoPickerVM.loadPhotoPickerImage(selectedItems: [item])
                    }
                }
            }
            
            TextField("Enter fullname", text: $vm.fullname)
            TextField("Enter email", text: $vm.email)
            TextField("Enter password", text: $vm.password)
            Text(Auth.auth().currentUser?.email ?? "no user")

            Text(vm.authService.currentUser?.email ?? "no user")
            Button("SignUp") {
                Task{
// changed this     if photoPickerVM.outputUiImage != nil {
                    if selectedPickerItemInSignUp != nil {
                        try await photoPickerVM.uploadUiImageToFirebaseStorage(folderName: "profileImages")
                        vm.profilePhotoUrl = photoPickerVM.firebaseStorageImageUrls.first
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
