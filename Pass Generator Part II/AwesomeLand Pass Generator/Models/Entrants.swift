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
// Contract Employees
// Vendors

// Entrant is the superclass
/*
class Entrant {
     var birthday: String?
    
     init(birthday: String?) throws {
        guard let birthday = birthday else {
            throw EntrantError.missingBirthday(description: "Invalid date of birth")
        }
            self.birthday = birthday
        }
}
 */

class Entrant {
    var birthday: String?
    
    init(birthday: String?) {
        self.birthday = birthday
        }
}


class Guest: Entrant, GuestProtocol { // Guest need to conform Guest protocol
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


// Employees need to fill in the following information
class Employee: Entrant, EmployeeProtocol { // These need to conform Employee protocol
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
    var projectNumber: Project
    
    init(socialSecurityNumber: String, projectNumber: Project, type: EmployeeType, firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: String, birthday: String?) {
        
        self.socialSecurityNumber = socialSecurityNumber
        self.projectNumber = projectNumber
        
        super.init(type: type, firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipCode: zipCode, birthday: birthday)
    }
}



// Vendor is a subclass for Entrant and conforms VendorProtocol
class Vendor: Entrant { // VendorProtocol {
    var company: Company
    var firstName: String
    var lastName: String
    var visitingDate: String
    
    init(company: Company, firstName: String, lastName: String, visitingDate: String, birthday: String?) {
        self.company = company
        self.firstName = firstName
        self.lastName = lastName
        self.visitingDate = visitingDate
        
        super.init(birthday: birthday)
        
    }
}












