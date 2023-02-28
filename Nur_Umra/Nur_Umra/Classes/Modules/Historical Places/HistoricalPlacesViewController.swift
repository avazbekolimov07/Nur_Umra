//
//  HistoricalPlacesViewController.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 27/02/23.
//

import UIKit

class HistoricalPlacesViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View -> did load")
        presenter?.viewDidLoad()
    }
    
    // MARK: - Properties
    var presenter: ViewToPresenterHistoricalPlacesProtocol?
    var tableView: UITableView!
    var baseView: UIView!
    var refreshControl: UIRefreshControl!
    
    // MARK: - Actions
    @objc func refresh() {
        presenter?.refresh()
    }
    
}

extension HistoricalPlacesViewController: PresenterToViewHistoricalPlacesProtocol {
  
    
    func createUIElements() {
        print("View - create ui elements")
        self.baseView = self.create_baseView()
        self.tableView = self.createTableView()
        self.refreshControl = self.create_refreshController()
        self.tableView.addSubview(refreshControl)
       
    }
    
    func onFetchSuccess() {
        print("success")
        self.tableView.reloadData()
        self.refreshControl.endRefreshing()
    }
    
    func onFetchFailure(errorCode: Int) {
        print("failure eror code on fetch historical place - ", errorCode)
        self.refreshControl.endRefreshing()
    }
    
    
}

extension HistoricalPlacesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (presenter?.numberOfRowsInSection())!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HistoricalPlacesTVC", for: indexPath) as? HistoricalPlacesTVC
        else {
            return UITableViewCell()
        }
        cell.updateCell(with: presenter?.eachPlacesData(indexPath: indexPath) )
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        return cell
    }
    
    
}
