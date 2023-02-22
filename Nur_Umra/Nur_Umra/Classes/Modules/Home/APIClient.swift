//
//  APIClient.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 22/02/23.
//

import Foundation
import Alamofire

class APIClient {
    
    var baseURL: URL?
    
    static let shared = { APIClient(baseUrl: APIManager.shared.baseURL) }()
    
    required init(baseUrl: String){
        self.baseURL = URL(string: baseUrl)
    }
    
    func requestJSONEncoding(urlString: String,
                             param: [String: Any]?,
                             method: HTTPMethod,
                             header: HTTPHeaders?,
                             success: @escaping (Int, Data) -> (),
                             failure: @escaping (Int) -> ()) {
        
        guard let url = NSURL(string: urlString ,
                              relativeTo: self.baseURL as URL?)
        else { return }
        
        let urlString = url.absoluteString!
        
        AF.request(urlString,
                   method: method,
                   parameters: param,
                   encoding: JSONEncoding.default,
                   headers: header)
        .response{ (response) in
            print("DATA REQUEST:", response.request ?? "")
            guard let serverResponse = response.response,
                  let resultData = response.data else {
                failure(400)
                return
            }
            
            switch response.result {
            case .success:
                switch serverResponse.statusCode {
                case 200, 201, 202:
                    success(serverResponse.statusCode, resultData)
                default:
                    failure(serverResponse.statusCode)
                }
            case .failure(let error):
                print("FAILURE - RESPONSE RESULT, :", error.localizedDescription)
                failure(400)
            }
        }
    }
    
}
