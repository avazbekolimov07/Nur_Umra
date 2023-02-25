//
//  UmraAudioService.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 25/02/23.
//

import Foundation
import SwiftyJSON

class UmraAudioService {
    
    static let shared = { UmraAudioService() }()
    
    func getDuolar(success: @escaping (Int, [DuoDM]) -> (),
                 failure: @escaping (Int) -> ()) {
        let urlString = Endpoints.DUOLAR
        APIClient.shared.requestJSONEncoding(urlString: urlString,
                                             param: nil,
                                             method: .get,
                                             header: nil,
                                             success: { (code, resultData) in
            let json = JSON(resultData)
            let duolar = json.arrayValue.compactMap { DuoDM(json: $0) }
            success(code, duolar)
        }) { (code) in
            failure(code)
        }
    }
    
    func configureURLEncodeApiCall(_ baseURL: String, _ parameter: String, _ value: String) -> String {
        return baseURL + "?" + parameter + "=" + value
    }
}
