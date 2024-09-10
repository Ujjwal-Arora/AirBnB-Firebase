//
//  UsersModel.swift
//  AirBnB
//
//  Created by Ujjwal Arora on 11/09/24.
//

import Foundation

struct UsersModel : Identifiable , Codable {
    var id = UUID().uuidString
    let email : String
    let password : String
    
}
