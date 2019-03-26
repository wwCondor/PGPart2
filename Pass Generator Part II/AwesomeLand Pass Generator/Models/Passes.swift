//
//  Passes.swift
//  AwesomeLand
//
//  Created by Wouter Willebrands on 11/02/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//

import Foundation

// MARK: - Pass Default Settings (Classic)
class Pass {
    let entrant: Entrant
    
    // Vendors and Contract Employees have not Ride access
    var accessAllRides: Bool { return true }
    
    // These vary for each type of Entrant
    // Area Access
    var accessToAmusementAreas: Bool { return true }
    var accessToKitchenAreas: Bool { return false }
    var accessToRideControlAreas: Bool { return false }
    var accessToMainenanceAreas: Bool { return false }
    var accessToOfficeAreas: Bool { return false }
    
    // Skip lines when Entrant is allowed
    var skipLinesForRides: Bool { return false }
    
    // These handle the discounts for various Entrants
    var discountOnFoodPercentage: Int { return 0 }
    var discountOnMerchandisePercentage: Int { return 0 }
    
    // This gives each pass a name corresponding values
    // Used to populate pass name
    var passType: String { return
        TypeOfPass.classic.rawValue
    }
    
    init(entrant: Entrant) {
        self.entrant = entrant
    }
}

// These are the subclasses for the Pass-superclass
// Each has its appropriate accesses and privileges overrridden
// MARK: - Guest Passes
class ClassicGuestPass: Pass {
    // Has no overrides since default is Classic
}


class VIPPass: Pass {
    override var skipLinesForRides: Bool { return true }
    override var discountOnFoodPercentage: Int { return 10 }
    override var discountOnMerchandisePercentage: Int { return 20 }
    override var passType: String { return
        TypeOfPass.vip.rawValue
    }
}

// this is the same as ClassicGuestPass but needs age check
class FreeChildPass: Pass {
    override var passType: String { return
        TypeOfPass.freeChild.rawValue
    }
}

class SeasonPass: Pass {
    override var skipLinesForRides: Bool { return true }
    override var discountOnFoodPercentage: Int { return 10 }
    override var discountOnMerchandisePercentage: Int { return 20 }
    override var passType: String { return
        TypeOfPass.season.rawValue
    }
}

class SeniorGuestPass: Pass {
    override var skipLinesForRides: Bool { return true }
    override var discountOnFoodPercentage: Int { return 10 }
    override var discountOnMerchandisePercentage: Int { return 10 }
    override var passType: String { return
        TypeOfPass.senior.rawValue
    }
}

// MARK: - Employee Passes
class FoodServicesPass: Pass {
    override var accessToKitchenAreas: Bool { return true }
    override var discountOnFoodPercentage: Int { return 15 }
    override var discountOnMerchandisePercentage: Int { return 25 }
    override var passType: String { return
        TypeOfPass.foodService.rawValue
    }
}

class RideServicesPass: Pass {
    override var accessToRideControlAreas: Bool { return true }
    override var discountOnFoodPercentage: Int { return 15 }
    override var discountOnMerchandisePercentage: Int { return 25 }
    override var passType: String { return
        TypeOfPass.rideService.rawValue
    }
}

class MaintenancePass: Pass {
    override var accessToMainenanceAreas: Bool { return true }
    override var discountOnFoodPercentage: Int { return 15 }
    override var discountOnMerchandisePercentage: Int { return 25 }
    override var passType: String { return
        TypeOfPass.maintenance.rawValue
    }
}

class ManagerPass: Pass {
    override var accessToKitchenAreas: Bool { return true }
    override var accessToRideControlAreas: Bool { return true }
    override var accessToMainenanceAreas: Bool { return true }
    override var accessToOfficeAreas: Bool { return true }
    override var discountOnFoodPercentage: Int { return 25 }
    override var discountOnMerchandisePercentage: Int { return 25 }
    override var passType: String { return
        TypeOfPass.manager.rawValue
    }
}

// MARK: -  Contract Employee Passes
class ContractEmployeePass: Pass {
    override var accessAllRides: Bool { return false }
    override var passType: String { return
        TypeOfPass.contract.rawValue
    }
}

// Contract Employee Pass subclasses
class ContractP1001Pass: ContractEmployeePass {
    override var accessToAmusementAreas: Bool { return true }
    override var accessToRideControlAreas: Bool { return true }
    override var accessToKitchenAreas: Bool { return false }
    override var accessToMainenanceAreas: Bool { return false }
    override var accessToOfficeAreas: Bool { return false }
}

class ContractP1002Pass: ContractEmployeePass {
    override var accessToAmusementAreas: Bool { return true }
    override var accessToRideControlAreas: Bool { return true }
    override var accessToKitchenAreas: Bool { return false }
    override var accessToMainenanceAreas: Bool { return true }
    override var accessToOfficeAreas: Bool { return false }
}

class ContractP1003Pass: ContractEmployeePass {
    override var accessToAmusementAreas: Bool { return true }
    override var accessToRideControlAreas: Bool { return true }
    override var accessToKitchenAreas: Bool { return true }
    override var accessToMainenanceAreas: Bool { return true }
    override var accessToOfficeAreas: Bool { return true }
}

class ContractP2001Pass: ContractEmployeePass {
    override var accessToAmusementAreas: Bool { return false }
    override var accessToRideControlAreas: Bool { return false }
    override var accessToKitchenAreas: Bool { return false }
    override var accessToMainenanceAreas: Bool { return false }
    override var accessToOfficeAreas: Bool { return true }
}

class ContractP2002Pass: ContractEmployeePass {
    override var accessToAmusementAreas: Bool { return false }
    override var accessToRideControlAreas: Bool { return false }
    override var accessToKitchenAreas: Bool { return true }
    override var accessToMainenanceAreas: Bool { return true }
    override var accessToOfficeAreas: Bool { return false }
}

// MARK: - Vendor Passes
class VendorPass: Pass {
    override var accessAllRides: Bool { return false }
    override var passType: String { return
        TypeOfPass.vendor.rawValue
    }
}

// Vendor Pass subclasses
class AcmeVendorPass: VendorPass {
    override var accessToAmusementAreas: Bool { return false }
    override var accessToRideControlAreas: Bool { return false }
    override var accessToKitchenAreas: Bool { return true }
    override var accessToMainenanceAreas: Bool { return false }
    override var accessToOfficeAreas: Bool { return false }
}

class OrkinVendorPass: VendorPass {
    override var accessToAmusementAreas: Bool { return true }
    override var accessToRideControlAreas: Bool { return true }
    override var accessToKitchenAreas: Bool { return true }
    override var accessToMainenanceAreas: Bool { return false }
    override var accessToOfficeAreas: Bool { return false }
}

class FedexVendorPass: VendorPass {
    override var accessToAmusementAreas: Bool { return false }
    override var accessToRideControlAreas: Bool { return false }
    override var accessToKitchenAreas: Bool { return false }
    override var accessToMainenanceAreas: Bool { return true }
    override var accessToOfficeAreas: Bool { return true }
}

class NWElectricalVendorPass: VendorPass {
    override var accessToAmusementAreas: Bool { return true }
    override var accessToRideControlAreas: Bool { return true }
    override var accessToKitchenAreas: Bool { return true }
    override var accessToMainenanceAreas: Bool { return true }
    override var accessToOfficeAreas: Bool { return true }
}


