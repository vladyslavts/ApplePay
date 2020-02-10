//
//  ClassName.swift
//  Ryde
//
//  Created by Vladyslav Tsykhmistro on 31.10.2019.
//  Copyright © 2019 Alex Gerasimov. All rights reserved.
//

import UIKit

protocol ClassNameProtocol {
    static var className: String { get }
    var className: String { get }
}

extension ClassNameProtocol {
    static var className: String {
        return String(describing: self)
    }

    var className: String {
        return type(of: self).className
    }
}

extension NSObject: ClassNameProtocol {}
