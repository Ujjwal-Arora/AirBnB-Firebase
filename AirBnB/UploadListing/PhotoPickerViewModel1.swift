//
//  PhotoPickerViewModel1.swift
//  AirBnB
//
//  Created by Ujjwal Arora on 12/09/24.
//

import Foundation
import PhotosUI
import SwiftUI
import Firebase
import FirebaseStorage

@MainActor
class PhotoPickerViewModel1 : ObservableObject {
   // @Published var selectedPickerItems = [PhotosPickerItem]()
    @Published var outputUiImages = [UIImage]()
    @Published var firebaseStorageImageUrls = [String]()
    
    func loadPhotoPickerImage(selectedItems: [PhotosPickerItem]) async throws {
        outputUiImages.removeAll()
        for item in selectedItems {
            guard let data = try? await item.loadTransferable(type: Data.self) else {return}
            guard let image = UIImage(data: data) else {return}
            outputUiImages.append(image)
        }
    }
    func uploadUiImageToFirebaseStorage(folderName : String) async throws{
        firebaseStorageImageUrls.removeAll()
        for image in outputUiImages{
            guard let data = image.jpegData(compressionQuality: 0.1) else {return}
            let filename = UUID().uuidString
            let storageReference = Storage.storage().reference(withPath: "\(folderName)/\(filename)")
            do{
                let _ = try? await storageReference.putDataAsync(data)
                let url = try await storageReference.downloadURL()
                firebaseStorageImageUrls.append(url.absoluteString)
            }catch{
                print(error.localizedDescription)
            }
        }
    }
}
