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
    
    // This assign a pass to the guest
    // For Classic and VIP guests there are no required checks
    // Child goes through agecheck
// This is done in Entrants Class
//    func assignPassToGuest(entrant: Guest) -> Pass? {
//
//        if entrant.type == .classic {
//            let pass = ClassicGuestPass(entrant: entrant)
//            return pass
//        } else if entrant.type == .vip {
//            let pass = VIPPass(entrant: entrant)
//            return pass
//        } else if entrant.type == .freeChild {
//            let childCheck = entrant.childRegistrationComplete()
//            if childCheck == true {
//                let pass = FreeChildPass(entrant: entrant)
//                return pass
//            }
//        }
//        return nil
//    }
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
//    This is done in Entrant Class
//    static func assignPassToSenior(entrant: SeniorGuest) -> Pass? {
//        let check = entrant.seniorRegistrationComplete(entrant: entrant)
//        if check == true {
//            let pass = SeniorGuestPass(entrant: entrant)
//            return pass
//        }
//        return nil
//    }
//
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
//    This is done in Entrant Class
    
//    static func assignPassToSeasonGuest(entrant: SeasonGuest) -> Pass? {
//        let check = entrant.seasonRegistrationComplete(entrant: entrant)
//        if check == true {
//            let pass = SeasonPass(entrant: entrant)
//            return pass
//        }
//        return nil
//    }
    
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
    
    // This return pass if registration == true
//  This is done in Entrant Class
//    func assignPassToEmployee(entrant: Employee) -> Pass? {
//        let employeeCheck = entrant.employeeRegistrationComplete(entrant: entrant)
//        var pass: Pass?
//
//        if employeeCheck == true {
//            switch entrant.type {
//            case .manager: pass = ManagerPass(entrant: entrant)
//            case .foodServices: pass = FoodServicesPass (entrant: entrant)
//            case .rideServices: pass = RideServicesPass (entrant: entrant)
//            case .maintenance: pass = MaintenancePass (entrant: entrant)
//            default: break
//            }
//        }
//
//        return pass
//    }
//
//    func assignPassToContractEmployee(entrant: ContractEmployee) -> Pass? {
//        let employeeCheck = entrant.employeeRegistrationComplete(entrant: entrant)
//        let contractEmployeeCheck = entrant.contractEmployeeRegistrationComplete(entrant: entrant)
//        var pass: Pass?
//
//        if employeeCheck && contractEmployeeCheck == true {
//            pass = ContractEmployeePass(entrant: entrant)
//        }
//        return pass
//    }
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
//    // This is done in Entrant Class
//    // This also do the standard Employee check?
//    func assignPassToVendor(entrant: Vendor) -> Pass? {
//        let check = entrant.vendorRegistrationComplete(entrant: entrant)
//        var pass: Pass?
//        if check == true {
//            pass = VendorPass(entrant: entrant)
//        }
//        return pass
//    }
}


/*
 extension Entrant {
 
 func checkRequirements() throws -> Bool {
 // check requirements for guest type and throw errors
 switch self {
 case let guest as Guest:
 
 if guest.firstName == "" {
 throw GuestRegistrationErrors.invalidFirstName
 } else if guest.lastName == "" {
 throw GuestRegistrationErrors.invalidLastName
 }
 
 switch guest.type {
 case .freeChild:
 if guest.birthday == "" {
 throw GuestRegistrationErrors.noFreeChildBirthday
 } else if convertDate(birthdayDate: birthday) == nil {
 throw GuestRegistrationErrors.childBirthdayNotConvertibleToDate
 } else if let age = checkAge(birthdayDate: birthday) {
 if age > 5 {
 // birthday was checked for nil so force unwrap is safe
 throw GuestRegistrationErrors.invalidFreeChildBirthday
 }
 }
 case .senior:
 if guest.birthday == "" {
 throw GuestRegistrationErrors.noSeniorBirthday
 } else if convertDate(birthdayDate: birthday) == nil {
 throw GuestRegistrationErrors.seniorBirthdayNotConvertibleToDate
 // error if date cannot be converted
 } else if let age = checkAge(birthdayDate: birthday) {
 if age < 65 {
 // birthday was checked for nil so force unwrap is safe
 throw GuestRegistrationErrors.invalidSeniorBirthday
 // only allow senior if guest is 65+
 }
 }
 case .seasonPass:
 if guest.streetAddress == "" {
 throw GuestRegistrationErrors.invalidSeasonPassAddress
 } else if guest.city == "" {
 throw GuestRegistrationErrors.invalidSeasonPassCity
 } else if guest.state == "" {
 throw GuestRegistrationErrors.invalidSeasonPassState
 } else if guest.zipCode == nil {
 throw GuestRegistrationErrors.invalidSeasonPassZipCode
 }
 default:
 return true
 }
 // check requirements for employee type and throw errors
 case let employee as Employee:
 
 if employee.firstName == "" {
 throw EmployeeRegistrationErrors.invalidFirstName
 } else if employee.lastName == "" {
 throw EmployeeRegistrationErrors.invalidLastName
 }
 
 switch employee.type {
 case .foodService, .rideService, .maintenance, .manager:
 if employee.streetAddress == ""  {
 throw EmployeeRegistrationErrors.invalidAddress
 } else if employee.city == ""  {
 throw EmployeeRegistrationErrors.invalidCity
 } else if employee.state == "" {
 throw EmployeeRegistrationErrors.invalidState
 } else if employee.zipCode == nil {
 throw EmployeeRegistrationErrors.invalidZipCode
 }
 case .contractEmployee:
 if employee.streetAddress == "" {
 throw EmployeeRegistrationErrors.invalidAddress
 } else if employee.city == "" {
 throw EmployeeRegistrationErrors.invalidCity
 } else if employee.state == "" {
 throw EmployeeRegistrationErrors.invalidState
 } else if employee.zipCode == nil {
 throw EmployeeRegistrationErrors.invalidZipCode
 } else if employee.projectNumber == nil {
 throw EmployeeRegistrationErrors.invalidContractProjectNumber
 } else {
 if employee.projectNumber == .firstContract || employee.projectNumber == .secondContract || employee.projectNumber == .thirdContract || employee.projectNumber == .fourthContract || employee.projectNumber == .fifthContract {
 // ok, there is a match
 } else {
 throw EmployeeRegistrationErrors.contractNumberDoesntMatch
 }
 }
 case .vendor:
 if employee.visitDate == "" {
 throw EmployeeRegistrationErrors.invalidVendorVisitDate
 } else if employee.birthday == "" {
 throw EmployeeRegistrationErrors.invalidVendorBirthday
 } else if employee.vendorCompany == nil {
 throw EmployeeRegistrationErrors.invalidVendorCompany
 } else {
 if employee.vendorCompany == .acme || employee.vendorCompany == .fedex || employee.vendorCompany == .nwElectrical || employee.vendorCompany == VendorCompanies.orkin {
 // ok, there is a match
 } else {
 throw EmployeeRegistrationErrors.vendorCompanyNotListed
 }
 }
 }
 default:
 return true
 }
 return true // if switch is completed without throwing errors return true
 }
 
 // run when checking freechild age, converting entered string into date
 func checkAge(birthdayDate: String?) -> Int? {
 let date = Date()
 
 guard let convertedDate = convertDate(birthdayDate: birthdayDate) else { return nil }
 
 // perform math with produced date compared to current date
 guard let difference = Calendar.current.dateComponents([.day], from: convertedDate, to: date).day else {
 print("Calculation failed")
 return nil
 }
 let age = difference / 365
 
 print("Free child is \(age) years old")
 return age
 }
 
 
 // convert string to date
 func convertDate(birthdayDate: String?) -> Date? {
 if let birthday = birthdayDate {
 
 let dateFormatter = DateFormatter()
 dateFormatter.dateFormat = "dd/MM/yyyy"
 let dateFromString = dateFormatter.date(from: birthday)
 
 guard let convertedDate = dateFromString else {
 print("Date not convertable")
 return nil
 }
 return convertedDate
 } else {
 print("No birthday supplied for age check")
 return nil
 }
 }
 
 }
 }
 */

