//
//  Errors.swift
//  AwesomeLand
//
//  Created by Wouter Willebrands on 11/02/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//


// Here the different errors are displayed for possible and informative errors
// Classic Guests and Vip guests do not need tto register any information

import Foundation

// These are the different types of errors
// each conforms to the Error-protocol

// All errors for Employee Registration
enum ChildRegistrationError: Error {
    case provideValidDateOfBirth, dateConversionFailed, ageCalculationFailed, ageNotUnderFive
}

// All errors for Season Guest Registration
enum SeasonGuestRegistrationErrors: Error {
    case missingFirstName, missingLastName, missingStreetAddress, missingCity, missingState, missingZipcode
}

enum SeniorGuestRegistrationErrors: Error {
    case missingFirstName, missingLastName, missingDateOfBirth
}

// All errors for Employee Registration
enum EmployeeRegistrationError: Error {
    case missingFirstName, missingLastName, missingStreetAddress, missingCity, missingState, missingZipcode
}

// Additional errors for Contract Employees
enum ContractEmployeeRegistrationErrors: Error {
    case missingSocialSecurityNumber, missingDateOfBirth
}

// All errors for Vendor Registration
enum VendorRegistrationErrors: Error {
    case missingDateOfBirth, missingDateOfVisit
}

// Should be able to combine most/all into single Error enum
enum RegistrationError: Error {
    case missingBirthday // (description: String)
    case missingFirstName
    case missingLastName
    
    case missingStreetAddress
    case missingCity
    case missingState
    case missingZipcode
    
    case missingSocialSecurityNumber
    case missingDateOfVisit
}




