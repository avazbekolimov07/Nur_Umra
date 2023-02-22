//
//  HomeService.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 22/02/23.
//

import Foundation

class HomeService {
    
    static let shared = { HomeService() }()
    
//    func getNews(count: Int, success: @escaping (Int, [NewsDM]) -> (), failure: @escaping (Int) -> ()) {
//        
//        let urlString = self.configureApiCall(Endpoints.NEWS, "count", "\(count)")
//        
//        APIClient.shared.re(urlString: urlString, success: { (code, arrayOfQuotes) in
//            success(code, arrayOfQuotes)
//            
//        }) { (code) in
//            failure(code)
//        }
//    }
    
    func configureURLEncodeApiCall(_ baseURL: String, _ parameter: String, _ value: String) -> String {
        return baseURL + "?" + parameter + "=" + value
    }
}
