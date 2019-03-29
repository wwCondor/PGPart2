//
//  Errors.swift
//  AwesomeLand
//
//  Created by Wouter Willebrands on 11/02/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//


// Here the different errors are displayed for possible and informative errors

import Foundation
import UIKit

enum SwipeError: Error {
    case fiveSecondsRule
}

enum RegistrationError: Error {
    case missingBirthday

    case ageCalculationFailed
    case dateConversionFailed
    case ageNotUnderFive
    case ageNotOverSixtyFive

    case missingFirstName
    case missingLastName
    
    case missingStreetAddress
    case missingCity
    case missingState
    case missingZipcode // set to 6 characters (some countries have letters)
    case zipcodeLength // currently set to 9 digits

    case missingSocialSecurityNumber
    case ssnLettersOrLenght
    
    case missingDateOfVisit
    
    case informationMissing
    case generalError
}

extension RegistrationError: LocalizedError {
    public var localizedDescription: String {
        switch self {
        case .missingBirthday:
            return "Please provide a valid birthday with format DD-MM-YYYY"
        case .ageCalculationFailed:
            return "Age calculation failed. \nPlease provide a valid date with format: \nDD-MM-YYYY"
        case .dateConversionFailed:
            return "Please provide a date with format DD-MM-YYYY"
        case .ageNotUnderFive:
            return "Could not cacluate age or age provided not under five. \nPlease provide a valid date with format: \nDD-MM-YYYY"
        case .ageNotOverSixtyFive:
            return "Could not calculate age or age provided not over sixtyfive. \nPlease provide a valid date with format: \nDD-MM-YYYY"
        case .missingFirstName:
            return "Please provide a first name"
        case .missingLastName:
            return "Please provide a last name"
        case .missingStreetAddress:
            return "Please provide street address"
        case .missingCity:
            return "Please provide a city"
        case .missingState:
            return "Please provide a state"
        case .missingZipcode:
            return "Pleaee provide a zipcode"
        case .zipcodeLength:
            return "Zipcode exceeds or has less than 6 characters. \nIf your country uses a different format please add '0' or omit the last digit(s)"
        case .missingSocialSecurityNumber:
            return "Please prove a social security number"
        case .ssnLettersOrLenght:
            return "Social security number exceeds or has less than 9 characters. \nIf your country uses a different format please add '0' or omit the last digit(s)"
        case .missingDateOfVisit:
            return "Please provide a date of visit"
        case .informationMissing:
            return "Please fill in all required fields"
        case .generalError:
            return "Please check all input fields. \nNote that date of birth and date of visit require a format: \nDD-MM-YYYY"
        }
    }
}


//    var localizedDescription: String {
//        switch self {
//        case .missingBirthday:
//            return "Please provide a valid birthday with format DD-MM-YYYY"
//        case .ageCalculationFailed:
//            return "Age calculation failed"
//        case .dateConversionFailed:
//            return "Please provide a birthday with format DD-MM-YYYY"
//        case .ageNotUnderFive:
//            return "Age provided not under five"
//        case .ageNotOverSixtyFive:
//            return "Age provided not over sixtyfive"
//        case .missingFirstName:
//            return "Please provide a first name"
//        case .missingLastName:
//            return "Please provide a last name"
//        case .lenghtName:
//            return "Lenght of first or last name exceeds 16 characters"
//        case .missingStreetAddress:
//            return "Please provide street address"
//        case .missingCity:
//            return "Please provide a city"
//        case .missingState:
//            return "Please provide a state"
//        case .missingZipcode:
//            return "Pleaee provide a zipcode"
//        case .zipcodeLength:
//            return "Zipcode exceeds 6 characters "
//        case .missingSocialSecurityNumber:
//            return "Please prove a social security number"
//        case .ssnLettersOrLenght:
//            return "Social security number exceeds 9 digits"
//        case .missingDateOfVisit:
//            return "Please provide a date of visit"
//        }
//    }


