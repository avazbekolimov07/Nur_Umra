//
//  PreparationDM.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 27/02/23.
//

import Foundation
import SwiftyJSON

struct PreparationDM {
    let id: Int
    let text: String
    
    init(json: JSON) {
        self.id = json["id"].intValue
        self.text = json["text"].stringValue
    }
}
