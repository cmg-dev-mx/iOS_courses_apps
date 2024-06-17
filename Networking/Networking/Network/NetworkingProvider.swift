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
    private let kToken = "..." // GoRest token

    func getUser(id: Int, success: @escaping (_ user: UserResponse) -> (), failure: @escaping (_ error: Error?) -> ()) {
        let url = "\(kBaseUrl)users/\(id)"

        AF.request(url, method: .get)
            .validate(statusCode: kStatusOk)
            .responseDecodable(of: UserResponse.self) { response in
                if let user = response.value {
                    success(user)
                } else {
                    failure(response.error)
                }
            }
    }

    func getTodo(id: Int, success: @escaping (_ todo: TodoResponse) -> (), failure: @escaping (_ error: Error?) -> ()) {
        let url = "\(kBaseUrl)todos/\(id)"

        AF.request(url, method: .get)
            .validate(statusCode: kStatusOk)
            .responseDecodable(of: TodoResponse.self, decoder: DateDecoder()) { response in
                if let todo = response.value {
                    success(todo)
                } else {
                    failure(response.error)
                }
            }
    }

    func addUser(user: UserRequest, success: @escaping (_ user: UserResponse) -> (), failure: @escaping (_ error: Error?) -> ()) {
        let url = "\(kBaseUrl)users"

        let headers: HTTPHeaders = [.authorization(bearerToken: kToken)]

        AF.request(url, method: .post, parameters: user, encoder: JSONParameterEncoder.default, headers: headers)
            .validate(statusCode: kStatusOk)
            .responseDecodable(of: UserResponse.self) { response in
                if let user = response.value, user.id != nil {
                    success(user)
                } else {
                    failure(response.error)
                }
            }
    }
}
