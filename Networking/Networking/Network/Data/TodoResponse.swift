//
//  TodoResponse.swift
//  Networking
//
//  Created by Cesar Morales Garduño on 6/15/24.
//

import Foundation

struct TodoResponse: Decodable {
    let id, userID: Int?
    let title, status: String?
    let dueOn: Date?

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case title, status
        case dueOn = "due_on"
    }
}
