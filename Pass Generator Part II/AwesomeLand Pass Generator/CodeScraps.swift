//
//  CodeScraps.swift
//  AwesomeLand Pass Generator
//
//  Created by Wouter Willebrands on 26/03/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//

import Foundation

// These are the different types of errors
// each conforms to the Error-protocol

// All errors for Employee Registration
//enum ChildRegistrationError: Error {
//    case provideValidDateOfBirth, dateConversionFailed, ageNotUnderFive
//}
//
//// All errors for Season Guest Registration
//enum SeasonGuestRegistrationErrors: Error {
//    case missingFirstName, missingLastName, missingStreetAddress, missingCity, missingState, missingZipcode
//}
//
//enum SeniorGuestRegistrationErrors: Error {
//    case missingFirstName, missingLastName, missingDateOfBirth
//}
//
//// All errors for Employee Registration
//enum EmployeeRegistrationError: Error {
//    case missingFirstName, missingLastName, missingStreetAddress, missingCity, missingState, missingZipcode, missingSocialSecurityNumber
//}
//
//// Additional errors for Contract Employees
//enum ContractEmployeeRegistrationErrors: Error {
//    case missingDateOfBirth
//}
//
//// All errors for Vendor Registration
//enum VendorRegistrationErrors: Error {
//    case missingDateOfBirth, missingDateOfVisit
//}

//enum SeasonGuestRegistrationErrors: Error {
//    case missingFirstName, missingLastName, missingStreetAddress, missingCity, missingState, missingZipcode
//}

//enum RegistrationError: Error {
//    case missingBirthday
//    case missingFirstName
//    case missingLastName
//
//    case missingStreetAddress
//    case missingCity
//    case missingState
//    case missingZipcode
//
//    case missingSocialSecurityNumber
//    case missingDateOfVisit
//}

extension Entrant {

    func checkAge(birthday: String?) -> Int? {
        
        guard let dateConverted = convert(birthday: birthday) else { return nil }
        guard let age = Calendar.current.dateComponents([.year], from: dateConverted, to: Date()).year else {
            return nil
        }
        return age
    }


    func convert(birthday: String?) -> Date? {
        
        if let birthday = birthday {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy"
            let dateStringProvided = dateFormatter.date(from: birthday)
            
            guard let dateConverted = dateStringProvided else {
                return nil
            }
            return dateConverted
        } else {
            return nil
        }
    }

    func checkEntrantInformation() throws -> Bool {

        switch self {
        case let guest as Guest:

            switch guest.type {
            case .classic:
                return true
            case .vip:
                return true
            case .freeChild:
                if guest.birthday == "" {
                throw RegistrationError.missingBirthday
                } else if convert(birthday: birthday) == nil {
                    throw RegistrationError.dateConversionFailed
                } else if let age = checkAge(birthday: birthday) {
                    if age > 5 {
                        throw RegistrationError.ageNotUnderFive
                    }
                }
            default: return true
            }
            
        case let senior as SeniorGuest:
                if senior.birthday == "" {
                    throw RegistrationError.missingBirthday
                } else if senior.firstName == "" {
                    throw RegistrationError.missingFirstName
                } else if senior.lastName == "" {
                    throw RegistrationError.missingLastName
                }
    
        case let season as SeasonGuest:
            if season.birthday == "" {
                throw RegistrationError.missingBirthday
            } else if season.firstName == "" {
                throw RegistrationError.missingFirstName
            } else if season.lastName == "" {
                throw RegistrationError.missingLastName
            } else if season.streetAddress == "" {
                throw RegistrationError.missingStreetAddress
            } else if season.city == "" {
                throw RegistrationError.missingCity
            } else if season.state == "" {
                throw RegistrationError.missingState
            } else if season.zipCode == "" {
                throw RegistrationError.missingZipcode
            }

        case let employee as Employee:
            if employee.birthday == "" {
                throw RegistrationError.missingBirthday
            } else if employee.firstName == "" {
                throw RegistrationError.missingFirstName
            } else if employee.lastName == "" {
                throw RegistrationError.missingLastName
            } else if employee.streetAddress == "" {
                throw RegistrationError.missingStreetAddress
            } else if employee.city == "" {
                throw RegistrationError.missingCity
            } else if employee.state == "" {
                throw RegistrationError.missingState
            } else if employee.zipCode == "" {
                throw RegistrationError.missingZipcode
            } else if employee.ssn == "" {
                throw RegistrationError.missingSocialSecurityNumber
            }

        case let contractee as ContractEmployee:
            if contractee.birthday == "" {
                throw RegistrationError.missingBirthday
            } else if contractee.firstName == "" {
                throw RegistrationError.missingFirstName
            } else if contractee.lastName == "" {
                throw RegistrationError.missingLastName
            } else if contractee.streetAddress == "" {
                throw RegistrationError.missingStreetAddress
            } else if contractee.city == "" {
                throw RegistrationError.missingCity
            } else if contractee.state == "" {
                throw RegistrationError.missingState
            } else if contractee.zipCode == "" {
                throw RegistrationError.missingZipcode
            } else if contractee.ssn == "" {
                throw RegistrationError.missingSocialSecurityNumber
                }

        case let vendor as Vendor:
            if vendor.birthday == "" {
                throw RegistrationError.missingBirthday
            } else if vendor.firstName == "" {
                throw RegistrationError.missingFirstName
            } else if vendor.lastName == "" {
                throw RegistrationError.missingLastName
            } else if vendor.visitingDate == "" {
                throw RegistrationError.missingDateOfVisit
                }
        default:
            return true
        }
        return false
    }
}
