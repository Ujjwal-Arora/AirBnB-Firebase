//
//  PhotoPickerViewModel.swift
//  AirBnB
//
//  Created by Ujjwal Arora on 11/09/24.
//

import Foundation
import PhotosUI
import SwiftUI
import Firebase
import FirebaseStorage

@MainActor
class PhotoPickerViewModel : ObservableObject {
    @Published var selectedPickerItem : PhotosPickerItem?{
        didSet{
            Task{
                try await loadImage()
            }
        }
    }
    @Published var outputUiImage : UIImage?
    @Published var imageUrl : String?
    
    func loadImage() async throws {
        guard let data = try? await selectedPickerItem?.loadTransferable(type: Data.self) else {return}
        outputUiImage = UIImage(data: data)
    }
    func uploadUiImageToFirebaseStorage() async throws{
        guard let data = outputUiImage?.jpegData(compressionQuality: 0.1) else {return}
        let filename = UUID().uuidString
        let storageReference = Storage.storage().reference(withPath: "profileImage/\(filename)")
        do{
            let _ = try? await storageReference.putDataAsync(data)
            let url = try await storageReference.downloadURL()
            imageUrl = url.absoluteString
        }catch{
            print(error.localizedDescription)
        }
    }
}
