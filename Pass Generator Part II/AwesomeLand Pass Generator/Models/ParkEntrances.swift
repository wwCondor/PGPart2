//
//  ParkEntrance.swift
//  AwesomeLand
//
//  Created by Wouter Willebrands on 13/02/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//

import Foundation

// At the park entrance/ticket office all Entrants go through a registration procedure
// There are two three different registration/entry points to the park to speed up registration process:
// - Guests
// - Employees
// - Vendor

// MARK: - Guest Extension
// The following functions are only relevant to guest entrants
extension Entrant {
    
    // This checks:
    // - If there is a birthday entered
    // - If date can be converted
    // - If age can be calculated from birthday
    // - If age is under five
    func isEligibleForFreeEntry() throws -> Bool {
        guard let birthday = birthday else {
            throw RegistrationError.missingBirthday
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let dateStringProvided = dateFormatter.date(from: birthday)
        
        guard let dateConverted = dateStringProvided else {
            throw RegistrationError.dateConversionFailed
        }
        
        guard let age = Calendar.current.dateComponents([.year], from: dateConverted, to: Date()).year else {
            throw RegistrationError.ageCalculationFailed
        }
        
        if age >= 5 {
            throw RegistrationError.ageNotUnderFive
            
        } else if age < 5 {
            return true
        }
        return false
    }
    
    // registration for child is complete when age is provided
    // AND when age is under 5 years
    // else returns error
    // errors are caught here
    func childRegistrationComplete() -> Bool {
        do {
            if try isEligibleForFreeEntry() {
                print("Child is eligible for free entrance")
                return true
            }
        } catch RegistrationError.missingBirthday {
            print("Please enter valid date of birth")
            return false
        } catch RegistrationError.dateConversionFailed {
            print("Date conversion failed")
            return false
        } catch RegistrationError.ageCalculationFailed {
            print("Age calculation failed")
            return false
        } catch RegistrationError.ageNotUnderFive {
            print("Age not under five")
            return false
        } catch {
            print("Unexpected error: \(error).")
            return false
        }
        return false
    }
}

extension Entrant {
    func seniorRegistrationCheck(entrant: SeniorGuest) throws {
        if entrant.firstName == "" {
            throw RegistrationError.missingFirstName
        } else if entrant.firstName.count > 16 || entrant.lastName.count > 16 {
            throw RegistrationError.lenghtName
        } else if entrant.lastName == "" {
            throw RegistrationError.missingLastName
        } else if entrant.birthday == "" {
            throw RegistrationError.missingBirthday
        }
        
        guard let birthday = birthday else {
            throw RegistrationError.missingBirthday
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let dateStringProvided = dateFormatter.date(from: birthday)
        
        guard let dateConverted = dateStringProvided else {
            throw RegistrationError.dateConversionFailed
        }
        
        guard let age = Calendar.current.dateComponents([.year], from: dateConverted, to: Date()).year else {
            throw RegistrationError.ageCalculationFailed
        }
        
        if age < 65 {
            throw RegistrationError.ageNotOverSixtyFive
            
        }
    }
    
    func seniorRegistrationComplete(entrant: SeniorGuest) -> Bool {
        do {
            try seniorRegistrationCheck(entrant: entrant)
            print("Registration is complete")
            return true
        } catch RegistrationError.missingFirstName {
            print("Please enter your first name on the registration form")
            return false
        } catch RegistrationError.missingLastName {
            print("Please enter your last name on the registration form")
            return false
        } catch RegistrationError.lenghtName {
            print("First or last name may not exceed 16 characters")
            return false
        } catch RegistrationError.missingBirthday {
            print("Please enter your date of birth on the registration form")
            return false
        } catch RegistrationError.dateConversionFailed {
            print("Date conversion failed")
            return false
        } catch RegistrationError.ageCalculationFailed {
            print("Age calculation failed")
            return false
        } catch RegistrationError.ageNotOverSixtyFive {
            print("Age not under 65")
            return false
        } catch {
            print("Unexpected error: \(error).")
            return false
        }
    }
}

extension Entrant {
    func seasonRegistrationCheck(entrant: SeasonGuest) throws {
        if entrant.firstName == "" {
            throw RegistrationError.missingFirstName
        } else if entrant.lastName == "" {
            throw RegistrationError.missingLastName
        } else if entrant.firstName.count > 16 || entrant.lastName.count > 16 {
            throw RegistrationError.lenghtName
        } else if entrant.streetAddress == "" {
            throw RegistrationError.missingStreetAddress
        } else if entrant.city == "" {
            throw RegistrationError.missingCity
        } else if entrant.state == "" {
            throw RegistrationError.missingState
        } else if entrant.zipCode == "" {
            throw RegistrationError.missingZipcode
        }
    }
    
    func seasonRegistrationComplete(entrant: SeasonGuest) -> Bool {
        do {
            try seasonRegistrationCheck(entrant: entrant)
            print("Registration is complete")
            return true
        } catch RegistrationError.missingFirstName {
            print("Please enter your first name on the registration form")
            return false
        } catch RegistrationError.missingLastName {
            print("Please enter your last name on the registration form")
            return false
        } catch RegistrationError.lenghtName {
            print("First or last name may not exceed 16 characters")
            return false
        } catch RegistrationError.missingStreetAddress {
            print("Please enter your street address on the registration form")
            return false
        } catch RegistrationError.missingCity {
            print("Please enter your city on the registration form")
            return false
        } catch RegistrationError.missingState {
            print("Please enter your state on the registration form")
            return false
        } catch RegistrationError.missingZipcode {
            print("Please enter your zipCode on the registration form")
            return false
        } catch {
            print("Unexpected error: \(error).")
            return false
        }
    }
 
}


// MARK: - Employee Extension
// The following functions are only relevant to Employee entrants
extension Entrant {
    
    // This functions throws errors when information is missing
    func employeeRegistrationCheck(entrant: Employee) throws {
        if entrant.firstName == "" {
            throw RegistrationError.missingFirstName
        } else if entrant.lastName == "" {
            throw RegistrationError.missingLastName
        } else if entrant.firstName.count > 16 || entrant.lastName.count > 16 {
            throw RegistrationError.lenghtName
        } else if entrant.streetAddress == "" {
            throw RegistrationError.missingStreetAddress
        } else if entrant.city == "" {
            throw RegistrationError.missingCity
        } else if entrant.state == "" {
            throw RegistrationError.missingState
        } else if entrant.zipCode == "" {
            throw RegistrationError.missingZipcode
        } else if entrant.ssn == "" {
            throw RegistrationError.missingSocialSecurityNumber
        }
    }
    
    // Here thrown errors are caught and returns Bool if registration complete
    func employeeRegistrationComplete(entrant: Employee) -> Bool {
        do {
            try employeeRegistrationCheck(entrant: entrant)
            print("Registration is complete")
            return true
        } catch RegistrationError.missingFirstName {
            print("Please enter your first name on the registration form")
            return false
        } catch RegistrationError.missingLastName {
            print("Please enter your last name on the registration form")
            return false
        } catch RegistrationError.lenghtName {
            print("First or last name may not exceed 16 characters")
            return false
        } catch RegistrationError.missingStreetAddress {
            print("Please enter your street address on the registration form")
            return false
        } catch RegistrationError.missingCity {
            print("Please enter your city on the registration form")
            return false
        } catch RegistrationError.missingState {
            print("Please enter your state on the registration form")
            return false
        } catch RegistrationError.missingZipcode {
            print("Please enter your zipcode on the registration form")
            return false
        } catch RegistrationError.missingSocialSecurityNumber {
            print("Please enter your social security number on the registration form")
            return false
        } catch {
            print("Unexpected error: \(error).")
            return false
        }
    }
    
    func contractEmployeeRegistrationCheck(entrant: ContractEmployee) throws {
        if entrant.firstName == "" {
            throw RegistrationError.missingFirstName
        } else if entrant.lastName == "" {
            throw RegistrationError.missingLastName
        } else if entrant.firstName.count > 16 || entrant.lastName.count > 16 {
            throw RegistrationError.lenghtName
        } else if entrant.streetAddress == "" {
            throw RegistrationError.missingStreetAddress
        } else if entrant.city == "" {
            throw RegistrationError.missingCity
        } else if entrant.state == "" {
            throw RegistrationError.missingState
        } else if entrant.zipCode == "" {
            throw RegistrationError.missingZipcode
        } else if entrant.ssn == "" {
            throw RegistrationError.missingSocialSecurityNumber
        }
    }
    
    
    func contractEmployeeRegistrationComplete(entrant: ContractEmployee) -> Bool {
        do {
            try contractEmployeeRegistrationCheck(entrant: entrant)
            print("Registration is complete")
            return true
        } catch RegistrationError.missingFirstName {
            print("Please enter your first name on the registration form")
            return false
        } catch RegistrationError.missingLastName {
            print("Please enter your last name on the registration form")
            return false
        } catch RegistrationError.lenghtName {
            print("First or last name may not exceed 16 characters")
            return false
        } catch RegistrationError.missingStreetAddress {
            print("Please enter your street address on the registration form")
            return false
        } catch RegistrationError.missingCity {
            print("Please enter your city on the registration form")
            return false
        } catch RegistrationError.missingState {
            print("Please enter your state on the registration form")
            return false
        } catch RegistrationError.missingZipcode {
            print("Please enter your zipcode on the registration form")
            return false
        } catch RegistrationError.missingSocialSecurityNumber {
            print("Please enter your social security number on the registration form")
            return false
        } catch {
            print("Unexpected error: \(error).")
            return false
        }
    }
}


extension Entrant {
    
    // MARK: - Vendor Extension
    // The following functions are only relevant to Vendor Entrants
    func vendorRegistrationCheck(entrant: Vendor) throws {
        if entrant.firstName == "" {
            throw RegistrationError.missingFirstName
        } else if entrant.lastName == "" {
            throw RegistrationError.missingLastName
        } else if entrant.firstName.count > 16 || entrant.lastName.count > 16 {
            throw RegistrationError.lenghtName
        } else if entrant.birthday == "" {
            throw RegistrationError.missingBirthday
        } else if entrant.visitingDate == "" {
            throw RegistrationError.missingDateOfVisit
        }
    }
    
    func vendorRegistrationComplete(entrant: Vendor) -> Bool {
        do {
            try vendorRegistrationCheck(entrant: entrant)
            print("Registration is complete")
            return true
        } catch RegistrationError.missingFirstName {
            print("Please enter your first name on the registration form")
            return false
        } catch RegistrationError.missingLastName {
            print("Please enter your last name on the registration form")
            return false
        } catch RegistrationError.lenghtName {
            print("First or last name may not exceed 16 characters")
            return false
        } catch RegistrationError.missingBirthday {
            print("Please enter date of birth")
            return false
        } catch RegistrationError.missingDateOfVisit {
            print("Please enter your date of visit")
            return false
        } catch {
            print("Unexpected error: \(error).")
            return false
        }
    }
}


