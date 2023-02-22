//
//  HomeService.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 22/02/23.
//

import Foundation
import SwiftyJSON

class HomeService {
    
    static let shared = { HomeService() }()
    
    func getNews(success: @escaping (Int, [NewsDM]) -> (),
                 failure: @escaping (Int) -> ()) {
        let urlString = Endpoints.NEWS
        APIClient.shared.requestJSONEncoding(urlString: urlString,
                                             param: nil,
                                             method: .get,
                                             header: nil,
                                             success: { (code, arrayOfNews) in
            let json = JSON(arrayOfNews)
            let news = json.arrayValue.compactMap { NewsDM(json: $0) }
            success(code, news)
        }) { (code) in
            failure(code)
        }
    }
    
    func configureURLEncodeApiCall(_ baseURL: String, _ parameter: String, _ value: String) -> String {
        return baseURL + "?" + parameter + "=" + value
    }
}
