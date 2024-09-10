//
//  PhotoPickerViewModel.swift
//  AirBnB
//
//  Created by Ujjwal Arora on 11/09/24.
//

import Foundation
import PhotosUI
import SwiftUI

class PhotoPickerViewModel : ObservableObject {
    @Published var selectedPickerItem : PhotosPickerItem?
    @Published var profileImage : Image?
    
    func loadImage() async throws {
        guard let data = try? await selectedPickerItem?.loadTransferable(type: Data.self) else {return}
        guard let uiImage = UIImage(data: data) else {return}
        profileImage = Image(uiImage: uiImage)
        
        
    }
}
