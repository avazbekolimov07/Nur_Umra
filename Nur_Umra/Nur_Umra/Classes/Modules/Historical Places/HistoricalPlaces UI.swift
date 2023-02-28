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
        
        
        tableView.register(HistoricalPlacesTVC.self , forCellReuseIdentifier: HistoricalPlacesTVC.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.frame = self.view.frame
        tableView.separatorStyle = .none
        tableView.separatorStyle = .none
        
        self.view.addSubview(baseView)
        self.baseView.addSubview(tableView)
        
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
