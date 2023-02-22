//
//  HomeNewsCVC.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 21/02/23.
//

import UIKit
import SDWebImage

class HomeNewsCVC: UICollectionViewCell, ClassIdentifiable {
    
    var didShareButtonPressed: (() -> Void)?
    
    // MARK: - UI Elements
    private lazy var shareImageView: UIImageView = {
        let image = UIImageView()
        image.isUserInteractionEnabled = false
        image.image = UIImage(named: "share_img")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = .white
        return image
    }()
    
    private lazy var shareButton: UIButton = {
        let button = UIButton(type: .system)
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = button.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.alpha = 0.8
        blurEffectView.isUserInteractionEnabled = false
        
        button.insertSubview(blurEffectView, at: 0)
        
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 8
        button.isUserInteractionEnabled = true

        button.addTarget(self, action: #selector(handleShareButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 16
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "demo1_img")
        return imageView
    }()
    
    private lazy var bottomView: UIView = {
        let view = UIView()
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.alpha = 0.8
        
        view.insertSubview(blurEffectView, at: 0)
        
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 16
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "1-fevraldan umra safariga aviareyslar har kuni amalga oshiriladi"
//        label.font = .jostRegular(size: 14)
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.text = "2 soat oldin"
//        label.font = .jostRegular(size: 11)
        label.font = UIFont.systemFont(ofSize: 11)
        label.alpha = 0.6

        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, timeLabel])
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    //MARK: - Action
    @objc func handleShareButton() {
        didShareButtonPressed?()
    }
    
    func configure(imgString: String?, title: String?, time: String?) {
        titleLabel.text = title
        timeLabel.text = time
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Layout

extension HomeNewsCVC {

    func setupSubviews() {
        addSubviews(photoImageView, bottomView, shareButton)
        bottomView.addSubview(stackView)
        shareButton.addSubview(shareImageView)
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
            make.height.equalTo(128)
            make.left.equalTo(photoImageView.snp.left)
            make.bottom.equalTo(photoImageView.snp.bottom)
            make.right.equalTo(photoImageView.snp.right)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(bottomView.snp.top).offset(15)
            make.left.equalTo(bottomView.snp.left).offset(12)
            make.right.equalTo(bottomView.snp.right).offset(-12)
            make.bottom.equalTo(bottomView.snp.bottom).offset(-15)
        }
        
        shareButton.snp.makeConstraints { make in
            make.width.equalTo(36)
            make.height.equalTo(36)
            make.top.equalTo(self.snp.top).offset(18)
            make.left.equalTo(self.snp.left).offset(12)
        }
        
        shareImageView.snp.makeConstraints { make in
            make.width.equalTo(19)
            make.height.equalTo(17)
            make.centerY.equalTo(shareButton.snp.centerY)
            make.centerX.equalTo(shareButton.snp.centerX)
        }
    }

}
