//
//  User.swift
//  TestApp
//
//  Created by Admin on 10/9/23.
//

import Foundation

struct User: Decodable {
    var id: Int
    var firstName: String
    var lastName: String
    var username: String
    var email: String
    var gender: String
    var pictureURL: String
    var phone: String
    var birthday: String
    var twitterHandle: String
    
    func getFullname() -> String {
        return "\(firstName) \(lastName)"
    }
}
