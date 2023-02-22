//
//  HomeGuideCVC.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 21/02/23.
//

import UIKit

class HomeGuideCVC: UICollectionViewCell, ClassIdentifiable {
    
    // MARK: - UI Elements
    private lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "demo_img")
        return imageView
    }()
    
    private lazy var bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        view.insertSubview(blurEffectView, at: 0)
        
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        view.clipsToBounds = true
        view.layer.cornerRadius = 25
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
//        label.font = .jostRegular(size: 16)
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 16
        setupSubviews()
        
        
    }
    
    func configure(imgString: String?, title: String?, time: String?) {
        titleLabel.text = title
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Layout

extension HomeGuideCVC {

    func setupSubviews() {
        addSubviews(photoImageView, bottomView)
        bottomView.addSubview(titleLabel)
        configureConstraints()
    }

    func configureConstraints() {
        photoImageView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
            make.bottom.equalTo(self.snp.bottom)
        }
        
        bottomView.snp.makeConstraints { make in
            make.height.equalTo(60)
            make.left.equalTo(photoImageView.snp.left)
            make.bottom.equalTo(photoImageView.snp.bottom)
            make.right.equalTo(photoImageView.snp.right)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(bottomView.snp.left).offset(12)
            make.right.equalTo(bottomView.snp.right).offset(-12)
        }
    }

}
