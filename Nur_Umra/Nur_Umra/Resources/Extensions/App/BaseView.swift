//
//  BaseView.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 28/02/23.
//

import UIKit
import SnapKit

extension UIViewController {
    
    func create_baseView() -> UIView {
        let baseView = UIView()
        baseView.backgroundColor = .white
        baseView.frame = view.bounds
        
        self.view.addSubviews(baseView)
        let image = UIImageView()
        image.frame = baseView.bounds
        image.image = UIImage(named: "background")
        image.alpha = 0.1
        baseView.addSubviews(image)
        
        return baseView
    }
    
}
