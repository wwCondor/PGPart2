//
//  GateSwipes.swift
//  AwesomeLand
//
//  Created by Wouter Willebrands on 12/02/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//

import Foundation


// If today is entrants' birthday this congratulates entrant when pass is swiped
class BirthdayCheck {
    
    static func congratulation(pass: Pass) {
        let date = Date()
        let thisMonth = Calendar.current.component(.month, from: date)
        let today = Calendar.current.component(.day, from: date)
        
        guard let birthday = pass.entrant.birthday else {
            return
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let dateStringPrivided = dateFormatter.date(from: birthday)
        
        guard let dateConverted = dateStringPrivided else {
            return
        }
        
        let entrantBirthdayMonth = Calendar.current.component(.month, from: dateConverted)
        let entrantBirthdayDay = Calendar.current.component(.day, from: dateConverted)
        
        if entrantBirthdayMonth == thisMonth && entrantBirthdayDay == today {
            print("Happy birthday!")
        }
        
    }
    
}

// Here the generated passes are swiped for each area or privilege

struct AreaAccesPoint {
    
  static func additionalAreaAccess(area: Area, company: Company, project: Project) -> Bool {
        
        switch area {
        case .amusementArea: if company == .orkin || company == .nwElectrical || project == .p1001  || project == .p1002 || project == .p1003 {
            return true
            }
        case .rideControlArea: if company == .orkin || company == .nwElectrical || project == .p1001 || project == .p1002 || project == .p1003 {
            return true
            }
        case .kitchenArea: if company == .acme || company == .orkin || company == .nwElectrical || project == .p1003 || project == .p2002 {
            return true
            }
        case .mainenanceArea: if company == .fedex || company == .nwElectrical || project == .p1002 || project == .p1003 || project == .p2002 {
            return true
            }
        case .officeArea: if company == .fedex || company == .nwElectrical || project == .p1003 || project == .p2001 {
            return true
            }
        }
        return false
    }
    
 
    static func check(pass: Pass, forCheckpoint: Area) -> Bool {
        
        // This checks if today is entrants' birthday
        BirthdayCheck.congratulation(pass: pass)

        // This is the timer for the gates
        // If timer is != 0 pass has been used recently
        guard TimerForGates.seconds == 0 else {
            print("This pass has been used recently")
            return false
        }
        
        // This starts timer when pass is swiped
        TimerForGates.timer.fire()
        
        switch forCheckpoint {
        case .amusementArea: if pass.accessToAmusementAreas {
            print("Welcome to AwesomeLand amusement area")
            SoundManager.playAccessGrantedSound()
            return true
            }
        case .kitchenArea: if pass.accessToKitchenAreas {
            print("Welcome to the kitchen area. Smells good!")
            SoundManager.playAccessGrantedSound()
            return true
            }
        case.rideControlArea: if pass.accessToRideControlAreas {
            print("Welcome to the ride control area")
            SoundManager.playAccessGrantedSound()
            return true
            }
        case.mainenanceArea: if pass.accessToMainenanceAreas {
            print("Welcome to the maintenance area")
            SoundManager.playAccessGrantedSound()
            return true
            }
        case.officeArea: if pass.accessToOfficeAreas {
            print("Welcome to the office area")
            SoundManager.playAccessGrantedSound()
            return true
            }
        }
        
        print("You have no access to this area.")
        SoundManager.PlayAccessDeniedSound()
        return false
    }
}


struct PrivilegeSwipe {
    
    static func swipe(pass: Pass, toCheck: Privilege) -> Bool {
        
        // This checks if today is entrants' birthday
        BirthdayCheck.congratulation(pass: pass)
        
        // This is the timer for the gates
        // If timer is != 0 pass has been used recently
        guard TimerForGates.seconds == 0 else {
            print("This pass has been used recently")
            return false
        }
        
        // This starts timer when pass is swiped
        TimerForGates.timer.fire()
        
        switch toCheck {
        case .skipLines: if pass.skipLinesForRides {
            print("You can skip the line")
            SoundManager.playAccessGrantedSound()
            return true
        } else {
            print("You are not allowed to skip the line")
            return false
            }
        case .discountForFood: if pass.discountOnFoodPercentage != 0 {
            print("You get \(pass.discountOnFoodPercentage) percent discount on food")
            SoundManager.playAccessGrantedSound()
            return true
        } else {
            print("You are not eligible for food discount")
            return false
            }
        case .discountForMerchandise: if pass.discountOnMerchandisePercentage != 0 {
            print("You get \(pass.discountOnMerchandisePercentage) percent discount on merchandise")
            SoundManager.playAccessGrantedSound()
            return true
        } else {
            print("You are not eligible for merchandise discount")
            SoundManager.PlayAccessDeniedSound()
            return false
            }
        }
    }
}


