//
//  User.swift
//  App Notification
//
//  Created by namit on 11/9/20.
//

import Foundation

// MARK: - User
struct User: Codable {
    let code: String
    let sessionKey: String
    let userData: UserData

    enum CodingKeys: String, CodingKey {
        case code = "CODE"
        case sessionKey = "session_key"
        case userData = "userData"
    }
}

// MARK: - UserData
struct UserData: Codable {
    let id: Int
    let userGroupID: Int
    let userGroupLevel: Int
    let adminLevel: Int
    let empID: Int
    let name: String
    let position: String
    let teamID: Int
    let teamCode: String
    let teamNameVi: String
    let teamNameEn: String
    let teamNameJp: String
    let teamRoleString: String
    let username: String
    let email: String
    let phone: String
    let avatar: String
    let pregnancy: Int
    let status: Int
    let createdAt: String
    let updatedAt: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case userGroupID = "user_group_id"
        case userGroupLevel = "user_group_level"
        case adminLevel = "admin_level"
        case empID = "emp_id"
        case name = "name"
        case position = "position"
        case teamID = "team_id"
        case teamCode = "team_code"
        case teamNameVi = "team_name_vi"
        case teamNameEn = "team_name_en"
        case teamNameJp = "team_name_jp"
        case teamRoleString = "team_role_string"
        case username = "username"
        case email = "email"
        case phone = "phone"
        case avatar = "avatar"
        case pregnancy = "pregnancy"
        case status = "status"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
