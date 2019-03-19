//
//  SecondViewController.swift
//  AwesomeLand Pass Generator
//
//  Created by Wouter Willebrands on 01/03/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var visitor: String?
    var passForVisitor: Pass?
    
    // var entrantSelected: Entrant?

    // Button takes you back to first screen
    // Should reset everything
    @IBAction func newEntrant(_ sender: Any) {
        // entrantSelected = nil
        dismiss(animated: true, completion: nil)
    }
    
    // Pass main information labels
    // These should get populated with info entered in previous screen
    @IBOutlet weak var typeOfPassLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    
    @IBOutlet weak var amusementAccessTest: UIButton!
    @IBOutlet weak var skipLinesTest: UIButton!
    @IBOutlet weak var foodDiscountTest: UIButton!
    @IBOutlet weak var merchDiscountTest: UIButton!
    @IBOutlet weak var kitchenAccessTest: UIButton!
    @IBOutlet weak var rideControlAccessTest: UIButton!
    @IBOutlet weak var maintenanceAccessTest: UIButton!
    @IBOutlet weak var officeAccessTest: UIButton!
    
    @IBOutlet weak var testResultView: UIView!
    @IBOutlet weak var testResultLabel: UILabel!
    
    let soundManager = SoundManager()
    
    /*
     AreaAccesPoint.check(pass: classGuestPass, forCheckpoint: .officeArea) // should have access
     AreaAccesPoint.check(pass: classGuestPass, forCheckpoint: .amusementArea) // should not have accedd
     PrivilegeSwipe.swipe(pass: classGuestPass, toCheck: .discountForMerchandise)
     PrivilegeSwipe.swipe(pass: classGuestPass, toCheck: .discountForFood)
     PrivilegeSwipe.swipe(pass: classGuestPass, toCheck: .skipLines)
     }
     */
    
    
    // Permission to enter area is checked here
    // If access granted "testFlag" should turn green
    // If access denied "testFlag" should turn red
    @IBAction func areaAccessTest(_ sender: UIButton) {
        
        // This does the same as the .isSelected setup below
        // This however needs to be exhaustive
        
        switch sender {
            case amusementAccessTest:
                print("Amusement Area")

            case skipLinesTest:
                print("Skip Lines")

            case foodDiscountTest:
                print("Food Discount")

            case merchDiscountTest:
                print("Merchandise Discount")

            case kitchenAccessTest:
                print("Kitchen Area")

            case rideControlAccessTest:
                print("Ride Control Area")

            case maintenanceAccessTest:
                print("Maintenance Area")

            case officeAccessTest:
                print("Office Area")

        default:
            break
        }
           //  AreaAccesPoint.check(pass: Pass, forCheckpoint: .amusementArea)
      
            // let foodDiscountTest = PrivilegeSwipe.foodDiscountTest(pass: Pass, toCheck: .discountForFood)
            
            // if foodDiscountTest == true
           //  PrivilegeSwipe.foodDiscountTest(pass: Pass, toCheck: .discountForFood)
                
            
       
        
        //let amusementAreaCheck = AreaAccesPoint.check(pass: Pass, forCheckpoint: AreaAccesPoint.Area)
        // AreaAccesPoint.check(pass: Pass, forCheckpoint: .amusementArea)
        
        
    
    }
    
    // This flag should change when area access is granted/denied
    @IBOutlet weak var testFlag: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPassContent()

        // Do any additional setup after loading the view.
    }
    
    // Each label of the pass should get filled with entrant's information
    func setupPassContent() {
        
    }

   

}

/*

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
 
*/

