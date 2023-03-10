//
//  HistoricalPlacesViewController.swift
//  Nur_Umra
//
//  Created by Azizbek Salimov on 27/02/23.
//

import UIKit
import SkeletonView

class HistoricalPlacesViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View -> did load")
        presenter?.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.viewWillAppear()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presenter?.viewWillDisappear()
    }
    
    // MARK: - Properties
    var presenter: ViewToPresenterHistoricalPlacesProtocol?
    var tableView: UITableView!
    var baseView: UIView!
    var refreshControl: UIRefreshControl!
    
    // MARK: - Actions
    @objc func refresh() {
        presenter?.refresh()
        
        tableView.isSkeletonable = true
        tableView.showAnimatedGradientSkeleton()
    }
    
}

extension HistoricalPlacesViewController: PresenterToViewHistoricalPlacesProtocol {
  
    
    func createUIElements() {
        print("View - create ui elements")
        self.baseView = self.create_baseView()
        self.tableView = self.createTableView()
        self.refreshControl = self.create_refreshController()
        self.tableView.addSubview(refreshControl)
        
        baseView.isSkeletonable = true
        tableView.isSkeletonable = true
        tableView.showAnimatedGradientSkeleton()
    }
    
    func onFetchSuccess() {
        self.tableView.stopSkeletonAnimation()
        self.view.hideSkeleton(reloadDataAfter: true, transition: .crossDissolve(0.25))
        
        self.tableView.reloadData()
        self.refreshControl.endRefreshing()
    }
    
    func onFetchFailure(errorCode: Int) {
        print("failure eror code on fetch historical place - ", errorCode)
        self.tableView.stopSkeletonAnimation()
        self.view.hideSkeleton(reloadDataAfter: true, transition: .crossDissolve(0.25))
        
        self.refreshControl.endRefreshing()
    }
    
    func handleViewWillAppear() {
        setNeedsStatusBarAppearanceUpdate()
        UIApplication.shared.statusBarStyle = .lightContent
        navigationController?.navigationBar.isHidden = false
        self.navigationItem.title = "Islom tarixiga oid joylar"
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.1716529429, green: 0.1766341031, blue: 0.19795838, alpha: 1)
    }
    
    func handleViewWillDisappear() {
        UIApplication.shared.statusBarStyle = .default
    }
    
}

extension HistoricalPlacesViewController: UITableViewDelegate, SkeletonTableViewDataSource {
    
    func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return HistoricalPlacesTVC.self.reuseId
    }
        
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRowsInSection() ?? 0 // default is 4 in presenter func
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withCellType: HistoricalPlacesTVC.self, for: indexPath)
        cell.updateCell(with: presenter?.eachPlacesData(indexPath: indexPath))
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectRawAt(indexPath: indexPath)
    }
    
}
