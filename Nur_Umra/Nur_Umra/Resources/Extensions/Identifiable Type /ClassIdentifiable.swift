//
//  ClassIdentifiable.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 21/02/23.
//

protocol ClassIdentifiable {
    static var reuseId: String { get }
}

extension ClassIdentifiable {

    static var reuseId: String {
        return String(describing: self)
    }

}
