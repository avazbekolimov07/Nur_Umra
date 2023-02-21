//
//  UITableView+ClassIdentifiable.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 21/02/23.
//

import UIKit

// MARK: - UITableViewCell

extension UITableView {

    func register<T: UITableViewCell>(cellType: T.Type) where T: ClassIdentifiable {
        register(cellType.self, forCellReuseIdentifier: cellType.reuseId)
    }

    func dequeueReusableCell<T: UITableViewCell>(withCellType type: T.Type = T.self) -> T where T: ClassIdentifiable {
        guard let cell = dequeueReusableCell(withIdentifier: type.reuseId) as? T
        else { fatalError(dequeueError(reuseId: type.reuseId)) }

        return cell
    }

    func dequeueReusableCell<T: UITableViewCell>(withCellType type: T.Type = T.self, for indexPath: IndexPath) -> T where T: ClassIdentifiable {
        guard let cell = dequeueReusableCell(withIdentifier: type.reuseId, for: indexPath) as? T
        else { fatalError(dequeueError(reuseId: type.reuseId)) }

        return cell
    }

}

// MARK: - UITableViewHeaderFooterView

extension UITableView {

    func registerHeaderFooterView<T: UITableViewHeaderFooterView>(viewType: T.Type) where T: ClassIdentifiable {
        register(viewType.self, forHeaderFooterViewReuseIdentifier: viewType.reuseId)
    }

    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(withViewType type: T.Type = T.self) -> T where T: ClassIdentifiable {
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: type.reuseId) as? T
        else { fatalError(dequeueError(reuseId: type.reuseId)) }

        return view
    }

}

// MARK: - Dequeue Error Method

extension UITableView {

    private func dequeueError(reuseId: String) -> String {
        return "Couldn't dequeue cell with identifier \(reuseId)"
    }

}
