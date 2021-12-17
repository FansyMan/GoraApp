//
//  GetDataManager.swift
//  GoraApp
//
//  Created by Surgeont on 16.12.2021.
//

import Foundation

class GetDataManager {
    
    static let shared = GetDataManager()
    private init() {
    }
    
    func getUsers(urlString: String, response: @escaping ([User]?, Error?) -> Void) {
        NetworkService.shared.getData(urlString: urlString) { result in
            switch result {
            case .success(let data):
                do {
                    let users = try JSONDecoder().decode([User].self, from: data)
                    response(users, nil)
                } catch let responseError {
                    print("Wrong in decoding \(responseError.localizedDescription)")
                }
            case .failure(let error):
                print("Wrong in Search Service \(error.localizedDescription)")
                response(nil, error)
            }
        }
    }
    
    func getPhotos(urlString: String, response: @escaping ([Photo]?, Error?) -> Void) {
        NetworkService.shared.getData(urlString: urlString) { result in
            switch result {
            case .success(let data):
                do {
                    let photos = try JSONDecoder().decode([Photo].self, from: data)
                    response(photos, nil)
                } catch let responseError {
                    print("Wrong in decoding \(responseError.localizedDescription)")
                }
            case .failure(let error):
                print("Wrong in Search Service \(error.localizedDescription)")
                response(nil, error)
            }
        }
    }
}
