//
//  HandbookDM.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 23/02/23.
//

import Foundation
import SwiftyJSON

struct HandbookDM {
    let id: Int
    let name: String
    let description: String
    let some_text: String
    
    init(json: JSON) {
        id = json["id"].intValue
        name = json["name"].stringValue
        description = json["description"].stringValue
        some_text = json["some_text"].stringValue
    }
}
