//
//  UIView+Shadow.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 21/02/23.
//

import UIKit

extension UIView {

    func setupShadow(color: UIColor = .primaryShadowColor, alpha: CGFloat = 0.3, xOffset: CGFloat = .zero, yOffset: CGFloat = .zero, blur: CGFloat = 43, spread: CGFloat = -11) {
        layer.applySketchShadow(color: color, alpha: alpha, x: xOffset, y: yOffset, blur: blur, spread: spread)
    }

}


enum LayerStyleType {
    case primaryShadow
    case custom(offset: CGPoint, blur: CGFloat, spread: CGFloat, color: UIColor, alpha: CGFloat)

    var value: LayerStyle<CALayer> {
        switch self {
        case .primaryShadow:
            return LayerStyle<CALayer> {
                $0.applySketchShadow(color: .primaryShadowColor, alpha: 0.3, x: .zero, y: .zero, blur: .zero, spread: 43)
            }
        case let .custom(offset, blur, spread, color, alpha):
            return LayerStyle<CALayer> {
                $0.applySketchShadow(color: color, alpha: alpha, x: offset.x, y: offset.y, blur: blur, spread: spread)
            }
        }
    }

    private func fixSublayerIndex(parentLayer: CALayer, sublayer: CALayer) {
        let sublayers = parentLayer.sublayers ?? []
        guard sublayers.count > 1, sublayers.last === sublayer else { return }

        sublayer.removeFromSuperlayer()
        parentLayer.insertSublayer(sublayer, at: .zero)
    }
}

struct LayerStyle<Layer: CALayer> {

    let style: (Layer) -> Void

    init(_ style: @escaping (Layer) -> Void) {
        self.style = style
    }

    func apply(to view: Layer) {
        style(view)
    }

}

extension CALayer {

    func apply(_ styles: LayerStyleType...) {
        styles.forEach { $0.value.apply(to: self) }
    }

    func apply(_ styles: [LayerStyleType]) {
        styles.forEach { $0.value.apply(to: self) }
    }

}

extension UIView {

    func apply(_ styles: LayerStyleType...) {
        layer.backgroundColor = backgroundColor?.cgColor
        layer.apply(styles)
    }

}
