//
//  ParkEntrance.swift
//  AwesomeLand
//
//  Created by Wouter Willebrands on 13/02/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//
import UIKit
import Foundation

// At the park entrance/ticket office all Entrants go through a registration procedure
// There are two three different registration/entry points to the park to speed up registration process:
// - Guests
// - Employees
// - Vendor

// MARK: - Guest Extension
// The following functions are only relevant to guest entrants
extension Entrant {
    
    func isEligibleForFreeEntry() throws -> Bool {
//      let errorShown = ViewController.errorAlert(description: LocalizedError)
//
        // This checks whether there is a birthday
        guard let birthday = birthday else {
            throw RegistrationError.missingBirthday
        }
        // If provided birthday needs to be converted
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let dateStringProvided = dateFormatter.date(from: birthday)
        // If date can be converted we can continuue
        guard let dateConverted = dateStringProvided else {
            throw RegistrationError.dateConversionFailed
        }
        // If we have a convertable date we can calculate age
        guard let age = Calendar.current.dateComponents([.year], from: dateConverted, to: Date()).year else {
            throw RegistrationError.ageCalculationFailed
        }
        // This checks if age is under 5
        if age >= 5 {
            throw RegistrationError.ageNotUnderFive
            
        } else if age < 5 {
            return true
        }
        return false
    }
        
    // Child registration errors are caught here
    // errors are caught here
    func childRegistrationComplete() -> Bool {
    // func childRegistrationComplete(acceptsViewController ViewController: UIViewController) -> Bool {
    // I tried to active alert message from within this extension to the VC
        do {
            if try isEligibleForFreeEntry() {
                print("Child is eligible for free entrance")
                return true
            }
        } catch RegistrationError.missingBirthday {
            print("Please provide a birthday")
            return false
        } catch RegistrationError.dateConversionFailed {
            print("Date conversion failed")
            return false
        } catch RegistrationError.ageCalculationFailed {
            print("Age calculation failed")
            return false
        } catch RegistrationError.ageNotUnderFive {
        // present(using: ViewController, errorDescription: RegistrationError.ageNotUnderFive.localizedDescription, animated: true)
        // From attempt described above
            print("Age not under five")
            return false
        } catch {
            print("Unexpected error: \(error).")
            return false
        }
        return false
    }



    func seniorRegistrationCheck(entrant: SeniorGuest) throws {
        if entrant.firstName == "" {
            throw RegistrationError.missingFirstName
        }  else if entrant.lastName == "" {
            throw RegistrationError.missingLastName
        } else if entrant.birthday == "" {
            throw RegistrationError.missingBirthday
        } else if entrant.birthday != "" {
            // do someething that checks if input provided is a date
            if let date = entrant.birthday {
                
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "dd-MM-yyyy"
                let dateStringProvided = dateFormatter.date(from: date)
                
                guard let convertedDate = dateStringProvided else {
                    print("Date not convertable")
                    throw RegistrationError.dateConversionFailed
                }
                    
                guard let age = Calendar.current.dateComponents([.year], from: convertedDate, to: Date()).year else {
                    throw RegistrationError.ageCalculationFailed
                }
                
                if age < 65 {
                    throw RegistrationError.ageNotOverSixtyFive
                }
            }
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
        } catch RegistrationError.missingBirthday {
            print("Please provide a birthday")
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



    func seasonRegistrationCheck(entrant: SeasonGuest) throws {
        if entrant.firstName == "" {
            throw RegistrationError.missingFirstName
        } else if entrant.lastName == "" {
            throw RegistrationError.missingLastName
        } else if entrant.birthday == "" {
            throw RegistrationError.missingBirthday
        } else if entrant.birthday?.count != 10 {
            // do someething that checks if input provided is date
            throw RegistrationError.dateConversionFailed
        } else if entrant.streetAddress == "" {
            throw RegistrationError.missingStreetAddress
        } else if entrant.city == "" {
            throw RegistrationError.missingCity
        } else if entrant.state == "" {
            throw RegistrationError.missingState
        } else if entrant.zipCode == "" {
            throw RegistrationError.missingZipcode
        } else if entrant.zipCode.count != 6 {
            throw RegistrationError.zipcodeLength
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
        } catch RegistrationError.missingBirthday {
            print("Please provide a birthday")
            return false
        } catch RegistrationError.ageCalculationFailed {
            print("Please enter valid date of birth")
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
        } catch RegistrationError.zipcodeLength {
            print("Please enter your zipCode on the registration form")
            return false
        } catch {
            print("Unexpected error: \(error).")
            return false
        }
    }
 



// MARK: - Employee Extension
// The following functions are only relevant to Employee entrants

    
    // This functions throws errors when information is missing
    func employeeRegistrationCheck(entrant: Employee) throws {
        if entrant.firstName == "" {
            throw RegistrationError.missingFirstName
        } else if entrant.lastName == "" {
            throw RegistrationError.missingLastName
        } else if entrant.birthday == "" {
            throw RegistrationError.missingBirthday
        } else if entrant.birthday?.count != 10 {
            // do someething that checks if input provided is date
            throw RegistrationError.dateConversionFailed
        } else if entrant.streetAddress == "" {
            throw RegistrationError.missingStreetAddress
        } else if entrant.city == "" {
            throw RegistrationError.missingCity
        } else if entrant.state == "" {
            throw RegistrationError.missingState
        } else if entrant.zipCode == "" {
            throw RegistrationError.missingZipcode
        } else if entrant.zipCode.count != 6 {
            throw RegistrationError.zipcodeLength
        } else if entrant.ssn == "" {
            throw RegistrationError.missingSocialSecurityNumber
        } else if entrant.ssn.count != 9 {
            throw RegistrationError.ssnLettersOrLenght
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
        } catch RegistrationError.missingBirthday {
            print("Please provide a birthday")
            return false
        } catch RegistrationError.ageCalculationFailed {
            print("Please provide valid date of birth")
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
        } catch RegistrationError.ssnLettersOrLenght {
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
        } else if entrant.birthday == "" {
            throw RegistrationError.missingBirthday
        } else if entrant.birthday?.count != 10 {
            // do someething that checks if input provided is date
            throw RegistrationError.dateConversionFailed
        } else if entrant.streetAddress == "" {
            throw RegistrationError.missingStreetAddress
        } else if entrant.city == "" {
            throw RegistrationError.missingCity
        } else if entrant.state == "" {
            throw RegistrationError.missingState
        } else if entrant.zipCode == "" {
            throw RegistrationError.missingZipcode
        } else if entrant.zipCode.count != 6 {
            throw RegistrationError.zipcodeLength
        } else if entrant.ssn == "" {
            throw RegistrationError.missingSocialSecurityNumber
        } else if entrant.ssn.count != 9 {
            throw RegistrationError.ssnLettersOrLenght
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
        } catch RegistrationError.missingBirthday {
            print("Please provide a birthday")
            return false
        } catch RegistrationError.ageCalculationFailed {
            print("Please provide valid date of birth")
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
        } catch RegistrationError.ssnLettersOrLenght {
            print("Please enter your social security number on the registration form")
            return false
        } catch {
            print("Unexpected error: \(error).")
            return false
        }
    }

    
    // MARK: - Vendor Extension
    // The following functions are only relevant to Vendor Entrants
    func vendorRegistrationCheck(entrant: Vendor) throws {
        if entrant.firstName == "" {
            throw RegistrationError.missingFirstName
        } else if entrant.lastName == "" {
            throw RegistrationError.missingLastName
        } else if entrant.birthday == "" {
            throw RegistrationError.missingBirthday
        } else if entrant.visitingDate == "" {
            throw RegistrationError.missingDateOfVisit
        } else if entrant.birthday != "" {
            // do someething that checks if input provided is date
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
        } catch RegistrationError.ageCalculationFailed {
            print("Please provide valid date of birth")
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
