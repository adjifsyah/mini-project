//
//  ResponseListUser.swift
//  Mini-Project
//
//  Created by Adji Firmansyah on 09/04/23.
//

import Foundation

struct ResponseListUser: Decodable {
    let listUser: [RemoteUserModel]
    
    enum CodingKeys: String, CodingKey {
        case listUser = "data"
    }
}


