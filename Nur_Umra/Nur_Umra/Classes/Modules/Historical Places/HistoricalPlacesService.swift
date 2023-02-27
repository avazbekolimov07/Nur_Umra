//
//  HistoricalPlacesService.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 27/02/23.
//

import Foundation
import SwiftyJSON

class HistoricalPlacesService {
    static let shared = HistoricalPlacesService()
    
    func getHistoricalPlaces(success: @escaping (Int, [HistoricalPlacesDM]) -> (), failure: @escaping (Int) -> () ) {
        let urlString = Endpoints.PLACE
        
        APIClient.shared.requestJSONEncoding(urlString: urlString, param: nil, method: .get, header: nil) { code, data in
            let json = JSON(data)
            let historicalPlaces = json.arrayValue.compactMap { json in
                HistoricalPlacesDM(json: json)
            }
            success(code, historicalPlaces)
        } failure: { code in
            failure(code)
        }

    }
}
