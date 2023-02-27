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
        createUIElements()
    }
    
    // MARK: - Properties
    var presenter: ViewToPresenterHistoricalPlacesProtocol?
    var tableView: UITableView!
    
    
}

extension HistoricalPlacesViewController: PresenterToViewHistoricalPlacesProtocol {
    func createUIElements() {
        self.tableView = self.createTableView()
    }
    
    func onFetchSuccess() {
        print("success")
        self.tableView.reloadData()
    
    }
    
    func onFetchFailure(errorCode: Int) {
        print("failure eror code on fetch historical place - ", errorCode)
    }
    
    
}

extension HistoricalPlacesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HistoricalPlacesTVC", for: indexPath) as? HistoricalPlacesTVC
        else {
            return UITableViewCell()
        }
        cell.backgroundColor = .clear
        return cell
    }
    
    
}
