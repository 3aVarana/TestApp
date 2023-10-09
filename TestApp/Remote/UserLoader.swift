//
//  UserLoader.swift
//  TestApp
//
//  Created by Admin on 10/9/23.
//

import Foundation

class UserLoader {
    var client: URLSession
    var url: URL
    
    enum Error: Swift.Error {
        case UnexpecterError
        case UnexpecterResponse
        case InvalidStatuCode
        case EmptyData
    }
    
    init(url: String, client: URLSession = URLSession.shared) {
        self.url = URL(string: url)!
        self.client = client
    }
    
    func loadUsers(completion: @escaping (Result<[User], Swift.Error>) -> Void) {
        let task = client.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(.failure(Error.UnexpecterResponse))
                return
            }
            
            guard response.statusCode == 200 else {
                completion(.failure(Error.InvalidStatuCode))
                return
            }
            
            guard let data = data else {
                completion(.failure(Error.EmptyData))
                return
            }
            
            if let users = try? JSONDecoder().decode([User].self, from: data) {
                completion(.success(users))
            } else {
                completion(.failure(Error.UnexpecterError))
            }
        }
        task.resume()
    }
}
