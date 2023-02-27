//
//  UmraAudioTVC.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 25/02/23.
//

import UIKit
import SnapKit

class UmraAudioTVC: UITableViewCell, ClassIdentifiable {
    
    var duo: DuoDM?
    var didPlayBtnTapped: ((_ url: String) -> Void)?
    var topConstraint: NSLayoutConstraint!
    var bottomConstraint: NSLayoutConstraint!
    
    // MARK: - UI Elements
    private lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        
        view.layer.shadowColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.16).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 8
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        return view
    }()
    
    private lazy var hStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [playButton, titleLabel, moreImageView])
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.axis = .horizontal
        stackView.backgroundColor = .clear
        stackView.spacing = 16
        return stackView
    }()
    
    private lazy var playButton: UIButton = {
        let button = UIButton()
        button.isUserInteractionEnabled = true
        button.setImage(UIImage(named: "play_img")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(handlePlay), for: .touchUpInside)
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .poppins_SemiBold(size: 14)

        label.textColor = #colorLiteral(red: 0.2224110067, green: 0.2330494523, blue: 0.2606178522, alpha: 1)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var moreImageView = UIImageView(image: UIImage(named: "moreInfo_img"))
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.isUserInteractionEnabled = true
        setupSubviews()
    }
    
    override func layoutSubviews() {
        
    }
    
    func configure(duo: DuoDM?) {
        guard let duoSafe = duo else { return }
        self.duo = duoSafe
        self.updateUI(duo: duoSafe)
    }
    
    func updateToPlay() {
        playButton.setImage(UIImage(named: "stop_img")?.withRenderingMode(.alwaysOriginal), for: .normal)
    }
    
    func updateToStop() {
        playButton.setImage(UIImage(named: "play_img")?.withRenderingMode(.alwaysOriginal), for: .normal)
    }
    
    private func updateUI(duo: DuoDM) {
        titleLabel.text = duo.name
        if titleLabel.calculateMaxLines() > 2 {
            topConstraint.constant = 16
            bottomConstraint.constant = -16
        } else {
            topConstraint.constant = 9
            bottomConstraint.constant = -9
        }
    }
    
    //MARK: - Actions
    @objc func handlePlay() {
        if let audio = duo?.audio {
            didPlayBtnTapped?(audio)
        }
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Layout

extension UmraAudioTVC {
    
    private func setupSubviews() {
        addSubviews(mainView)
        mainView.addSubview(hStackView)
        configureConstraints()
    }
    
    private func configureConstraints() {
        playButton.snp.makeConstraints { make in
            make.height.equalTo(56)
            make.width.equalTo(56)
        }
        
        moreImageView.snp.makeConstraints { make in
            make.height.equalTo(12)
            make.width.equalTo(12)
        }
        
        hStackView.snp.makeConstraints { make in
//            make.top.equalTo(mainView.snp.top).offset(16)
            make.left.equalTo(mainView.snp.left).offset(12)
            make.right.equalTo(mainView.snp.right).offset(-16)
//            make.bottom.equalTo(mainView.snp.bottom).offset(-16)
        }
        
        topConstraint = hStackView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 16)
        bottomConstraint = hStackView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -16)
        topConstraint.isActive = true
        bottomConstraint.isActive = true
        
        mainView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(6)
            make.left.equalTo(self.snp.left).offset(16)
            make.right.equalTo(self.snp.right).offset(-16)
            make.bottom.equalTo(self.snp.bottom).offset(-6)
        }
        
    }
}
