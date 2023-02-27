//
//  HistoricalPlacesDm.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 27/02/23.
//

import Foundation
import SwiftyJSON

struct HistoricalPlacesDM {
    let id: Int
    let name: String
    let img: String
    let description: String
    let latitude: String
    let longitude: String
    
    init(json: JSON) {
        self.id = json["id"].intValue
        self.name = json["name"].stringValue
        self.img = json["image"].stringValue
        self.description = json["description"].stringValue
        self.latitude = json["latitude"].stringValue
        self.longitude = json["longitude"].stringValue
    }
}
