//
//  UmraAudios-UI.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 25/02/23.
//

import UIKit
import SnapKit

extension UmraAudiosViewController {
    
    // on play other cell also becoming on play state with button image...
    func create_tableView() -> UITableView {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear

        tableView.showsVerticalScrollIndicator = false
        tableView.contentInset.bottom = UIWindow.safeAreaInsets.bottom
        
        tableView.register(cellType: UmraAudioTVC.self)
        
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.left.equalTo(self.view.snp.left)
            make.bottom.equalTo(self.view.snp.bottom)
            make.right.equalTo(self.view.snp.right)
        }
        return tableView
    }

}
