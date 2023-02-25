//
//  UmraGideService.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 24/02/23.
//

import Foundation
import SwiftyJSON

class UmraGideService {
    
    static let shared = { UmraGideService() }()
    
    func getHandbooks(success: @escaping (Int, [HandbookDM]) -> (),
                 failure: @escaping (Int) -> ()) {
        let urlString = Endpoints.HANDBOOK
        APIClient.shared.requestJSONEncoding(urlString: urlString,
                                             param: nil,
                                             method: .get,
                                             header: nil,
                                             success: { (code, resultData) in
            let json = JSON(resultData)
            let handbooks = json.arrayValue.compactMap { HandbookDM(json: $0) }
            success(code, handbooks)
        }) { (code) in
            failure(code)
        }
    }
    
    func configureURLEncodeApiCall(_ baseURL: String, _ parameter: String, _ value: String) -> String {
        return baseURL + "?" + parameter + "=" + value
    }
}
