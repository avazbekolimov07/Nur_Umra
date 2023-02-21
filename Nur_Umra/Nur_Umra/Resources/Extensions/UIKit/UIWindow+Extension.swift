//
//  UIWindow+Extension.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 21/02/23.
//

import UIKit

extension UIWindow {

    static var keyWindow: UIWindow? {
        UIApplication.shared.windows.first(where: \.isKeyWindow)
    }

    static var safeAreaInsets: UIEdgeInsets {
        keyWindow?.safeAreaInsets ?? .zero
    }

}
