//
//  PhotoModel.swift
//  GoraApp
//
//  Created by Surgeont on 16.12.2021.
//

import Foundation

struct Photo: Decodable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
}
