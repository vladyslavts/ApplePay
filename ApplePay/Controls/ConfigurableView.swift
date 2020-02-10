//
//  ConfigurableView.swift
//  MindClash
//
//  Created by Alexander Gerasimov on 11/30/16.
//  Copyright © 2016 MMH. All rights reserved.
//

import UIKit

@IBDesignable
class ConfigurableView: UIView {

    private var shadowLayer: CAShapeLayer!
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layoutSubviews()
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layoutSubviews()
        }
    }
    
    @IBInspectable var borderColor: UIColor?  = UIColor.white {
        didSet {
            layoutSubviews()
        }
    }
    
    
    @IBInspectable var shadowOffset: CGSize = CGSize() {
        didSet {
            layoutSubviews()
        }
    }
    
    @IBInspectable var shadowColor: UIColor?  = UIColor.white {
        didSet {
            layoutSubviews()
        }
    }
    
    @IBInspectable var shadowOpacity: Float  = 0.0 {
        didSet {
            layoutSubviews()
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat  = 0.0 {
        didSet {
            layoutSubviews()
        }
    }
    
    // MARK: - Private Properties
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if shadowLayer == nil {
            shadowLayer = CAShapeLayer()
        }
        
        shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius).cgPath
        shadowLayer.fillColor = backgroundColor?.cgColor
        
        shadowLayer.shadowColor = shadowColor?.cgColor
        shadowLayer.shadowPath = shadowLayer.path
//        shadowLayer.shadowOffset = CGSize(width: 0.0, height: 1.0)
//        shadowLayer.shadowOpacity = 0.2
//        shadowLayer.shadowRadius = 3
        
        
        shadowLayer.shadowOffset = shadowOffset
        shadowLayer.shadowOpacity = shadowOpacity
        shadowLayer.shadowRadius = shadowRadius

        layer.cornerRadius = cornerRadius
        layer.insertSublayer(shadowLayer, at: 0)
        layer.borderColor = borderColor?.cgColor
        layer.borderWidth = borderWidth
        layer.cornerRadius = cornerRadius
//        layer.masksToBounds = true
//        layer.shadowPath =
//            UIBezierPath(roundedRect: self.bounds,
//                         cornerRadius: cornerRadius).cgPath
//        layer.shadowColor = shadowColor?.cgColor
//        layer.shadowOpacity = shadowOpacity
//        layer.shadowOffset = shadowOffset
//        layer.shadowRadius = shadowRadius
//        layer.masksToBounds = false
//
    }
    
}
