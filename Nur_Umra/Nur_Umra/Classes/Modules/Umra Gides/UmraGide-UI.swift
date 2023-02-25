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
        tableView.backgroundColor = .white

        tableView.showsVerticalScrollIndicator = false
        tableView.contentInset.bottom = UIWindow.safeAreaInsets.bottom
        
        tableView.register(cellType: UmraGideTopImageTVC.self)
        tableView.register(cellType: UmraGideTVC.self)
        
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(self.view.snp.top)
            make.left.equalTo(self.view.snp.left)
            make.bottom.equalTo(self.view.snp.bottom)
            make.right.equalTo(self.view.snp.right)
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
        
        button.setImage(UIImage(systemName: "chevron.left")?.applyingSymbolConfiguration(.init(weight: .semibold) ) , for: .normal)
        button.tintColor = .white
        button.bringSubviewToFront(button.imageView!)

        view.addSubview(button)
        button.addTarget(self, action: #selector(handleBackButton), for: .touchUpInside)
    
        button.snp.makeConstraints { make in
            make.width.equalTo(36)
            make.height.equalTo(36)
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(20)
            make.left.equalTo(self.view.snp.left).offset(16)
        }
        
        return button
    }

}
