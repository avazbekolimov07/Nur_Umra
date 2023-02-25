//
//  UIFont+App.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 25/02/23.
//

import UIKit

// MARK: - Poppins

extension UIFont {

    static func poppins_ExtraLight(size: CGFloat) -> UIFont {
        unwrappedFont(from: "Poppins-ExtraLight", of: size)
    }
    
    static func poppins_Light(size: CGFloat) -> UIFont {
        unwrappedFont(from: "Poppins-Light", of: size)
    }
    
    static func poppins_Medium(size: CGFloat) -> UIFont {
        unwrappedFont(from: "Poppins-Medium", of: size)
    }
    
    static func poppins_Regular(size: CGFloat) -> UIFont {
        unwrappedFont(from: "Poppins-Regular", of: size)
    }
    
    static func poppins_SemiBold(size: CGFloat) -> UIFont {
        unwrappedFont(from: "Poppins-SemiBold", of: size)
    }
    
    static func poppins_Thin(size: CGFloat) -> UIFont {
        unwrappedFont(from: "Poppins-Thin", of: size)
    }
    
    static func poppins_Bold(size: CGFloat) -> UIFont {
        unwrappedFont(from: "Poppins-Bold", of: size)
    }
    
    static func poppins_Black(size: CGFloat) -> UIFont {
        unwrappedFont(from: "Poppins-Black", of: size)
    }
    
    static func poppins_ExtraBold(size: CGFloat) -> UIFont {
        unwrappedFont(from: "Poppins-ExtraBold", of: size)
    }
}



// MARK: - Private methods

extension UIFont {

    private static func unwrappedFont(from fontName: String?, of size: CGFloat) -> UIFont {
        guard let fontName = fontName else { return .systemFont(ofSize: size) }
        return UIFont(name: fontName, size: size) ?? .systemFont(ofSize: size)
    }

}
