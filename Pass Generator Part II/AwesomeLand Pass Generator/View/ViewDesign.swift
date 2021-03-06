//
//  ViewDesign.swift
//  AwesomeLand Pass Generator
//
//  Created by Wouter Willebrands on 12/03/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//
import UIKit
import Foundation

@IBDesignable extension UIView {
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue
            layer.masksToBounds = true
        }
        get {
            return layer.borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
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
