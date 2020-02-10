//
//  UITableView+Extension.swift
//  Ryde
//
//  Created by Vladyslav Tsykhmistro on 31.10.2019.
//  Copyright © 2019 Alex Gerasimov. All rights reserved.
//

import UIKit

extension UITableView {
    public func register<T: UITableViewCell>(_ cellType: T.Type, bundle: Bundle? = nil) {
        let className = cellType.className
        let nib = UINib(nibName: className, bundle: bundle)
        register(nib, forCellReuseIdentifier: className)
    }

    public func register<T: UITableViewCell>(_ cellTypes: [T.Type], bundle: Bundle? = nil) {
        cellTypes.forEach { register($0, bundle: bundle) }
    }

    public func dequeue<T: UITableViewCell>(_ type: T.Type, for indexPath: IndexPath) -> T? {
        return self.dequeueReusableCell(withIdentifier: type.className, for: indexPath) as? T
    }
    
    var registeredNibs: [String: UINib] {
        let dict = value(forKey: "_nibMap") as? [String: UINib]
        return dict ?? [:]
    }

    var registeredClasses: [String: Any] {
        let dict = value(forKey: "_cellClassDict") as? [String: Any]
        return dict ?? [:]
    }
}
