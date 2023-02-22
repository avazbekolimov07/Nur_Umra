//
//  UIColor+App.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 21/02/23.
//

import UIKit


extension UIColor {

    static let primaryBackgroundColor = UIColor.rgb(252, green: 255, blue: 255, alpha: 1)
    static let systemBackgroundLight = UIColor.rgb(255, green: 255, blue: 255, alpha: 1)
    static let systemBackgroundLight2 = UIColor.rgb(254, green: 254, blue: 254, alpha: 1)
    static let secondaryWhite = UIColor.rgb(242, green: 242, blue: 242, alpha: 1)
    
    static let mainGreenColor = UIColor.rgb(74, green: 162, blue: 96, alpha: 1)
    static let secondGreenColor = UIColor.rgb(226, green: 249, blue: 232, alpha: 1)
    static let darkGreen = UIColor.rgb(29, green: 62, blue: 52, alpha: 1)
    static let localGray = UIColor.rgb(210, green: 216, blue: 214, alpha: 1)
    static let greyGreen = UIColor.rgb(142, green: 158, blue: 153, alpha: 1)
    
    static let primaryRed = UIColor.rgb(237, green: 79, blue: 54, alpha: 1)
    static let primaryShadowColor = UIColor.rgb(24, green: 48, blue: 41, alpha: 1)
    static let separatorColor = UIColor.rgb(202, green: 206, blue: 213, alpha: 1)
    static let primaryInnerBorderColor = UIColor.rgb(203, green: 206, blue: 212, alpha: 1)
    static let innerBorderColor = UIColor.rgb(213, green: 219, blue: 219, alpha: 1)
    
    static let tabBarBackgroundColor = UIColor.rgb(248, green: 249, blue: 251, alpha: 1)
    static let placeholderTextColor = UIColor.rgb(203, green: 206, blue: 212, alpha: 1)
}


extension UIColor {
    
    static func rgb(_ red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
    
    private static func unwrappedColor(from optionalColor: UIColor?) -> UIColor {
        return optionalColor ?? UIColor()
    }
    
}
