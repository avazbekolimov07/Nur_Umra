//
//  CALayer+Shadow.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 21/02/23.
//

import UIKit

extension CALayer {

    func applySketchShadow(color: UIColor, alpha: CGFloat, x: CGFloat, y: CGFloat, blur: CGFloat, spread: CGFloat) {
        masksToBounds = false
        shadowColor = color.cgColor
        shadowOpacity = Float(alpha)
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
        shouldRasterize = true
        rasterizationScale = UIScreen.main.scale

        guard spread != .zero else {
            shadowPath = nil
            return
        }

        let dx = -spread
        let rect = bounds.insetBy(dx: dx, dy: dx)

        guard rect.origin.x.isFinite else {
            shadowPath = nil
            return
        }

        shadowPath = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius).cgPath
    }

    func insertSublayer(_ sublayer: CALayer, backgroundColor: UIColor?) {
        insertSublayer(sublayer, at: .zero)
        sublayer.backgroundColor = backgroundColor?.cgColor
        sublayer.cornerRadius = cornerRadius
    }

}
