//
//  SwipeAlert.swift
//  AwesomeLand Pass Generator
//
//  Created by Wouter Willebrands on 28/03/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//

import Foundation
import UIKit

extension SecondViewController {
    
    func swipeAlert(description: String) {
        
        let alert = UIAlertController(title: "You shall not Pass", message: description, preferredStyle: .alert)
        let confirm = UIAlertAction(title: "Confirm", style: .default) {
            (action) in alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(confirm)
        present(alert, animated: true, completion: nil)
    }
}
