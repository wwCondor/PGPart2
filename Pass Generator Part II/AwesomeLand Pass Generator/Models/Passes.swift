//
//  Passes.swift
//  AwesomeLand
//
//  Created by Wouter Willebrands on 11/02/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//

import Foundation


// Create class with a Pass template
// for each property at (default)
// override default settings for different guests

// Everyone:
// - has access to Amusement Areas
// - can access All Ride

// Handle areas:
// - Kitchen Areas (false)
// - Ride Control Areas (false)
// - Maintenance Areas (false)
// - Office Areas (false)

// Handle access:
// - Skip all ride lines (false)

// Handle Discount Access:
// - for Food
// - for Merchandise


// MARK: - Pass Default Settings (Classic)
class Pass {
    let entrant: Entrant
    
    // These are shared privileges by all Entrants
    var accessToAmusementAreas: Bool { return true }
    var accessAllRides: Bool { return true }
    
    // These vary for each type of Entrant
    // Area Access
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
    var passType: String { return
        TypeOfPass.classic.rawValue
    }
    
    init(entrant: Entrant) {
        self.entrant = entrant
    }
}




// These are the subclasses for the Pass-superclass
// Each has its appropriate accesses and privileges overrridden
// Might not need ClassicGuestPass, since it is default
// MARK: - Overrides for each pass
class ClassicGuestPass: Pass {
    
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

// MARK: - Unit 5 passes
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

class ContractEmployeePass: Pass {
    override var accessAllRides: Bool { return false }
    // These need to be fixed for different Project Numbers
    // Probably with switch
    
    /*
    override var accessToAmusementAreas: Bool { return true }
    override var accessToRideControlAreas: Bool { return false }
    override var accessToKitchenAreas: Bool { return false }
    override var accessToMainenanceAreas: Bool { return false }
    override var accessToOfficeAreas: Bool { return false }
    */
    
    override var passType: String { return
        TypeOfPass.contract.rawValue
    }
}


class VendorPass: Pass {
    // override var accessAllRides: Bool { return false }
    
    // These need to be fixed for different Project Numbers
    // Prbably with switch
    
    override var passType: String { return
        TypeOfPass.vendor.rawValue
    }
}



