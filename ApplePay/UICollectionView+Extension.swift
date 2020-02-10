//
//  UICollectionView+Extension.swift
//  Ryde
//
//  Created by Vladyslav Tsykhmistro on 03.11.2019.
//  Copyright © 2019 Alex Gerasimov. All rights reserved.
//

import UIKit

public extension UICollectionView {
    
    func register<T: UICollectionViewCell>(_ cellType: T.Type, bundle: Bundle? = nil) {
        let className = cellType.className
        let nib = UINib(nibName: className, bundle: bundle)
        register(nib, forCellWithReuseIdentifier: className)
    }

    func register<T: UICollectionViewCell>(_ cellTypes: [T.Type], bundle: Bundle? = nil) {
        cellTypes.forEach { register($0, bundle: bundle) }
    }

    func register<T: UICollectionReusableView>(_ reusableViewType: T.Type,
                                               ofKind kind: String = UICollectionView.elementKindSectionHeader,
                                                      bundle: Bundle? = nil) {
        let className = reusableViewType.className
        let nib = UINib(nibName: className, bundle: bundle)
        register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: className)
    }

    func register<T: UICollectionReusableView>(_ reusableViewTypes: [T.Type],
                                               ofKind kind: String = UICollectionView.elementKindSectionHeader,
                                                      bundle: Bundle? = nil) {
        reusableViewTypes.forEach { register($0, ofKind: kind, bundle: bundle) }
    }

    func dequeue<T: UICollectionViewCell>(_ cell: T.Type,
                                                             for indexPath: IndexPath) -> T? {
        return dequeueReusableCell(withReuseIdentifier: cell.className, for: indexPath) as? T
    }

    func dequeue<T: UICollectionReusableView>(_ view: T.Type,
                                                                 for indexPath: IndexPath,
                                                                 ofKind kind: String = UICollectionView.elementKindSectionHeader) -> T? {
        return dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: view.className, for: indexPath) as? T
    }
}
