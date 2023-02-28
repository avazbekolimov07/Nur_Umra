//
//  HomeIconCVC.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 28/02/23.
//

import UIKit

class HomeIconCVC: UICollectionViewCell, ClassIdentifiable {
    
    
    // MARK: - UI Elements
    private lazy var iconImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "icon_png")
        return image
    }()
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupSubviews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Layout

extension HomeIconCVC {

    func setupSubviews() {
        addSubviews(iconImageView)
        configureConstraints()
    }

    func configureConstraints() {
        iconImageView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.bottom.equalTo(self.snp.bottom)
            make.centerX.equalToSuperview()
            make.width.equalTo(120)
        }
    }

}
