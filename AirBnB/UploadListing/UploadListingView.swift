//
//  UploadListingView.swift
//  AirBnB
//
//  Created by Ujjwal Arora on 11/09/24.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import PhotosUI

struct UploadListingView: View {
    @ObservedObject var vm : AuthViewModel
    @StateObject var photoPickerVM = PhotoPickerViewModel1()
    @State private var selectedPickerItemsInUploadListingView = [PhotosPickerItem]()


    
    @State private var title = "Goa Villa"
    @State private var rating = 3.5
    @State private var pricePerNight = 1000
   // @State private var ownerId = UUID().uuidString
  //  @State private var ownerName = "Ujjwal"
  //  @State private var ownerImageUrl = ""
    @State private var maximumGuests = 4
    @State private var numberOfBedrooms = 4
    @State private var numberOfBathrooms = 4
    @State private var latitude = 0.0
    @State private var longitude = 0.0
    @State private var address = "Church Street"
    @State private var city = "Panji"
    @State private var state = "Goa"
    @State private var country = "India"
    @State private var imageUrl = [String]()
    @State private var amenities = [Amenitie]()
    @State private var features = [Feature]()
    @State private var buildingType : BuildingType = .villa
    

    var body: some View {
        Text(vm.currentUser?.fullname ?? "no user")
        
        TextField("title", text: $title)

        Stepper("maximum guests \(maximumGuests)", value: $maximumGuests)
        Stepper("numberOfBedrooms \(numberOfBedrooms)", value: $numberOfBedrooms)
        Stepper("numberOfBathrooms \(numberOfBathrooms)", value: $numberOfBathrooms)
        
        TextField("address", text: $address)
        TextField("city", text: $city)
        TextField("state", text: $state)

        TextField("country", text: $country)
        PhotosPicker("upload photos", selection: $selectedPickerItemsInUploadListingView, maxSelectionCount: 10)
            .onChange(of: selectedPickerItemsInUploadListingView) { oldValue, newValue in
                Task{
                    try await photoPickerVM.loadPhotoPickerImage(selectedItems: selectedPickerItemsInUploadListingView)
                }
            }

        ScrollView(.horizontal) {
            HStack{
                ForEach(photoPickerVM.outputUiImages,id: \.self){ uiImage in
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                    
                }
            }
        }
        
        Button("save listing") {
            Task{
                if !selectedPickerItemsInUploadListingView.isEmpty {
                    try await photoPickerVM.uploadUiImageToFirebaseStorage(folderName: "listingsImages")
                    imageUrl = photoPickerVM.firebaseStorageImageUrls
                }
                try await uploadUserDataToFirestore(id: UUID().uuidString)
            }
        }
    }
    func uploadUserDataToFirestore(id : String) async throws{
        if let user = vm.currentUser{
            let newListing = ListingsModel(title: title, rating: rating, pricePerNight: pricePerNight, ownerId: vm.currentUser?.id ?? UUID().uuidString, ownerName: vm.currentUser?.fullname ?? "", ownerImageUrl: vm.currentUser?.profilePhotoUrl ?? "", maximumGuests: maximumGuests, numberOfBedrooms: numberOfBedrooms, numberOfBathrooms: numberOfBathrooms, latitude: latitude, longitude: longitude, address: address, city: city, state: state, country: country, imageUrl: imageUrl, amenities: amenities, features: features, buildingType: buildingType, actualOwner: user)
            print(newListing)
            guard let encodedListing = try? Firestore.Encoder().encode(newListing) else { return }
            try await Firestore.firestore().collection("listings").document(id).setData(encodedListing)
        }
    }
}

#Preview {
    UploadListingView(vm: AuthViewModel())
}
