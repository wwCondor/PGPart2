//
//  PassTypes.swift
//  AwesomeLand Pass Generator
//
//  Created by Wouter Willebrands on 11/03/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//

import Foundation

// These raw values will be used to populate the pass in the second viewController
// Would be nice to have specification for which project (Contract) or company (Vendor) as well

// Passes
enum TypeOfPass: String {
    case classic = "Classic Guest Pass"
    case vip = "VIP Pas"
    case freeChild = "Child Pass"
    case foodService = "Food Service Employee Pass"
    case rideService = "Ride Service Employee Pass"
    case maintenance = "Maintenance Employee Pass"
    case manager = "Manager Pass"
    case season = "Season Guest Pass"
    case senior = "Senior Guest Pass"
    case contract = "Contract Employee Pass"
    case vendor = "Vendor Pass"
    
}
