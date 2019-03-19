//
//  Protocols.swift
//  AwesomeLand
//
//  Created by Wouter Willebrands on 18/02/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//

import Foundation

// Each entrance has a registration protocol
// Consisting of several checks

// This is the entrance registration protocols
// for Guests:
protocol GuestProtocol {
    func isEligibleForFreeEntry() throws -> Bool
    func childRegistrationComplete() -> Bool
    func assignPassToGuest(entrant: Guest) -> Pass?
    
}

// for Employees:
protocol EmployeeProtocol {
    func employeeRegistrationCheck(entrant: Employee) throws
    func employeeRegistrationComplete(entrant: Employee) -> Bool
    func assignPassToEmployee(entrant: Employee) -> Pass?
    
}

// for contract Employees
protocol ContractEmployeeProtocol {
    func employeeRegistrationCheck(entrant: Employee) throws
    func contractEmployeeRegistrationCheck(entrant: ContractEmployee) throws
    func employeeRegistrationComplete(entrant: Employee) -> Bool
    func contractEmployeeRegistrationComplete(entrant: ContractEmployee) -> Bool
    func assignPassToEmployee(entrant: Employee) -> Pass?
}

// for Vendors:
protocol VendorProtocol {
    func vendorRegistrationCheck(entrant: Vendor) throws
    func vendorRegistrationComplete(entrant: Vendor) -> Bool
    func assignPassToVendor(entrant: Vendor) -> Pass?
}
