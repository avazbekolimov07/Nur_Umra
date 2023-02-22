//
//  NewsDM.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 20/02/23.
//

import Foundation
import SwiftyJSON

struct NewsDM {
    let id: Int
    let title: String
    let content: String
    let image: String
    let created_at: String
    let link: String
    
    init(json: JSON) {
        id = json["id"].intValue
        title = json["title"].stringValue
        content = json["content"].stringValue
        image = json["image"].stringValue
        created_at = json["created_at"].stringValue
        link = json["link"].stringValue
    }
}
