//
//  HistoricalPlaces UI.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 27/02/23.
//

import Foundation
import SnapKit

extension HistoricalPlacesViewController {
    func createTableView() -> UITableView  {
        let tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .clear
        
        
        tableView.register(cellType: HistoricalPlacesTVC.self)
        tableView.delegate = self
        tableView.dataSource = self
    
        tableView.separatorStyle = .none
        
        self.view.addSubview(baseView)
        self.baseView.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.left.equalTo(self.baseView.snp.left)
            make.right.equalTo(self.baseView.snp.right)
            make.bottom.equalTo(self.baseView.snp.bottom)
        }
        
     
        
        self.view.backgroundColor = .white
        
        return tableView
    }
    
    func create_refreshController() -> UIRefreshControl {
        let refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Refreshing")
        
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        return refreshControl
    }
    

}
