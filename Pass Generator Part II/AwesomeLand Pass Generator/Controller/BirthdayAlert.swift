//
//  BirthdayAlert.swift
//  AwesomeLand Pass Generator
//
//  Created by Wouter Willebrands on 28/03/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//

import Foundation
import UIKit

extension SecondViewController {
    
    func birthdayAlert(description: String) {
        
        let alert = UIAlertController(title: "Happy Birthday!", message: description, preferredStyle: .alert)
        let confirm = UIAlertAction(title: "Yay! Ice cream!", style: .default) {
            (action) in alert.dismiss(animated: true, completion: nil)
        }
        
        alert.addAction(confirm)
        present(alert, animated: true, completion: nil)
    }
}
