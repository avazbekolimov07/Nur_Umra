//
//  UmraGideTopImageTVC.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 23/02/23.
//

import UIKit

class UmraGideTopImageTVC: UITableViewCell, ClassIdentifiable {

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [imgView, headerLabel])
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = 24
        return stackView
    }()
    
    private lazy var imgView = UIImageView(image: UIImage(named: "umraGide_img"))
    
    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "UMRA QO'LLANMASI"
        label.font = .poppins_SemiBold(size: 18)
        label.textColor = #colorLiteral(red: 0.2224110067, green: 0.2330494523, blue: 0.2606178522, alpha: 1)
        label.textAlignment = .left
    
        return label
    }()
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubviews()
    }
    
    override func layoutSubviews() {
//        setupSubviews()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Layout

extension UmraGideTopImageTVC {
    
    private func setupSubviews() {
        addSubviews(stackView)
        configureConstraints()
    }
    
    private func configureConstraints() {
        imgView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(260)
        }
        
        headerLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top).offset(-UIWindow.safeAreaInsets.top)
            make.left.equalTo(self.snp.left).offset(0)
            make.right.equalTo(self.snp.right).offset(0)
            make.bottom.equalTo(self.snp.bottom).offset(-16)
        }
    }
}
