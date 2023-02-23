//
//  UmraGide-UI.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 22/02/23.
//

import UIKit
import SnapKit

extension UmraGideViewController {
    
    func create_tableView() -> UITableView {
        // with two sections (1. Image <-> 2. Cells)
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        
        tableView.showsVerticalScrollIndicator = false
        
        tableView.contentInset.bottom = UIWindow.safeAreaInsets.bottom
        
        tableView.register(cellType: UmraGideTopImageTVC.self)
        tableView.register(cellType: UmraGideTVC.self)
        
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.left.equalTo(self.view.snp.left)
            make.right.equalTo(self.view.snp.right)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
        return tableView
    }
    
    func create_backButton() -> UIButton {
        let button = UIButton()
        
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

        view.addSubview(button)
        button.addTarget(self, action: #selector(handleBackButton), for: .touchUpInside)
    
        button.snp.makeConstraints { make in
            make.width.equalTo(36)
            make.height.equalTo(36)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(20)
            make.left.equalTo(self.view.snp.left).offset(16)
        }
        
        let image = UIImageView()
        image.isUserInteractionEnabled = false
        image.image = UIImage(named: "back_img")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = .white
        
        button.addSubview(image)
        image.snp.makeConstraints { make in
            make.width.equalTo(8)
            make.height.equalTo(16)
            make.centerY.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        return button
    }

}
