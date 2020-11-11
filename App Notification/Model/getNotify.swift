//
//  getNotify.swift
//  App Notification
//
//  Created by namit on 11/11/20.
//

import Foundation

struct GetNotify: Codable {
    let code: String
    let notification: [Notification]

    enum CodingKeys: String, CodingKey {
        case code = "CODE"
        case notification = "notification"
    }
}

// MARK: - Notification
struct Notification: Codable {
    let id: Int
    let empID: Int
    let title: String
    let content: String
    let link: String
    let isSeen: Int
    let createdAt: String
    let updatedAt: String
    let createdAtFormat: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case empID = "emp_id"
        case title = "title"
        case content = "content"
        case link = "link"
        case isSeen = "is_seen"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case createdAtFormat = "created_at_format"
    }
}
