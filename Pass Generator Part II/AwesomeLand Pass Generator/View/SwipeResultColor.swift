//
//  SwipeResultColor.swift
//  AwesomeLand Pass Generator
//
//  Created by Wouter Willebrands on 22/03/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    struct SwipeResultColor {
        static var normalColor: UIColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1) // White
        static var accessDeniedColor: UIColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1.0) // Red
        static var accessGrantedColor: UIColor = UIColor(red: 0/255, green: 255/255, blue: 0/255, alpha: 1.0) // Green
        static var alteredStateBorderColor: UIColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1) // White
        static var normalStateBorderColor: UIColor = UIColor(red: 8/255, green: 36/255, blue: 78/255, alpha: 1) // Dark blue
    }
}
