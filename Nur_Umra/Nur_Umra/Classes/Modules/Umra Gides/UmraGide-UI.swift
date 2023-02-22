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
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        
        self.view.addSubview(table)
        
        return table
    }
    
    func create_backButton() -> UIButton {
        let button = UIButton()
        
        return button
    }
    
    func create_backImageView() -> UIImageView {
        let image = UIImageView()
        
        return image
    }
}
