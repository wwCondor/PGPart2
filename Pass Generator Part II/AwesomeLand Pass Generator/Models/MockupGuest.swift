//
//  InputCheckers.swift
//  AwesomeLand Pass Generator
//
//  Created by Wouter Willebrands on 04/03/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//

import Foundation

// When "Create Pass" is pressed:
// All data entered needs to be checked
// Data needs to populate fields on next page

struct MockupGuest {
    // Guests
    static let mockupClassic = Guest(type: .classic, birthday: "15-09-1984")
    static let mockupFreeChild = Guest(type: .freeChild, birthday: "15-09-2018")
    static let mockupVip = Guest(type: .vip, birthday: "15-09-1984")
    static let mockupSenior = SeniorGuest(firstName: "Old", lastName: "Person", type: .senior, birthday: "15-09-1884")
    static let mockupSeason = SeasonGuest(firstName: "Summer", lastName: "Person", streetAddress: "Street", city: "City", state: "State", zipCode: "Zip", type: .season, birthday: "15-09-1984")
    
    // Employees
    static let mockupFoodService = Employee(type: .foodServices, firstName: "Hotte", lastName: "Doggerson", streetAddress: "Street", city: "City", state: "State", zipCode: "Zip", ssn: "12345678", birthday: "15-09-1984")
    static let mockupRideService = Employee(type: .rideServices, firstName: "Rollo", lastName: "Coast", streetAddress: "Street", city: "City", state: "State", zipCode: "Zip", ssn: "12345678", birthday: "15-09-1984")
    static let mockupMaintenance = Employee(type: .maintenance, firstName: "Bob", lastName: "Builder", streetAddress: "Street", city: "City", state: "State", zipCode: "Zip", ssn: "12345678", birthday: "15-09-1984")
    static let mockupManager = Employee(type: .manager, firstName: "Mr", lastName: "Manager", streetAddress: "Street", city: "City", state: "State", zipCode: "Zip", ssn: "12345678", birthday: "15-09-1984")
    
    // Contract Employees
    static let mockupContractP1001 = ContractEmployee(type: .contract, firstName: "Jill", lastName: "Person", streetAddress: "Street", city: "City", state: "State", zipCode: "Zip", ssn: "12345678", projectNumber: .p1001, birthday: "15-09-1984")
    static let mockupContractP1002 = ContractEmployee(type: .contract, firstName: "Jane", lastName: "Person", streetAddress: "Street", city: "City", state: "State", zipCode: "Zip", ssn: "12345678", projectNumber: .p1002, birthday: "15-09-1984")
    static let mockupContractP1003 = ContractEmployee(type: .contract, firstName: "Jimmy", lastName: "Person", streetAddress: "Street", city: "City", state: "State", zipCode: "Zip", ssn: "12345678", projectNumber: .p1003, birthday: "15-09-1984")
    static let mockupContractP2001 = ContractEmployee(type: .contract, firstName: "Jenny", lastName: "Person", streetAddress: "Street", city: "City", state: "State", zipCode: "Zip", ssn: "12345678",projectNumber: .p2001, birthday: "15-09-1984")
    static let mockupContractP2002 = ContractEmployee(type: .contract, firstName: "James", lastName: "Person", streetAddress: "Street", city: "City", state: "State", zipCode: "Zip", ssn: "12345678", projectNumber: .p2002, birthday: "15-09-1984")
    
    // Vendors
    static let mockupOrkinVendor = Vendor(company: .orkin, firstName: "Green", lastName: "Ork", visitingDate: "20-06-2019", birthday: "15-09-1884")
    static let mockupAcmeVendor = Vendor(company: .acme, firstName: "First", lastName: "Last", visitingDate: "20-06-2019", birthday: "15-09-1884")
    static let mockupFedexVendor = Vendor(company: .fedex, firstName: "Pat", lastName: "Postman", visitingDate: "20-06-2019", birthday: "15-09-1884")
    static let mockupNWElectricalVendor = Vendor(company: .nwElectrical, firstName: "Nicola", lastName: "Tesla", visitingDate: "20-06-2019", birthday: "15-09-1884")
    }
