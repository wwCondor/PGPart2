//
//  ButtonDesign.swift
//  AwesomeLand Pass Generator
//
//  Created by Wouter Willebrands on 03/03/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//
import UIKit
import Foundation

@IBDesignable extension UIButton {
    
    @IBInspectable override var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
            layer.masksToBounds = true
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable override var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable override var borderColor: UIColor? {
        set {
            guard let uiColor = newValue else { return }
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else { return nil }
            return UIColor(cgColor: color)
        }
    }
}
