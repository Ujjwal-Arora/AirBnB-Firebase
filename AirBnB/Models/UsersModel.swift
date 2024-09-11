//
//  UsersModel.swift
//  AirBnB
//
//  Created by Ujjwal Arora on 11/09/24.
//

import Foundation
import FirebaseFirestore

struct UsersModel : Identifiable , Codable {
    @DocumentID var id : String?
    let email : String
    let password : String
    let profilePhotoUrl : String?
}
