//
//  UserRequest.swift
//  Networking
//
//  Created by Cesar Morales Garduño on 6/16/24.
//

import Foundation

struct UserRequest: Encodable {
    let name, email, gender, status: String
}