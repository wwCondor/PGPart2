//
//  GuestEntrance.swift
//  AwesomeLand Pass Generator
//
//  Created by Wouter Willebrands on 19/03/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//

import Foundation

struct GuestEntrance {
    
    static func createPass(entrant: Entrant) -> Pass? {
        
        switch entrant{
        case is Guest:
            guard let guest = entrant as? Guest else { return nil }
            
            switch guest.type {
            case .classic:
                let pass = ClassicGuestPass(entrant: guest)
                return pass
            case .freeChild:
                let eligibleCheck =
                let pass = FreeChildPass(entrant: guest)
                return pass
            case .vip:
                let pass = VIPPass(entrant: guest)
                return pass
            case .season:
                let pass = SeasonPass(entrant: guest)
                return pass
            case .senior:
                let pass = SeniorGuestPass(entrant: guest)
                return pass
            }
        default:
            return nil
        }
    }
    
    func isEligibleForFreeEntry() throws -> Bool {
        let entrant = entrant
        guard let birthday = Guest.birthday else {
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
}
/*
extension Guest {
    
    // This checks:
    // - If there is a birthday entered
    // - If date can be converted
    // - If age can be calculated from birthday
    // - If age is under five
    
    
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
    func assignPassToGuest(entrant: Guest) -> Pass? {
        
        if entrant.type == .classic {
            let pass = ClassicGuestPass(entrant: entrant)
            return pass
        } else if entrant.type == .vip {
            let pass = VIPPass(entrant: entrant)
            return pass
        } else if entrant.type == .freeChild {
            let childCheck = childRegistrationComplete()
            if childCheck == true {
                let pass = FreeChildPass(entrant: entrant)
                return pass
            }
        }
        return nil
    }
}

extension SeniorGuest {
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
    
    func assignPassToSenior(entrant: SeniorGuest) -> Pass? {
        let check = entrant.seniorRegistrationComplete(entrant: entrant)
        if check == true {
            let pass = SeniorGuestPass(entrant: entrant)
            return pass
        }
        return nil
    }
    
}

extension SeasonGuest {
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
    
    func assignPassToSeasonGuest(entrant: SeasonGuest) -> Pass? {
        let check = entrant.seasonRegistrationComplete(entrant: entrant)
        if check == true {
            let pass = SeasonPass(entrant: entrant)
            return pass
        }
        return nil
    }
    
}


extension Entrant {
    func checkRequirements() throws -> Bool {
        
        switch self {
        case let guest as Guest:
            if guest.birthday == "" {
                throw RegistrationError.missingBirthday
                
                switch guest.type {
                case .freeChild:
                    if guest.birthday == "" {
                        throw RegistrationError.missingBirthday
                    } else if {
                        let ageCheck = try isEligibleForFreeEntry() {
                            
                        }
                    }
                }
            }
            
        }
        
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
*/
