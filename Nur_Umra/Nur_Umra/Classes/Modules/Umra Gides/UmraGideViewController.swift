//
//  UmraGideViewController.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 22/02/23
//

import UIKit


class UmraGideViewController: UIViewController {
    
    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    // MARK: - Properties
    var presenter: ViewToPresenterHomeProtocol?
    var tableView: UITableView!
    var shareButton: UIButton!
    var shareImageView: UIImageView!
    
    
    // MARK: - Actions
    
}

// MARK: - TableView Delegate & Data Source

extension UmraGideViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return 4
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

// MARK: - UI Setup
extension UmraGideViewController {
    func createUIElements() {
        overrideUserInterfaceStyle = .light
        self.tableView = self.create_tableView()
        
        self.shareButton = self.create_backButton()
        self.view.addSubview(self.shareButton)
        
        self.shareImageView = self.create_backImageView()
        self.shareButton.addSubview(self.shareButton)
        
        self.navigationItem.title = ""
    }
}
