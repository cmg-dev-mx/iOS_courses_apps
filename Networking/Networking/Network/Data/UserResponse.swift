//
//  UserResponse.swift
//  Networking
//
//  Created by Cesar Morales Garduño on 6/15/24.
//

import Foundation

struct UserResponse: Decodable {
    let id: Int?
    let name, email, gender, status: String?
}
