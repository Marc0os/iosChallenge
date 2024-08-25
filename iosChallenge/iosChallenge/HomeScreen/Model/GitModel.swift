//
//  GitModel.swift
//  iosChallenge
//
//  Created by Marcos Costa on 23/08/24.
//

import Foundation

struct GitModel: Codable {
    let totalCount: Int
    let items: [Item]
    
    enum CodingKeys: String, CodingKey{
        case totalCount = "total_count"
        case items
    }
}

struct Item: Codable {
    let id: Int
    let name: String // lista de pulls: {repository}
    let fullname: String // {owner}/{repository}
    let isPrivate: Bool
    let owner: Owner
    let htmlURL: String
    let description: String
    let createdAt, updatedAt, pushedAt: String
    let watchersCount: Int
    let forksCount: Int
    let topics: [String]
    
    enum CodingKeys: String, CodingKey{
        case id, name
        case fullname = "full_name"
        case isPrivate = "private"
        case owner
        case htmlURL = "html_url"
        case description
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case pushedAt = "pushed_at"
        case watchersCount = "watchers_count"
        case forksCount = "forks_count"
        case topics
    }
    
}

struct Owner: Codable {
    let login: String // lista de pulls: {owner}
    let id: Int
    let avatarURL: String
//    let htmlURL: String // meybe
    
    enum CodingKeys: String, CodingKey{
        case login, id
        case avatarURL = "avatar_url"
//        case htmlURL = "html_url"
    }
}
