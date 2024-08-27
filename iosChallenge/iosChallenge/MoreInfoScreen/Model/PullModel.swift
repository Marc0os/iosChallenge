//
//  PullModel.swift
//  iosChallenge
//
//  Created by Marcos Costa on 25/08/24.
//

import Foundation

struct Pull: Codable {
    let id: Int
    let htmlURL: String
    let number: Int
    let title: String
    let user: User
    let createdAt: String
    
    enum CodingKeys: String, CodingKey{
        case id
        case htmlURL = "html_url"
        case number, title, user
        case createdAt = "created_at"
    }
}

struct User: Codable{
    let login: String
    let avatarURL: String
    
    enum CodingKeys: String, CodingKey{
        case login
        case avatarURL = "avatar_url"
    }
}
