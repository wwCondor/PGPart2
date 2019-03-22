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
        // entrantSelected = nil
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
    
    @IBOutlet weak var amusementAccessTest: UIButton!
    @IBOutlet weak var skipLinesTest: UIButton!
    @IBOutlet weak var foodDiscountTest: UIButton!
    @IBOutlet weak var merchDiscountTest: UIButton!
    @IBOutlet weak var kitchenAccessTest: UIButton!
    @IBOutlet weak var rideControlAccessTest: UIButton!
    @IBOutlet weak var maintenanceAccessTest: UIButton!
    @IBOutlet weak var officeAccessTest: UIButton!
    
    @IBOutlet weak var testResultView: UIView! // Is this being used?
    @IBOutlet weak var testResultLabel: UILabel!
    
    let soundManager = SoundManager()
    
    func testSuccess() {
        testFlag.backgroundColor = UIColor.SwipeResultColor.accessGrantedColor
        SoundManager.playAccessGrantedSound()
    }
    
    func testFailed() {
        testFlag.backgroundColor = UIColor.SwipeResultColor.accessDeniedColor
        SoundManager.PlayAccessDeniedSound()
    }
    
    // Permission to enter area is checked here
    // If access granted "testFlag" should turn green
    // If access denied "testFlag" should turn red
    @IBAction func areaAccessTest(_ sender: UIButton) {
        
        guard let passForVisitor = passForVisitor else { return }
        
        switch sender {
            
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
            
        case kitchenAccessTest:
            if AreaAccesPoint.check(pass: passForVisitor, forCheckpoint: .kitchenArea) == true {
                testSuccess()
                testResultLabel.text = "Welcome to the kitchens"
                print("Kitchen Area")
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
        
        // Depending on kind of pass, some extra info will be displayed on pass
        // "guard let pass" probably not neccessary here
        switch passForVisitor {
        case is ClassicGuestPass:
//            guard let pass = passForVisitor as? ClassicGuestPass else { return }
            guard let entrant = visitor as? ContractEmployee else { return }
            typeOfPassLabel.text = TypeOfPass.classic.rawValue
            dobLabel.text = entrant.birthday
            
        case is VIPPass:
//            guard let pass = passForVisitor as? VIPPass else { return }
            guard let entrant = visitor as? ContractEmployee else { return }
            typeOfPassLabel.text = TypeOfPass.vip.rawValue
            dobLabel.text = entrant.birthday


        case is FreeChildPass:
//            guard let pass = passForVisitor as? FreeChildPass else { return }
            guard let entrant = visitor as? ContractEmployee else { return }
            typeOfPassLabel.text = TypeOfPass.freeChild.rawValue
            dobLabel.text = entrant.birthday

        case is SeniorGuestPass:
//            guard let pass = passForVisitor as? SeniorGuestPass else { return }
            guard let entrant = visitor as? ContractEmployee else { return }
            typeOfPassLabel.text = TypeOfPass.senior.rawValue
            nameLabel.text = "\(entrant.firstName) \(entrant.lastName)"
            dobLabel.text = entrant.birthday

        case is SeasonPass:
//            guard let pass = passForVisitor as? SeasonPass else { return }
            guard let entrant = visitor as? ContractEmployee else { return }
            typeOfPassLabel.text = TypeOfPass.season.rawValue
            nameLabel.text = "\(entrant.firstName) \(entrant.lastName)"
            dobLabel.text = entrant.birthday

        case is FoodServicesPass:
//            guard let pass = passForVisitor as? FoodServicesPass else { return }
            guard let entrant = visitor as? ContractEmployee else { return }
            typeOfPassLabel.text = TypeOfPass.foodService.rawValue
            nameLabel.text = "\(entrant.firstName) \(entrant.lastName)"
            dobLabel.text = entrant.birthday

        case is RideServicesPass:
//            guard let pass = passForVisitor as? RideServicesPass else { return }
            guard let entrant = visitor as? ContractEmployee else { return }
            typeOfPassLabel.text = TypeOfPass.rideService.rawValue
            nameLabel.text = "\(entrant.firstName) \(entrant.lastName)"
            dobLabel.text = entrant.birthday

        case is MaintenancePass:
//            guard let pass = passForVisitor as? MaintenancePass else { return }
            guard let entrant = visitor as? ContractEmployee else { return }
            typeOfPassLabel.text = TypeOfPass.maintenance.rawValue
            nameLabel.text = "\(entrant.firstName) \(entrant.lastName)"
            dobLabel.text = entrant.birthday

        case is ManagerPass:
//            guard let pass = passForVisitor as? ManagerPass else { return }
            guard let entrant = visitor as? ContractEmployee else { return }
            typeOfPassLabel.text = TypeOfPass.manager.rawValue
            nameLabel.text = "\(entrant.firstName) \(entrant.lastName)"
            dobLabel.text = entrant.birthday

        case is ContractEmployeePass:
//            guard let pass = passForVisitor as? ContractEmployeePass else { return }
            guard let entrant = visitor as? ContractEmployee else { return }
            typeOfPassLabel.text = TypeOfPass.contract.rawValue
            nameLabel.text = "\(entrant.firstName) \(entrant.lastName)"
            dobLabel.text = entrant.birthday

            // Depending on which prroject, label needs to change
            let project = entrant.projectNumber
            switch project {
            case .p1001: projectOrCompanyLabel.text = project.rawValue
            case .p1002: projectOrCompanyLabel.text = project.rawValue
            case .p1003: projectOrCompanyLabel.text = project.rawValue
            case .p2001: projectOrCompanyLabel.text = project.rawValue
            case .p2002: projectOrCompanyLabel.text = project.rawValue
            }
            
            //case .p2002: projectOrCompanyLabel.text = "\(Project.p2002.rawValue)"
            
        case is VendorPass:
//            guard let pass = passForVisitor as? VendorPass else { return }
            guard let entrant = visitor as? Vendor else { return }
            
            typeOfPassLabel.text = "\(TypeOfPass.vendor.rawValue)"
            nameLabel.text = "\(entrant.firstName) \(entrant.lastName)"

            // Depending which company, label and logo need to change
            let company = entrant.company
            switch company {
            case .acme:
                projectOrCompanyLabel.text = company.rawValue
                companyLogo.image = UIImage(imageLiteralResourceName: "AcmeLogo")
            case .orkin:
                projectOrCompanyLabel.text = company.rawValue
                companyLogo.image = UIImage(imageLiteralResourceName: "OrkinLogo")
            case .fedex:
                projectOrCompanyLabel.text = company.rawValue
                companyLogo.image = UIImage(imageLiteralResourceName: "FedExLogo")
            case .nwElectrical:
                projectOrCompanyLabel.text = company.rawValue
                companyLogo.image = UIImage(imageLiteralResourceName: "NWELogo")
            }
            // projectOrCompanyLabel.text = "\(Company.orkin.rawValue)"
            
        default:
            break
            
        }
    }
    
}


