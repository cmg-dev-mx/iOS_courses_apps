//
//  DateDecoder.swift
//  Networking
//
//  Created by Cesar Morales Garduño on 6/15/24.
//

import Foundation

final class DateDecoder: JSONDecoder {

    let dateFormatter = DateFormatter()

    override init() {
        super.init()
        // Date format: 2024-07-08T00:00:00.000+05:30
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXX"
        dateDecodingStrategy = .formatted(dateFormatter)
    }
}