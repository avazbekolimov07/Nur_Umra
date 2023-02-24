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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - Properties
    var presenter: ViewToPresenterUmraGideProtocol?
    var tableView: UITableView!
    var shareButton: UIButton!
    
    
    // MARK: - Actions
    @objc func handleBackButton() {
        
    }
    
}

extension UmraGideViewController: PresenterToViewUmraGideProtocol {
    
    
    
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
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withCellType: UmraGideTopImageTVC.self, for: indexPath)
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withCellType: UmraGideTVC.self, for: indexPath)
            
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    // Set the spacing between sections
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section != 0 {
            return 24
        }
        return 0
    }
    
    // Make the background color show through
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    private func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 55
    }
    
}

// MARK: - UI Setup
extension UmraGideViewController {
    func createUIElements() {
        overrideUserInterfaceStyle = .light
        self.tableView = self.create_tableView()
        self.shareButton = self.create_backButton()
        self.navigationItem.title = ""
    }
}
