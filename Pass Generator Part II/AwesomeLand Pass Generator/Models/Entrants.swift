//
//  File.swift
//  AwesomeLand
//
//  Created by Wouter Willebrands on 11/02/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//


// These are the different kinds of entrants:
// (with their subclasses)
// Guests
// Employees
// Contract Employees
// Vendors

// Entrant is the superclass
class Entrant {
    var birthday: String?

    init (birthday: String?) {
        self.birthday = birthday
    }
    
    func assignPass(entrant: Entrant) -> Pass? {
        
        switch entrant {
            
        case is Guest:
            guard let guest = entrant as? Guest else { return nil }
            
            switch guest.type {
            case .classic:
                let pass = ClassicGuestPass(entrant: guest)
                return pass
            case .freeChild:
                let childSuccess = childRegistrationComplete()
                if childSuccess == true {
                    let pass = FreeChildPass(entrant: guest)
                    return pass
                } else {
                    print("Submission not errorfree")
                    return nil
                }
            case .vip:
                let pass = VIPPass(entrant: guest)
                return pass
                
            default: break
                
            }
            
        case is SeasonGuest:

            guard let seasonGuest = entrant as? SeasonGuest else { return nil }

            let seasonSuccess = seasonRegistrationComplete(entrant: seasonGuest)
            if seasonSuccess {
                let pass = SeasonPass(entrant: seasonGuest)
                return pass
            } else {
                return nil
            }
            
        case is SeniorGuest:
            
            guard let seniorGuest = entrant as? SeniorGuest else { return nil }
            
            let seniorSuccess = seniorRegistrationComplete(entrant: seniorGuest)
            if seniorSuccess {
                let pass = SeniorGuestPass(entrant: seniorGuest)
                return pass
            } else {
                return nil
            }
            
        case is Employee:
            guard let employee = entrant as? Employee else { return nil }
            
            let success = employeeRegistrationComplete(entrant: employee)
            
            if success {
                switch employee.type {

                case .foodServices:
                    let pass = FoodServicesPass(entrant: employee)
                    return pass
                case .maintenance:
                    let pass = MaintenancePass(entrant: employee)
                    return pass
                case .manager:
                    let pass = ManagerPass(entrant: employee)
                    return pass
                case .rideServices:
                    let pass = RideServicesPass(entrant: employee)
                    return pass
                default: return nil
                }
            } else {
                return nil
            }
        case is ContractEmployee:
            guard let contractee = entrant as? ContractEmployee else {
                return nil
            }
            
            let contractSucces = contractEmployeeRegistrationComplete(entrant: contractee)
            
            if contractSucces {
                switch contractee.projectNumber {
                case .p1001:
                    let pass = ContractP1001Pass(entrant: contractee)
                    return pass
                case .p1002:
                    let pass = ContractP1002Pass(entrant: contractee)
                    return pass
                case .p1003:
                    let pass = ContractP1003Pass(entrant: contractee)
                    return pass
                case .p2001:
                    let pass = ContractP2001Pass(entrant: contractee)
                    return pass
                case .p2002:
                    let pass = ContractP2002Pass(entrant: contractee)
                    return pass
                }
            } else {
                return nil
            }
        case is Vendor:
            guard let vendor = entrant as? Vendor else { return nil }
            
            let success = vendorRegistrationComplete(entrant: vendor)
            
            if success {
                switch vendor.company {
                case .acme:
                    let pass = AcmeVendorPass(entrant: vendor)
                    return pass
                case .orkin:
                    let pass = OrkinVendorPass(entrant: vendor)
                    return pass
                case .fedex:
                    let pass = FedexVendorPass(entrant: vendor)
                    return pass
                case .nwElectrical:
                    let pass = NWElectricalVendorPass(entrant: vendor)
                    return pass
                }
            } else {
                return nil
            }
        default:
            return nil
        }
       return nil
    }
}

class Guest: Entrant { // }, GuestProtocol { // Guest need to conform Guest protocol
    var type: GuestType
    
    init(type: GuestType, birthday: String?) {
        self.type = type
        
        super.init(birthday: birthday)
        
    }
}

// Season and Senior guest are both subclasses of Guest
// Each requires more information input that the other guests
class SeasonGuest: Entrant {
    var firstName: String
    var lastName: String
    var streetAddress: String
    var city: String
    var state: String
    var zipCode: String
    var type: GuestType
    
    init(firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: String, type: GuestType, birthday: String?) {
        self.firstName = firstName
        self.lastName = lastName
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.type = type
        
        super.init(birthday: birthday)
    }
}

class SeniorGuest: Entrant {
    var firstName: String
    var lastName: String
    var type: GuestType
    
    init(firstName: String, lastName: String, type: GuestType, birthday: String?) {
        self.firstName = firstName
        self.lastName = lastName
        self.type = type
        
        super.init(birthday: birthday)
    }
}

// Employees need to fill in the following information
class Employee: Entrant { // }, EmployeeProtocol { // These need to conform Employee protocol
    var type: EmployeeType
    var firstName: String
    var lastName: String
    var streetAddress: String
    var city: String
    var state: String
    var zipCode: String
    var ssn: String
    
    init(type: EmployeeType, firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: String, ssn: String, birthday: String?) {
        
        self.type = type
        self.firstName = firstName
        self.lastName = lastName
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.ssn = ssn
        
        super.init(birthday: birthday)
    }
}

// Contract Empoyees are an Employee subclass
class ContractEmployee: Entrant {
    var type: EmployeeType
    var firstName: String
    var lastName: String
    var streetAddress: String
    var city: String
    var state: String
    var zipCode: String
    var ssn: String
    var projectNumber: Project
    
    init(type: EmployeeType, firstName: String, lastName: String, streetAddress: String, city: String, state: String, zipCode: String, ssn: String, projectNumber: Project, birthday: String?) {
        
        self.type = type
        self.firstName = firstName
        self.lastName = lastName
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipCode = zipCode
        self.ssn = ssn
        self.projectNumber = projectNumber
        
        super.init(birthday: birthday)
    }
}

// Vendor is a subclass for Entrant and conforms VendorProtocol
class Vendor: Entrant { 
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












