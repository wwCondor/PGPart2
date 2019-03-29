//
//  errorAlert.swift
//  AwesomeLand Pass Generator
//
//  Created by Wouter Willebrands on 27/03/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//
import UIKit
import Foundation

extension ViewController {

    func errorAlert(description: String) {

        let alert = UIAlertController(title: "Registration Error", message: description, preferredStyle: .alert)

        let confirm = UIAlertAction(title: "Confirm", style: .default) {
            (action) in alert.dismiss(animated: true, completion: nil)
        }

        alert.addAction(confirm)
        self.present(alert, animated: true, completion: nil)
    }
}

//extension ViewController {
//
//    func showlert(description: String) {
//
//        let alert = UIAlertController(title: "Registration Error", message: description, preferredStyle: .alert)
//
//        let confirm = UIAlertAction(title: "Confirm", style: .default) {
//            (action) in alert.dismiss(animated: true, completion: nil)
//        }
//
//        alert.addAction(confirm)
//
//        if firstNameTF.text == "" || firstNameTF.text!.count > 12 {
//            let description = "bla"
//        }
//
//
//        self.present(alert, animated: true, completion: nil)
//
//
//    }
//}


//extension Entrant {
//
//    func present(using viewController: UIViewController, errorDescription: String) {
//  //  }, animated: Bool, completion: (() -> Void)? = nil) {
//        self.errorAlert(description: errorDescription)
//    }
//
//    func errorAlert(description: String) {
//
//        let alert = UIAlertController(title: "Registration Error", message: description, preferredStyle: .alert)
//
//        let confirm = UIAlertAction(title: "Confirm", style: .default) {
//            (action) in alert.dismiss(animated: true, completion: nil)
//        }
//
//        alert.addAction(confirm)
//        self.present(using: ViewController, errorDescription: description)
//    }
//}
