//
//  AreaAndPrivileges.swift
//  AwesomeLand Pass Generator
//
//  Created by Wouter Willebrands on 11/03/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//

import Foundation

// combine these?

// These are the different areas that have area access checkpoints
enum Area {
    case amusementArea
    case kitchenArea
    case rideControlArea
    case mainenanceArea
    case officeArea
}

// These are the various privileges an entrant can have
enum Privilege {
    case skipLines
    case discountForFood
    case discountForMerchandise
}


