//
//  PreparationFoUmraService.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 27/02/23.
//

import Foundation
import SwiftyJSON

class PreparationForUmraService {
    
    static let shared = PreparationForUmraPresenter()
    
    func getPreparation(success: @escaping (Int, [PreparationDm]) -> (), failure: @escaping (Int) -> ()) {
        let urlString = Endpoints.PREPARATION
        
        APIClient.shared.requestJSONEncoding(urlString: urlString, param: nil, method: .get, header: nil) { code, resultData in
            let json = JSON(resultData)
            let preparationForIUmra = json.arrayValue.compactMap { PreparationDm(json: $0) }
            success(code, preparationForIUmra)
           
        } failure: { code in
            failure(code)
        }

    }
}


