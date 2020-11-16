//
//  User.swift
//  App Notification
//
//  Created by namit on 11/9/20.
//

import Foundation
import Alamofire
import SwiftyJSON

// MARK: - User
class User{
    var CODE: String?
    var session_key: String?
    var userData: [UserData]?

    required public init? (json: JSON){
        CODE = json["CODE"].stringValue
        session_key = json["session_key"].stringValue
        userData = json["userData"].map{UserData(json: JSON($0))!}
    }
}

// MARK: - UserData
class UserData{
    var id: String?
    var user_group_id: Int?
    var user_group_level: Int?
    var admin_level: Int?
    var emp_id: Int?
    var name: String?
    var position: String?
    var team_id: Int?
    var team_code: String?
    var team_name_vi: String?
    var team_name_en: String?
    var team_name_jp: String?
    var team_role_string: String?
    var username: String?
    var email: String?
    var phone: String?
    var avatar: String?
    var pregnancy: Int?
    var status: Int?
    var created_at: String?
    var updated_at: String?
    required public init? (json: JSON){
        id = json["id"].stringValue
        user_group_id = json["user_group_id"].intValue
        user_group_level = json["user_group_level"].intValue
        admin_level = json["admin_level"].intValue
        emp_id = json["emp_id"].intValue
        name = json["name"].stringValue
        position = json["position"].stringValue
        team_id = json["team_id"].intValue
        team_code = json["team_code"].stringValue
        team_name_vi = json["team_name_vi"].stringValue
        team_name_en = json["team_name_en"].stringValue
        team_name_jp = json["team_name_jp"].stringValue
        team_role_string = json["team_role_string"].stringValue
        username = json["username"].stringValue
        email = json["email"].stringValue
        phone = json["phone"].stringValue
        avatar = json["avatar"].stringValue
        pregnancy = json["pregnancy"].intValue
        status = json["status"].intValue
        created_at = json["created_at"].stringValue
        updated_at = json["updated_at"].stringValue
    }
}
