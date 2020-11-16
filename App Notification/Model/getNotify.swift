//
//  getNotify.swift
//  App Notification
//
//  Created by namit on 11/11/20.
//

import Foundation
import Alamofire
import SwiftyJSON

class GetNotify{
    var CODE: String?
    var notification: [Notification]?

    required public init? (json: JSON){
        CODE = json["CODE"].stringValue
        notification = json["notification"].map{Notification(json: JSON($0))!}
    }
}

// MARK: - Notification
class Notification{
    var id: String?
    var emp_id: Int?
    var title: String?
    var content: String?
    var link: String?
    var is_seen: Int?
    var created_at: String?
    var updated_at: String?
    var created_at_format: String?
    required public init? (json: JSON){
        id = json["id"].stringValue
        emp_id = json["emp_id"].intValue
        title = json["title"].stringValue
        content = json["content"].stringValue
        link = json["link"].stringValue
        is_seen = json["is_seen"].intValue
        created_at = json["created_at"].stringValue
        updated_at = json["updated_at"].stringValue
        created_at_format = json["created_at_format"].stringValue
        
    }
    
}

