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
            throw ChildRegistrationError.provideValidDateOfBirth
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let dateStringProvided = dateFormatter.date(from: birthday)
        
        guard let dateConverted = dateStringProvided else {
            throw ChildRegistrationError.dateConversionFailed
        }
        
        guard let age = Calendar.current.dateComponents([.year], from: dateConverted, to: Date()).year else {
            throw ChildRegistrationError.ageCalculationFailed
        }
        
        if age >= 5 {
            throw ChildRegistrationError.ageNotUnderFive
            
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
        } catch ChildRegistrationError.provideValidDateOfBirth {
            print("Please enter valid date of birth")
            return false
        } catch ChildRegistrationError.dateConversionFailed {
            print("Date conversion failed")
            return false
        } catch ChildRegistrationError.ageCalculationFailed {
            print("Age calculation failed")
            return false
        } catch ChildRegistrationError.ageNotUnderFive {
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
            throw SeniorGuestRegistrationErrors.missingFirstName
        } else if entrant.lastName == "" {
            throw SeniorGuestRegistrationErrors.missingLastName
        } else if entrant.birthday == "" {
            throw SeniorGuestRegistrationErrors.missingDateOfBirth
        }
    }
    
    func seniorRegistrationComplete(entrant: SeniorGuest) -> Bool {
        do {
            try seniorRegistrationCheck(entrant: entrant)
            print("Registration is complete")
            return true
        } catch SeniorGuestRegistrationErrors.missingFirstName {
            print("Please enter your first name on the registration form")
            return false
        } catch SeniorGuestRegistrationErrors.missingLastName {
            print("Please enter your last name on the registration form")
            return false
        } catch SeniorGuestRegistrationErrors.missingDateOfBirth {
            print("Please enter your date of birth on the registration form")
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
            throw SeasonGuestRegistrationErrors.missingFirstName
        } else if entrant.lastName == "" {
            throw SeasonGuestRegistrationErrors.missingLastName
        } else if entrant.streetAddress == "" {
            throw SeasonGuestRegistrationErrors.missingStreetAddress
        } else if entrant.city == "" {
            throw SeasonGuestRegistrationErrors.missingCity
        } else if entrant.state == "" {
            throw SeasonGuestRegistrationErrors.missingState
        } else if entrant.zipCode == "" {
            throw SeasonGuestRegistrationErrors.missingZipcode
        }
    }
    
    func seasonRegistrationComplete(entrant: SeasonGuest) -> Bool {
        do {
            try seasonRegistrationCheck(entrant: entrant)
            print("Registration is complete")
            return true
        } catch SeasonGuestRegistrationErrors.missingFirstName {
            print("Please enter your first name on the registration form")
            return false
        } catch SeasonGuestRegistrationErrors.missingLastName {
            print("Please enter your last name on the registration form")
            return false
        } catch SeasonGuestRegistrationErrors.missingStreetAddress {
            print("Please enter your street address on the registration form")
            return false
        } catch SeasonGuestRegistrationErrors.missingCity {
            print("Please enter your city on the registration form")
            return false
        } catch SeasonGuestRegistrationErrors.missingState {
            print("Please enter your state on the registration form")
            return false
        } catch SeasonGuestRegistrationErrors.missingZipcode {
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
            throw EmployeeRegistrationError.missingFirstName
        } else if entrant.lastName == "" {
            throw EmployeeRegistrationError.missingLastName
        } else if entrant.streetAddress == "" {
            throw EmployeeRegistrationError.missingStreetAddress
        } else if entrant.city == "" {
            throw EmployeeRegistrationError.missingCity
        } else if entrant.state == "" {
            throw EmployeeRegistrationError.missingState
        } else if entrant.zipCode == "" {
            throw EmployeeRegistrationError.missingZipcode
        }
    }
    
    // Here thrown errors are caught and returns Bool if registration complete
    func employeeRegistrationComplete(entrant: Employee) -> Bool {
        do {
            try employeeRegistrationCheck(entrant: entrant)
            print("Registration is complete")
            return true
        } catch EmployeeRegistrationError.missingFirstName {
            print("Please enter your first name on the registration form")
            return false
        } catch EmployeeRegistrationError.missingLastName {
            print("Please enter your last name on the registration form")
            return false
        } catch EmployeeRegistrationError.missingStreetAddress {
            print("Please enter your street address on the registration form")
            return false
        } catch EmployeeRegistrationError.missingCity {
            print("Please enter your city on the registration form")
            return false
        } catch EmployeeRegistrationError.missingState {
            print("Please enter your state on the registration form")
            return false
        } catch EmployeeRegistrationError.missingZipcode {
            print("Please enter your zipcode on the registration form")
            return false
        } catch {
            print("Unexpected error: \(error).")
            return false
        }
    }
    
    func contractEmployeeRegistrationCheck(entrant: ContractEmployee) throws {
        if entrant.socialSecurityNumber == "" {
            throw ContractEmployeeRegistrationErrors.missingSocialSecurityNumber
        } else if entrant.birthday == "" {
            throw ContractEmployeeRegistrationErrors.missingDateOfBirth
        }
    }
    
    
    func contractEmployeeRegistrationComplete(entrant: ContractEmployee) -> Bool {
        do {
            try contractEmployeeRegistrationCheck(entrant: entrant)
            print("Registration is complete")
            return true
        } catch ContractEmployeeRegistrationErrors.missingSocialSecurityNumber {
            print("Please enter your social security number on the registration form")
            return false
        } catch ContractEmployeeRegistrationErrors.missingDateOfBirth {
            print("Please enter your date of birth on the registration form")
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
        if entrant.birthday == "" {
            throw VendorRegistrationErrors.missingDateOfBirth
        } else if entrant.visitingDate == "" {
            throw VendorRegistrationErrors.missingDateOfVisit
        }
    }
    
    func vendorRegistrationComplete(entrant: Vendor) -> Bool {
        do {
            try vendorRegistrationCheck(entrant: entrant)
            print("Registration is complete")
            return true
        } catch VendorRegistrationErrors.missingDateOfBirth {
            print("Please enter date of birth")
            return false
        } catch VendorRegistrationErrors.missingDateOfVisit {
            print("Please enter your date of visit")
            return false
        } catch {
            print("Unexpected error: \(error).")
            return false
        }
    }

}


