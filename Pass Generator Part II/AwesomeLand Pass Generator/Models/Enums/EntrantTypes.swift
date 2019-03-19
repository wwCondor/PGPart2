//
//  Enums.swift
//  AwesomeLand Pass Generator
//
//  Created by Wouter Willebrands on 11/03/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//

import Foundation

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
    case p1001 = "1001"
    case p1002 = "1002"
    case p1003 = "1003"
    case p2001 = "2001"
    case p2002 = "2002"
}

// Vendor companies
enum Company: String {
    case acme = "Acme"
    case orkin = "Orkin"
    case fedex = "Fedex"
    case nwElectrical = "NWElectrical"
}
