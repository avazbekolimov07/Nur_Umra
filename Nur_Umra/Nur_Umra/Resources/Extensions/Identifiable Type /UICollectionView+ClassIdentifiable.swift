//
//  UICollectionView+ClassIdentifiable.swift
//  Nur_Umra
//
//  Created by AvazbekOS on 21/02/23.
//

import UIKit

// MARK: - UICollectionViewCell

extension UICollectionView {

    func register<C: UICollectionViewCell>(cellType: C.Type) where C: ClassIdentifiable {
        register(cellType.self, forCellWithReuseIdentifier: cellType.reuseId)
    }

    func dequeueReusableCell<C: UICollectionViewCell>(withCellType type: C.Type = C.self, for indexPath: IndexPath) -> C where C: ClassIdentifiable {
        guard let cell = dequeueReusableCell(withReuseIdentifier: type.reuseId, for: indexPath) as? C
        else { fatalError(makeItemError(withIdentifier: type.reuseId, type: C.self)) }

        return cell
    }

}

// MARK: - UICollectionReusableView

extension UICollectionView {

    enum SupplymentaryViewKind {
        case header
        case footer
        case background

        init?(identifier: String) {
            switch identifier {
            case elementKindSectionHeader:
                self = .header
            case elementKindSectionFooter:
                self = .footer
            case "background":
                self = .background
            default:
                return nil
            }
        }

        var identifier: String {
            switch self {
            case .header:
                return elementKindSectionHeader
            case .footer:
                return elementKindSectionFooter
            case .background:
                return String(describing: self)
            }
        }
    }

    func registerView<C: UICollectionReusableView>(ofKind kind: SupplymentaryViewKind, viewType: C.Type) where C: ClassIdentifiable {
        register(viewType.self, forSupplementaryViewOfKind: kind.identifier, withReuseIdentifier: viewType.reuseId)
    }

    func dequeueReusableView<C: UICollectionReusableView>(ofKind kind: SupplymentaryViewKind, withViewType type: C.Type = C.self, for indexPath: IndexPath) -> C where C: ClassIdentifiable {
        guard let view = dequeueReusableSupplementaryView(ofKind: kind.identifier, withReuseIdentifier: type.reuseId, for: indexPath) as? C
        else { fatalError(makeItemError(withIdentifier: type.reuseId, type: C.self)) }

        return view
    }

}

// MARK: - Dequeue Error Method

extension UICollectionView {

    private func makeItemError<T>(withIdentifier reuseIdentifier: String, type _: T) -> String {
        return "Couldn't dequeue \(T.self) with identifier \(reuseIdentifier)"
    }

}
