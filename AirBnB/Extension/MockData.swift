//
//  DeveloperPreview.swift
//  AirBnB
//
//  Created by Ujjwal Arora on 08/09/24.
//

import Foundation

struct MockData {
    static var exampleListings : [ListingsModel] = [
        ListingsModel(title: "Goa Villa", rating: 4.35, pricePerNight: 3500, ownerId: UUID().uuidString, ownerName: "Ujjwal", ownerImageUrl: "ironman", maximumGuests : 4, numberOfBedrooms: 8, numberOfBathrooms: 2, latitude: 15.5010, longitude: 73.8294, address: "Church Street", city: "Panaji", state: "Goa", country: "India", imageUrl: ["tree","lotus"], amenities: [.selfCheckIn,.superHost], features: [.pool,.petsAllowed,.wifi,.fireSafety], buildingType: .villa, actualOwner: UsersModel(email: "Ujjwal@gmail.com", profilePhotoUrl: "", fullname: "Ujjwal Arora")),
//        ListingsModel(title: "Mumbai Villa", rating: 3.75, pricePerNight: 5000, ownerId: UUID().uuidString, ownerName: "Anju", ownerImageUrl: "minnion", maximumGuests : 4, numberOfBedrooms: 3, numberOfBathrooms: 3, latitude: 19.0760, longitude: 72.8777, address: "India Gate", city: "Mumbai", state: "Maharasthra", country: "India", imageUrl: ["wallpaper1","wallpaper2"], amenities: [.superHost], features: [.kitchen,.wifi,.alarmSystem], buildingType: .flat),
//        ListingsModel(title: "Goa Villa", rating: 4.35, pricePerNight: 3500, ownerId: UUID().uuidString, ownerName: "Ujjwal", ownerImageUrl: "ironman", maximumGuests : 4, numberOfBedrooms: 2, numberOfBathrooms: 2, latitude: 15.5010, longitude: 73.8294, address: "Church Street", city: "Panaji", state: "Goa", country: "India", imageUrl: ["tree","lotus"], amenities: [.selfCheckIn,.superHost], features: [.pool,.wifi,.fireSafety], buildingType: .villa),
//        ListingsModel(title: "Mumbai Villa", rating: 3.75, pricePerNight: 5000, ownerId: UUID().uuidString, ownerName: "Anju", ownerImageUrl: "minnion", maximumGuests : 4, numberOfBedrooms: 3, numberOfBathrooms: 3, latitude: 19.0760, longitude: 72.8777, address: "India Gate", city: "Mumbai", state: "Maharasthra", country: "India", imageUrl: ["wallpaper1","wallpaper2"], amenities: [.superHost], features: [.kitchen,.wifi,.alarmSystem], buildingType: .flat),
//        ListingsModel(title: "Goa Villa", rating: 4.35, pricePerNight: 3500, ownerId: UUID().uuidString, ownerName: "Ujjwal", ownerImageUrl: "ironman", maximumGuests : 4, numberOfBedrooms: 2, numberOfBathrooms: 2, latitude: 15.5010, longitude: 73.8294, address: "Church Street", city: "Panaji", state: "Goa", country: "India", imageUrl: ["tree","lotus"], amenities: [.selfCheckIn,.superHost], features: [.pool,.wifi,.fireSafety], buildingType: .villa),
//        ListingsModel(title: "Mumbai Villa", rating: 3.75, pricePerNight: 5000, ownerId: UUID().uuidString, ownerName: "Anju", ownerImageUrl: "minnion", maximumGuests : 4, numberOfBedrooms: 3, numberOfBathrooms: 3, latitude: 19.0760, longitude: 72.8777, address: "India Gate", city: "Mumbai", state: "Maharasthra", country: "India", imageUrl: ["wallpaper1","wallpaper2"], amenities: [.superHost], features: [.kitchen,.wifi,.alarmSystem], buildingType: .flat),
    
    ]
}
