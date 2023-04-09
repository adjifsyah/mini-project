//
//  RemoteUserModel.swift
//  Mini-Project
//
//  Created by Adji Firmansyah on 09/04/23.
//

import Foundation

struct RemoteUserModel: Decodable {
    let userId: Int
    let email: String
    let firstName: String
    let lastName: String
    let imageUrl: String
    
    enum CodingKeys: String, CodingKey {
        case userId = "id"
        case email
        case firstName = "first_name"
        case lastName = "last_name"
        case imageUrl = "avatar"
    }
}
