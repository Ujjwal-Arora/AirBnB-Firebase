//
//  ListingsModel.swift
//  AirBnB
//
//  Created by Ujjwal Arora on 08/09/24.
//

import Foundation

class ListingsModel : Identifiable, Codable  {
    var id = UUID().uuidString
    let title : String
    let rating : Double
    let pricePerNight : Int
    let ownerId : String
    let ownerName : String
    let ownerImageUrl : String
    let numberOfBedrooms : Int
    let numberOfBathrooms : Int
    let latitude : Double
    let longitude : Double
    let imageUrl : String
    let address : String
    let city : String
    let state : String
    let country : String
}
enum Amenities : Int,Identifiable, Codable , Hashable{
    case selfCheckIn , superHost
    
    var id: Int {
        return self.rawValue
    }
}
enum Features : Int, Identifiable, Codable , Hashable{
    case pool,kitchen,wifi,tv,laundry,iron,alarmSystem,fireSafety,office,balcony
    
    var id: Int {
        return self.rawValue
    }
}
