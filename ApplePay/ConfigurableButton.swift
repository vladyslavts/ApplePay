//
//  ConfigurableButton.swift
//  MindClash
//
//  Created by Alexander Gerasimov on 11/29/16.
//  Copyright © 2016 MMH. All rights reserved.
//

import UIKit

enum ButtonTouchAction: String {
    case close = "close"
    case closeWindow = "closeWindow"
    case goBack = "go back"
    case openController = "open controller"
    case none = ""
}

@IBDesignable
class ConfigurableButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }

    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor? = UIColor.white {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }

    @IBInspectable var fontColor: UIColor? = UIColor.white {
        didSet {
            self.setTitleColor(fontColor, for: .normal)
        }
    }

    @IBInspectable var outerShadowOffset: CGSize = CGSize() {
        didSet {
            layer.masksToBounds = true

            layer.shadowOffset = outerShadowOffset
            layer.shouldRasterize = true
        }
    }

    @IBInspectable var outShadowColor: UIColor? = UIColor.white {
        didSet {
            layer.masksToBounds = true
            layer.shadowColor = outShadowColor?.cgColor
        }
    }

    @IBInspectable var outShadowOpacity: Float = 0.0 {
        didSet {
            layer.masksToBounds = true
            layer.shadowOpacity = outShadowOpacity
        }
    }

    @IBInspectable var outShadowRadius: Float = 0.0 {
        didSet {
            layer.masksToBounds = true
            layer.shadowRadius = CGFloat(outShadowRadius)
        }
    }

    @IBInspectable var touchAction: String = "" {
        didSet {
            if let action = ButtonTouchAction(rawValue: touchAction) {
                switch action {
                case .close:
                    addTarget(self, action: #selector(closeAction), for: UIControl.Event.touchUpInside)
                case .closeWindow:
                    addTarget(self, action: #selector(closeWindowAction), for: UIControl.Event.touchUpInside)

                default:
                    return
                }
            }
        }
    }

    @objc dynamic
    fileprivate func closeWindowAction(sender: AnyObject) {

        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }

            topController.dismiss(animated: true, completion: nil)
        }

    }

    @objc dynamic
    fileprivate func closeAction(sender: AnyObject) {

        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }

            topController.dismiss(animated: true, completion: nil)
        }

    }
}
