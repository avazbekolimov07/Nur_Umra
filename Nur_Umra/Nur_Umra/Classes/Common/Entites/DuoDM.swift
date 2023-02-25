//
//  DuoDM.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 25/02/23.
//

import Foundation
import SwiftyJSON

struct DuoDM {
    let id: Int
    let name: String
    let audio: String
    let description: String
    
    init(json: JSON) {
        id = json["id"].intValue
        name = json["name"].stringValue
        audio = json["audio"].stringValue
        description = json["description"].stringValue
    }
}
