//
//  Enums.swift
//  AwesomeLand Pass Generator
//
//  Created by Wouter Willebrands on 11/03/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//

import Foundation
import UIKit

// Guest types
enum GuestType {
    case classic
    case vip
    case freeChild // this requires age to check if eligible for free entry
    case season
    case senior // this requires age to check if eligible for senior status
}

// Employee types
enum EmployeeType {
    case manager
    case foodServices
    case rideServices
    case maintenance
    case contract
}

// Contract employee projects
enum Project: String {
    case p1001 = "Project 1001"
    case p1002 = "Project 1002"
    case p1003 = "Project 1003"
    case p2001 = "Project 2001"
    case p2002 = "Project 2002"
}

// Vendor companies
enum Company: String {
    case acme = "Acme"
    case orkin = "Orkin"
    case fedex = "Fedex"
    case nwElectrical = "NWElectrical"
}

// Here for better overview:
// extension to add company logos to pass
extension Company {
    var logo: UIImage {
        switch self
        {
        case .acme: return #imageLiteral(resourceName: "AcmeLogo")
        case .orkin: return #imageLiteral(resourceName: "OrkinLogo")
        case .fedex: return #imageLiteral(resourceName: "FedExLogo")
        case .nwElectrical: return #imageLiteral(resourceName: "NWELogo")
        }
    }
}
