//
//  NetworkingProvider.swift
//  Networking
//
//  Created by Cesar Morales Garduño on 6/15/24.
//

import Foundation
import Alamofire

final class NetworkingProvider {

    static let shared = NetworkingProvider()

    private let kBaseUrl = "https://gorest.co.in/public/v2/"
    private let kStatusOk = 200...299

    func getUser(id: Int) {
        let url = "\(kBaseUrl)users/\(id)"

        AF.request(url, method: .get)
            .validate(statusCode: kStatusOk)
            .responseDecodable(of: UserResponse.self) { response in
                if let user = response.value {
                    print(user)
                    print(user.email)
                } else {
                    print(response.error?.localizedDescription ?? "Error")
                }
            }
    }

    func getTodo(id: Int) {
        let url = "\(kBaseUrl)todos/\(id)"

        AF.request(url, method: .get)
            .validate(statusCode: kStatusOk)
            .responseDecodable(of: TodoResponse.self, decoder: DateDecoder()) { response in
                if let todo = response.value {
                    print(todo)
                    print(todo.dueOn)
                } else {
                    print(response.error?.localizedDescription ?? "Error")
                }
            }
    }
}
