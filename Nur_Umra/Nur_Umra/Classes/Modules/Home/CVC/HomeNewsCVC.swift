//
//  HomeNewsCVC.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 21/02/23.
//

import UIKit
import SDWebImage
import SkeletonView

class HomeNewsCVC: UICollectionViewCell, ClassIdentifiable {
    
    var didShareButtonPressed: ((_ link: String) -> Void)?
    var new: NewsDM?
    
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
        imageView.image = UIImage(named: "tarix_img")
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 16
        imageView.contentMode = .scaleAspectFill
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

        label.font = .poppins_SemiBold(size: 14)
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        
        label.text = "simple data to make skeletion view so that it would be visible ( but it would be longer )"
        label.skeletonCornerRadius = 4
        label.linesCornerRadius = 4
//        label.skeletonTextNumberOfLines = 0
//        label.lastLineFillPercent = 80
        return label
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
    
        label.font = .poppins_SemiBold(size: 11)
        label.alpha = 0.6

        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 1
        
        label.text = "simple data to make skeletion view so that it would be visible"
        label.skeletonCornerRadius = 4
        label.linesCornerRadius = 4
//        label.skeletonTextNumberOfLines = 1
//        label.lastLineFillPercent = 80
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
        
        // shadow...
        self.layer.shadowColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.16).cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 8
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        setupSubviews()
    }
    
    //MARK: - Action
    @objc func handleShareButton() {
        if let newSafe = self.new {
            didShareButtonPressed?(newSafe.link)
        }
    }
    
    func configure(new: NewsDM?) {
        guard let newSafe = new else { return }
        self.new = newSafe
        self.removeSkeleton()
        self.updateUI(new: newSafe)
    }
    
    private func updateUI(new: NewsDM) {
        guard let url = URL(string: new.image) else {return}
        photoImageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        photoImageView.sd_setImage(with: url, placeholderImage: nil)
        titleLabel.text = new.title
        timeLabel.text = new.created_at
    }
    
    func configureSkeleton() {
        [self.shareImageView,
         self.shareButton,
         self.titleLabel,
         self.timeLabel,
         self.stackView,
         self.bottomView,
         self.photoImageView].forEach {
            $0.isSkeletonable = true
            $0.showAnimatedGradientSkeleton()
        }
    }
    
    func removeSkeleton() {
        [self.shareImageView,
         self.shareButton,
         self.titleLabel,
         self.timeLabel,
         self.stackView,
         self.bottomView,
         self.photoImageView].forEach {
            $0.stopSkeletonAnimation()
        }
        self.hideSkeleton(reloadDataAfter: true, transition: .crossDissolve(0.25))
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Layout

extension HomeNewsCVC {

    func setupSubviews() {
        contentView.addSubviews(photoImageView, bottomView, shareButton)
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
