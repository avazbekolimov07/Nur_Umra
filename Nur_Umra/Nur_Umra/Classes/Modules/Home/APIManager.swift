//
//  APIManager.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 22/02/23.
//

import Foundation

class APIManager {
    
    static let shared = { APIManager() }()
    
    lazy var baseURL: String = {
        return "https://app.nurumrahajj.uz/"
    }()
}
