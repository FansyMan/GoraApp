//
//  UserModel.swift
//  GoraApp
//
//  Created by Surgeont on 16.12.2021.
//

import Foundation

struct User: Decodable {
    let id: Int
    let name: String
    let username: String
    let email: String
}
