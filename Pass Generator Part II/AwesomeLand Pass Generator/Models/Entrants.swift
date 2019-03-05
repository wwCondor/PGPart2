//
//  File.swift
//  AwesomeLand
//
//  Created by Wouter Willebrands on 11/02/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//


// These are the different kinds of entrants:
// Guests
// Employees

// Entrant is the superclass
// birthday has now been move to superclass for birthday check
class Entrant {
     var birthday: String?
    
     init(birthday: String?) {
        if let birthday = birthday {
            self.birthday = birthday
        }
    }
}

// MARK: - Guest entrants
// Guest is a subclass of entrant
// GuestType has the following enum cases
enum GuestType {
    case classic
    case vip
    case freeChild // this requires age to check if eligible for free entry
    case season
    case senior // this requires age to check if eligible for senior status
}

class Guest: Entrant, GuestEntrance { // Guest need to conform Guest protocol
    var type: GuestType
    
    init(type: GuestType, birthday: String?) { // birthday: String?
        self.type = type
        
        super.init(birthday: birthday)
        
    }
}

// Season and Senior guest are both subclasses of Guest
// Each requires more information input that the other guests
class SeasonGuest: Guest {
    var firstName: String
    var lastName: String
    var streetAddress: String
    var city: String
    var state: String
    var zipCode: String
    
    init(firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: String, type: GuestType, birthday: String?) {
        self.firstName = firstName
        self.lastName = lastName
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
        
        super.init(type: type, birthday: birthday)
    }
}

class SeniorGuest: Guest {
    var firstName: String
    var lastName: String
    
    init(firstName: String, lastName: String, type: GuestType, birthday: String?) {
        self.firstName = firstName
        self.lastName = lastName
        
        super.init(type: type, birthday: birthday)
    }
}



// MARK: - Employee entrants
// Employee is a subclass of entrant
// EmployeeType has the following enum cases
enum EmployeeType {
    case manager
    case foodServices
    case rideServices
    case maintenance
    case contract
}

// Employees need to fill in the following information
class Employee: Entrant, EmployeeEntrance { // These need to conform Employee protocol
    var type: EmployeeType
    var firstName: String
    var lastName: String
    var streetAddress: String
    var city: String
    var state: String
    var zipCode: String
    
    init(type: EmployeeType, firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: String, birthday: String?) {
       
        self.type = type
        self.firstName = firstName
        self.lastName = lastName
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
        
        super.init(birthday: birthday)
    }
}

// Contract Empoyees are an Employee subclass
class ContractEmployee: Employee {
    var socialSecurityNumber: String
    var projectNumber: String
    
    init(socialSecurityNumber: String, projectNumber: String, type: EmployeeType, firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: String, birthday: String?) {
        
        self.socialSecurityNumber = socialSecurityNumber
        self.projectNumber = projectNumber
        
        super.init(type: type, firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, birthday: birthday)
    }
}

// Vendor has a class on its own, since it is a third party, neither Guest nor Employee
enum Company {
    case acme
    case orkin
    case fedex
    case nwElectrical
}

// Vendor is a subclass for Entrant and conforms VendorProtocol
class Vendor: Entrant, VendorEntrance {
    var company: Company
    var firstName: String
    var lastName: String
    var vendorCompany: String
    var visitingDate: String
    
    init(company: Company, firstName: String, lastName: String, vendorCompany: String, visitingDate: String, birthday: String?) {
        self.company = company
        self.firstName = firstName
        self.lastName = lastName
        self.vendorCompany = vendorCompany
        self.visitingDate = visitingDate
        
        super.init(birthday: birthday)
        
    }
}












