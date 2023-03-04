//
//  UIString+Extention.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 04/03/23.
//

import Foundation
extension String {
    func deleteHTMLTag() -> String {
        return self.replacingOccurrences(of: "<[^>]+>&", with: "", options: .regularExpression, range: nil)
    }
}

