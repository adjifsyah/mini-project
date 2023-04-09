//
//  UserModel.swift
//  Mini-Project
//
//  Created by Adji Firmansyah on 09/04/23.
//

import Foundation

struct UserModel: Decodable {
    let userId: Int
    let email: String
    let firstName: String
    let lastName: String
    let imageUrl: String
}
