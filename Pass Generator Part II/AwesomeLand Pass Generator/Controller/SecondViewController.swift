//
//  SecondViewController.swift
//  AwesomeLand Pass Generator
//
//  Created by Wouter Willebrands on 01/03/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var visitor: Entrant?
    var passForVisitor: Pass?
    
    // var entrantSelected: Entrant?
    
    // Button takes you back to first screen
    // Should reset everything
    @IBAction func newEntrant(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // Pass main information labels
    // These should get populated with info entered in previous screen
    @IBOutlet weak var typeOfPassLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var projectOrCompanyLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    
    // If entrant is a vendor:
    // This is the imageView that holds the Company logo
    // Otherwise set to .white
    @IBOutlet weak var companyLogo: UIImageView!
    @IBOutlet weak var passView: UIView!
    
    // These are the area/privilege test buttons
    @IBOutlet weak var rideAccesTest: UIButton!
    @IBOutlet weak var skipLinesTest: UIButton!
    @IBOutlet weak var foodDiscountTest: UIButton!
    
    @IBOutlet weak var amusementAccessTest: UIButton!
    @IBOutlet weak var officeAccessTest: UIButton!
    @IBOutlet weak var merchDiscountTest: UIButton!
    
    @IBOutlet weak var kitchenAccessTest: UIButton!
    @IBOutlet weak var rideControlAccessTest: UIButton!
    @IBOutlet weak var maintenanceAccessTest: UIButton!
    
    
    @IBOutlet weak var testResultView: UIView! // Is this being used?
    @IBOutlet weak var testResultLabel: UILabel!
    
    let soundManager = SoundManager()
    
    func testSuccess() {
        testFlag.backgroundColor = UIColor.SwipeResultColor.accessGrantedColor
        testFlag.borderColor = UIColor.SwipeResultColor.alteredStateBorderColor
        SoundManager.playAccessGrantedSound()
        
        // This animates color back to original state
        UIView.animate(withDuration: 4.0, delay: 1.0, options: [.curveEaseOut], animations: {
            self.testFlag.backgroundColor = UIColor.SwipeResultColor.normalColor
            self.testFlag.borderColor = UIColor.SwipeResultColor.normalStateBorderColor
        }, completion: nil)
    }
    
    func testFailed() {
        testFlag.backgroundColor = UIColor.SwipeResultColor.accessDeniedColor
        testFlag.borderColor = UIColor.SwipeResultColor.alteredStateBorderColor
        SoundManager.PlayAccessDeniedSound()
        
        // This shakes the label when test fails
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: testFlag.center.x - 5, y: testFlag.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: testFlag.center.x + 5, y: testFlag.center.y))
        testFlag.layer.add(animation, forKey: "position")
        
        // This animates color back to original state
        UIView.animate(withDuration: 4.0, delay: 1.0, options: [.curveEaseOut], animations: {
            self.testFlag.backgroundColor = UIColor.SwipeResultColor.normalColor
            self.testFlag.borderColor = UIColor.SwipeResultColor.normalStateBorderColor
        }, completion: nil)
    }
    
    func resetTestButtonBorderColor() {
        rideAccesTest.borderColor = UIColor.SwipeResultColor.normalColor
        skipLinesTest.borderColor = UIColor.SwipeResultColor.normalColor
        foodDiscountTest.borderColor = UIColor.SwipeResultColor.normalColor
        
        amusementAccessTest.borderColor = UIColor.SwipeResultColor.normalColor
        officeAccessTest.borderColor = UIColor.SwipeResultColor.normalColor
        merchDiscountTest.borderColor = UIColor.SwipeResultColor.normalColor
        
        kitchenAccessTest.borderColor = UIColor.SwipeResultColor.normalColor
        rideControlAccessTest.borderColor = UIColor.SwipeResultColor.normalColor
        maintenanceAccessTest.borderColor = UIColor.SwipeResultColor.normalColor
    }
        
    // Permission for area/privilege is checked here
    // If access granted "testFlag" turns green
    // If access denied "testFlag" turns red
    @IBAction func areaAccessTest(_ sender: UIButton) {
        
        resetTestButtonBorderColor() // This sets border to normal border color
        sender.borderColor = UIColor.BorderColor.buttonSelectedBorderColor // This is selected border color state
        
        // pass needs to be unwrapped before use
        guard let passForVisitor = passForVisitor else { return }
        
        // This is the timer for the gates
        // If timer is != 0 pass has been used recently
        if TimerForGates.seconds != 0 {
            print("This pass has been used recently")
            swipeAlert(description: "This pass has been used recently, please wait 5 seconds before using it again")
        }
        
        // This starts timer when pass is swiped
        TimerForGates.timer.fire()
        
        // This checks for birthday
        if BirthdayCheck.congratulates(pass: passForVisitor) == true {
            // self.passView.backgroundColor = UIColor(patternImage: UIImage(named: "balloons.jpeg")!) // bit to much maybe? 
            birthdayAlert(description: "Congratulations, it is your birthday! Make sure you pick up a free ice cream at the ice cream vendor")
        }

        switch sender {
            
        // These are area/privilege tests
        // Pass is swiped and result is shown
        case rideAccesTest:
            if PrivilegeSwipe.swipe(pass: passForVisitor, toCheck: .rideAccess) == true {
                testSuccess()
                testResultLabel.text = "Wheeeeeee"
                print("Ride Access")
            } else {
                testFailed()
                testResultLabel.text = "You have no ride access"
            }
            
        case skipLinesTest:
            if PrivilegeSwipe.swipe(pass: passForVisitor, toCheck: .skipLines) == true {
                testSuccess()
                testResultLabel.text = "Eligible to skip lines"
                print("Skip Lines")
            } else {
                testFailed()
                testResultLabel.text = "Not allowed to skip lines"
            }
           
        case foodDiscountTest:
            if PrivilegeSwipe.swipe(pass: passForVisitor, toCheck: .discountForFood) == true {
                testSuccess()
                testResultLabel.text = "\(passForVisitor.discountOnFoodPercentage)% discount!"
                print("Food Discount")
            } else {
                testFailed()
                testResultLabel.text = "No Food Discount"
            }
            
        case merchDiscountTest:
            if PrivilegeSwipe.swipe(pass: passForVisitor, toCheck: .discountForMerchandise) == true {
                testSuccess()
                testResultLabel.text = "\(passForVisitor.discountOnMerchandisePercentage)% discount!"
                print("Merchandise Discount")
            } else {
                testFailed()
                testResultLabel.text = "No Merchandise Discount"
            }
            
        case amusementAccessTest:
            if AreaAccesPoint.check(pass: passForVisitor, forCheckpoint: .amusementArea) == true {
                testSuccess()
                testResultLabel.text = "Welcome to the fun!"
                print("Amusement Area")  
            } else {
                testFailed()
                testResultLabel.text = "Access Denied"
            }
            
        case rideControlAccessTest:
            if AreaAccesPoint.check(pass: passForVisitor, forCheckpoint: .rideControlArea) == true {
                testSuccess()
                testResultLabel.text = "Welcome to ride control"
                print("Ride Control Area")
            } else {
                testFailed()
                testResultLabel.text = "Access Denied"
            }
            
        case kitchenAccessTest:
            if AreaAccesPoint.check(pass: passForVisitor, forCheckpoint: .kitchenArea) == true {
                testSuccess()
                testResultLabel.text = "Welcome to the kitchens"
                print("Kitchen Area")
            } else {
                testFailed()
                testResultLabel.text = "Access Denied"
            }
            
        case maintenanceAccessTest:
            if AreaAccesPoint.check(pass: passForVisitor, forCheckpoint: .maintenanceArea) == true {
                testSuccess()
                testResultLabel.text = "Welcome to maintenance"
                print("Maintenance Area")
            } else {
                testFailed()
                testResultLabel.text = "Access Denied"
            }
            
        case officeAccessTest:
            if AreaAccesPoint.check(pass: passForVisitor, forCheckpoint: .officeArea) == true {
                testSuccess()
                testResultLabel.text = "Welcome to maintenance"
                print("Office Area")
            } else {
                testFailed()
                testResultLabel.text = "Access Denied"
            }
    
        default:
            break
        }
    }
    
    // This changes color when area access is granted/denied
    @IBOutlet weak var testFlag: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPassView()
        
        
    }
    
    // Each label of the pass should get filled with entrant's information
    func setupPassView() {
        
        guard let passForVisitor = passForVisitor else {
            dismiss(animated: true, completion: nil)
            return
        }
        
        // Not all need information set for these labels
        // This is standard setting
        nameLabel.text = ""
        projectOrCompanyLabel.text = ""
        dobLabel.text = ""
        companyLogo.image = nil
        
        // Depending on kind of pass, extra info will be displayed
        switch passForVisitor {
        case is ClassicGuestPass:
            guard let visitor = passForVisitor.entrant as? Guest else { return }
            typeOfPassLabel.text = TypeOfPass.classic.rawValue
            dobLabel.text = visitor.birthday
            
        case is VIPPass:
            guard let visitor = passForVisitor.entrant as? Guest else { return }
            typeOfPassLabel.text = TypeOfPass.vip.rawValue
            dobLabel.text = visitor.birthday

        case is FreeChildPass:
            guard let visitor = passForVisitor.entrant as? Guest else { return }
            typeOfPassLabel.text = TypeOfPass.freeChild.rawValue
            dobLabel.text = visitor.birthday

        case is SeniorGuestPass:
            guard let visitor = passForVisitor.entrant as? SeniorGuest else { return }
            typeOfPassLabel.text = TypeOfPass.senior.rawValue
            nameLabel.text = "\(visitor.firstName) \(visitor.lastName)"
            dobLabel.text = visitor.birthday

        case is SeasonPass:
            guard let visitor = passForVisitor.entrant as? SeasonGuest else { return}
            typeOfPassLabel.text = TypeOfPass.season.rawValue
            nameLabel.text = "\(visitor.firstName) \(visitor.lastName)"
            dobLabel.text = visitor.birthday

        case is FoodServicesPass:
            guard let visitor = passForVisitor.entrant as? Employee else { return }
            typeOfPassLabel.text = TypeOfPass.foodService.rawValue
            nameLabel.text = "\(visitor.firstName) \(visitor.lastName)"
            dobLabel.text = visitor.birthday

        case is RideServicesPass:
            guard let visitor = passForVisitor.entrant as? Employee else { return }
            typeOfPassLabel.text = TypeOfPass.rideService.rawValue
            nameLabel.text = "\(visitor.firstName) \(visitor.lastName)"
            dobLabel.text = visitor.birthday

        case is MaintenancePass:
            guard let visitor = passForVisitor.entrant as? Employee else { return }
            typeOfPassLabel.text = TypeOfPass.maintenance.rawValue
            nameLabel.text = "\(visitor.firstName) \(visitor.lastName)"
            dobLabel.text = visitor.birthday

        case is ManagerPass:
            guard let visitor = passForVisitor.entrant as? Employee else { return }
            typeOfPassLabel.text = TypeOfPass.manager.rawValue
            nameLabel.text = "\(visitor.firstName) \(visitor.lastName)"
            dobLabel.text = visitor.birthday

        case is ContractEmployeePass:
            guard let visitor = passForVisitor.entrant as? ContractEmployee else { return }
            typeOfPassLabel.text = TypeOfPass.contract.rawValue
            nameLabel.text = "\(visitor.firstName) \(visitor.lastName)"
            projectOrCompanyLabel.text = visitor.projectNumber.rawValue
            dobLabel.text = visitor.birthday
            
        case is VendorPass:
            guard let visitor = passForVisitor.entrant as? Vendor else { return }
            typeOfPassLabel.text = TypeOfPass.vendor.rawValue
            nameLabel.text = "\(visitor.firstName) \(visitor.lastName)"
            projectOrCompanyLabel.text = visitor.company.rawValue
            companyLogo.image = visitor.company.logo
            dobLabel.text = visitor.birthday
            
        default:
            break
            
        }
    }
    
}


