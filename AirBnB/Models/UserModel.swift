//
//  UserModel.swift
//  AirBnB
//
//  Created by Ujjwal Arora on 11/09/24.
//

import Foundation
import FirebaseFirestore

struct UserModel : Identifiable , Codable, Hashable {
    @DocumentID var id : String?
    let email : String
   // let password : String
    let profilePhotoUrl : String?
    let fullname : String?

}
