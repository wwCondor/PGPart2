//
//  GateSwipes.swift
//  AwesomeLand
//
//  Created by Wouter Willebrands on 12/02/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//

import Foundation


// If today is entrants' birthday this congratulates entrant when pass is swiped
struct BirthdayCheck {
    
    static func congratulates(pass: Pass) -> Bool {
        let currentMonth = Calendar.current.component(.month, from: Date())
        let today = Calendar.current.component(.day, from: Date())
        
        guard let birthday = pass.entrant.birthday else {
            return false
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let dateStringPrivided = dateFormatter.date(from: birthday)
        
        guard let dateConverted = dateStringPrivided else {
            return false
        }
        
        let entrantBirthmonth = Calendar.current.component(.month, from: dateConverted)
        let entrantBirthday = Calendar.current.component(.day, from: dateConverted)
        
        if entrantBirthmonth == currentMonth && entrantBirthday == today {
            print("Happy birthday!")
            return true
        }
        return false
    }
}

// This checks if visitor has access to certain areas
struct AreaAccesPoint {

    static func check(pass: Pass, forCheckpoint: Area) -> Bool {
        
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
        case .rideControlArea: if pass.accessToRideControlAreas {
            print("Welcome to the ride control area")
            SoundManager.playAccessGrantedSound()
            return true
            }
        case .maintenanceArea: if pass.accessToMainenanceAreas {
            print("Welcome to the maintenance area")
            SoundManager.playAccessGrantedSound()
            return true
            }
        case .officeArea: if pass.accessToOfficeAreas {
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

// This checks whether or not a visitor has certain privileges
struct PrivilegeSwipe {
    
    static func swipe(pass: Pass, toCheck: Privilege) -> Bool {
        
        switch toCheck {
        case .rideAccess: if pass.accessAllRides {
            print("Wheeeeeeee")
            SoundManager.playAccessGrantedSound()
            return true
            }
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
        return false
    }
}



