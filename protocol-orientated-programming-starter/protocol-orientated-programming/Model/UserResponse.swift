//
//  UserResponse.swift
//  protocol-orientated-programming
//
//  Created by YUSUF ÖZATA on 6.02.2023.
//

import Foundation

struct UserResponse: Decodable {
    let data: User
}

struct User: Decodable {
    let id: Int
    let email: String
    let avatar: String
}
