//
//  UIButton+App.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 28/02/23.
//

import UIKit
import SnapKit

extension UIButton {
    func leftImage(image: UIImage, renderMode: UIImage.RenderingMode) {
        self.setImage(image.withRenderingMode(renderMode), for: .normal)
  
        self.contentHorizontalAlignment = .center
        self.imageView?.contentMode = .scaleAspectFit
        self.imageView?.snp.makeConstraints({ make in
            make.height.equalTo(24)
            make.width.equalTo(24)
            make.centerY.equalToSuperview()
            make.right.equalTo(self.titleLabel!.snp.left).offset(-12)
        })
    }
    
    func rightImage(image: UIImage, renderMode: UIImage.RenderingMode){
        self.setImage(image.withRenderingMode(renderMode), for: .normal)
        self.imageEdgeInsets = UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 0)
        self.contentHorizontalAlignment = .center
        self.imageView?.contentMode = .scaleAspectFit
    }
}
