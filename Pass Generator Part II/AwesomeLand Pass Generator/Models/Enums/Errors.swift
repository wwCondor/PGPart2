//
//  Errors.swift
//  AwesomeLand
//
//  Created by Wouter Willebrands on 11/02/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//


// Here the different errors are displayed for possible and informative errors

import Foundation

enum RegistrationError: Error {
    case missingBirthday
    case ageCalculationFailed
    case dateConversionFailed
    case ageNotUnderFive
    case missingFirstName
    case missingLastName
    
    case missingStreetAddress
    case missingCity
    case missingState
    case missingZipcode
    
    case missingSocialSecurityNumber
    case missingDateOfVisit
}

enum SwipeError: Error {
    case fiveSecondsRule
}




