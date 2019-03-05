//
//  ViewController.swift
//  AwesomeLand Pass Generator
//
//  Created by Wouter Willebrands on 19/02/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBAction func createPassButton(_ sender: Any) {
        performSegue(withIdentifier: "PassSegue", sender: self)
        
        
    }
    
    // MARK: - Hide/Show Buttons
    func showGuestMenu() {
        manager.isHidden = true
        foodServices.isHidden = true
        rideServices.isHidden = true
        maintenance.isHidden = true
        contract.isHidden = true
        classic.isHidden = false
        vip.isHidden = false
        freeChild.isHidden = false
        senior.isHidden = false
        season.isHidden = false
    }
    
    func showEmployeeMenu() {
        manager.isHidden = false
        foodServices.isHidden = false
        rideServices.isHidden = false
        maintenance.isHidden = false
        contract.isHidden = false
        classic.isHidden = true
        vip.isHidden = true
        freeChild.isHidden = true
        senior.isHidden = true
        season.isHidden = true
    }

    func showVendorMenu() {
        manager.isHidden = true
        foodServices.isHidden = true
        rideServices.isHidden = true
        maintenance.isHidden = true
        contract.isHidden = true
        classic.isHidden = true
        vip.isHidden = true
        freeChild.isHidden = true
        senior.isHidden = true
        season.isHidden = true
        showVendorFields()
    }
    
    func hideAllLabelsAndTextFields() {
        
        // Hides submenu buttons
        manager.isHidden = true
        foodServices.isHidden = true
        rideServices.isHidden = true
        maintenance.isHidden = true
        contract.isHidden = true
        classic.isHidden = true
        vip.isHidden = true
        freeChild.isHidden = true
        senior.isHidden = true
        season.isHidden = true
        
        // Hides Labels and Textfields
        firstName.isHidden = true
        firstNameTF.isHidden = true
        lastName.isHidden = true
        lastNameTF.isHidden = true
        dateOfBirth.isHidden = true
        dateOfBirthTF.isHidden = true
        streetAddress.isHidden = true
        streetAddressTF.isHidden = true
        city.isHidden = true
        cityTF.isHidden = true
        state.isHidden = true
        stateTF.isHidden = true
        zipCode.isHidden = true
        zipCodeTF.isHidden = true
        ssn.isHidden = true
        ssnTF.isHidden = true
        company.isHidden = true
        companyTF.isHidden = true
        dateOfVisit.isHidden = true
        dateOfVisitTF.isHidden = true
        projectNumber.isHidden = true
        projectNumberTF.isHidden = true
        shiftManager.isHidden = true
        generalManager.isHidden = true
        seniorManager.isHidden = true
        
        // Hides Manager Submenu buttons
        // hideManagerSubMenu()
    }
    
    func showSocialSecurityNumber() {
        ssn.isHidden = false
        ssnTF.isHidden = false
    }
    
    func showDateOfBirthFields() {
        dateOfBirth.isHidden = false
        dateOfBirthTF.isHidden = false
    }
    
    func showStreetAddressStateZipFields() {
        streetAddress.isHidden = false
        streetAddressTF.isHidden = false
        city.isHidden = false
        cityTF.isHidden = false
        state.isHidden = false
        stateTF.isHidden = false
        zipCode.isHidden = false
        zipCodeTF.isHidden = false
    }
    
    func showFirstAndLastNameFields() {
        firstName.isHidden = false
        firstNameTF.isHidden = false
        lastName.isHidden = false
        lastNameTF.isHidden = false
    }
    
    func showContractFields() {
        showDateOfBirthFields()
        company.isHidden = false
        companyTF.isHidden = false
        projectNumber.isHidden = false
        projectNumberTF.isHidden = false
    }
    
    func showVendorFields() {
        showFirstAndLastNameFields()
        showDateOfBirthFields()
        company.isHidden = false
        companyTF.isHidden = false
        dateOfVisit.isHidden = false
        dateOfVisitTF.isHidden = false
    }
    
    // These are the different Employee options
    @IBOutlet weak var manager: UIButton!
    @IBOutlet weak var foodServices: UIButton!
    @IBOutlet weak var rideServices: UIButton!
    @IBOutlet weak var maintenance: UIButton!
    @IBOutlet weak var contract: UIButton!
    
    func showManagerSubmenu() {
        shiftManager.isHidden = false
        generalManager.isHidden = false
        seniorManager.isHidden = false
    }
    
    func hideManagerSubMenu() {
        shiftManager.isHidden = true
        generalManager.isHidden = true
        seniorManager.isHidden = true
    }
    
    // These are the different guest options
    @IBOutlet weak var classic: UIButton!
    @IBOutlet weak var vip: UIButton!
    @IBOutlet weak var freeChild: UIButton!
    @IBOutlet weak var season: UIButton!
    @IBOutlet weak var senior: UIButton!
    
    
    // These are the primary Entrant options: Guest, Employee and Vendor
    // Each should disable submenu
    // Or hides/shows those absolete
    @IBAction func guestButton(_ sender: UIButton) {
        hideAllLabelsAndTextFields()
        showGuestMenu()
    }
    
    @IBAction func employeeButton(_ sender: UIButton) {
        hideAllLabelsAndTextFields()
        showEmployeeMenu()
    }
    
    @IBAction func vendorButton(_ sender: UIButton) {
        hideAllLabelsAndTextFields()
        showVendorMenu()
        var passOfEntrant = VendorPass.self
    }
    
    // MARK: - Guest Submenu
    // These are the guest submenu option
    @IBAction func classicButton(_ sender: UIButton) {
        hideAllLabelsAndTextFields()
        showFirstAndLastNameFields()
        showGuestMenu()
        var passOfEntrant = ClassicGuestPass.self
    }
    
    @IBAction func vipButton(_ sender: UIButton) {
        hideAllLabelsAndTextFields()
        showFirstAndLastNameFields()
        showGuestMenu()
        var passOfEntrant = VIPPass.self
        
    }
    @IBAction func freeChildButon(_ sender: UIButton) {
        hideAllLabelsAndTextFields()
        showFirstAndLastNameFields()
        showDateOfBirthFields()
        showGuestMenu()
        var passOfEntrant = FreeChildPass.self
    }
    @IBAction func seasonButton(_ sender: UIButton) {
        hideAllLabelsAndTextFields()
        showFirstAndLastNameFields()
        showStreetAddressStateZipFields()
        showGuestMenu()
        var passOfEntrant = SeasonPass.self
    }
    @IBAction func seniorButton(_ sender: UIButton) {
        hideAllLabelsAndTextFields()
        showFirstAndLastNameFields()
        showDateOfBirthFields()
        showGuestMenu()
        var passOfEntrant = SeniorGuestPass.self
    }
    
    // MARK: - Employee Submenu
    // These are the subcatagores for the primary Entrants
    // Employee: Food, Ride, Maintenance and Contract

    @IBAction func managerButton(_ sender: UIButton) {
        hideAllLabelsAndTextFields()
        showFirstAndLastNameFields()
        showStreetAddressStateZipFields()
        showDateOfBirthFields()
        showSocialSecurityNumber()
        showManagerSubmenu()
        showEmployeeMenu()
        var passOfEntrant = ManagerPass.self
    }
    
    @IBAction func foodServiceButton(_ sender: UIButton) {
        hideAllLabelsAndTextFields()
        showFirstAndLastNameFields()
        showStreetAddressStateZipFields()
        showSocialSecurityNumber()
        showEmployeeMenu()
        var passOfEntrant = FoodServicesPass.self
        
    }
    
    @IBAction func rideServiceButon(_ sender: UIButton) {
        hideAllLabelsAndTextFields()
        showFirstAndLastNameFields()
        showStreetAddressStateZipFields()
        showSocialSecurityNumber()
        showEmployeeMenu()
        var passOfEntrant = RideServicesPass.self

    }
    
    @IBAction func maintenanceButton(_ sender: UIButton) {
        hideAllLabelsAndTextFields()
        showFirstAndLastNameFields()
        showStreetAddressStateZipFields()
        showSocialSecurityNumber()
        showEmployeeMenu()
        var passOfEntrant = MaintenancePass.self

    }
    
    @IBAction func contractButton(_ sender: UIButton) {
        hideAllLabelsAndTextFields()
        showFirstAndLastNameFields()
        showStreetAddressStateZipFields()
        showSocialSecurityNumber()
        showContractFields()
        showEmployeeMenu()
        var passOfEntrant = ContractEmployeePass.self

    }
    
    
    
    // These are the manager submenu buttons
    @IBOutlet weak var shiftManager: UIButton!
    @IBOutlet weak var generalManager: UIButton!
    @IBOutlet weak var seniorManager: UIButton!
    
    
    // These are all the labels for the input textfields
    // Set hidden/show for each
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var dateOfBirth: UILabel!
    @IBOutlet weak var ssn: UILabel!
    @IBOutlet weak var streetAddress: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var state: UILabel!
    @IBOutlet weak var zipCode: UILabel!
    @IBOutlet weak var company: UILabel!
    @IBOutlet weak var dateOfVisit: UILabel!
    @IBOutlet weak var projectNumber: UILabel!
    
    // These are all the textfields
    // Set hidden/show for each
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var dateOfBirthTF: UITextField!
    @IBOutlet weak var streetAddressTF: UITextField!
    @IBOutlet weak var cityTF: UITextField!
    @IBOutlet weak var stateTF: UITextField!
    @IBOutlet weak var zipCodeTF: UITextField!
    @IBOutlet weak var ssnTF: UITextField!
    @IBOutlet weak var companyTF: UITextField!
    @IBOutlet weak var dateOfVisitTF: UITextField!
    @IBOutlet weak var projectNumberTF: UITextField!
    
    // These are all the input fields
    // Need to perform checks
    // Might be able to combine several
    @IBAction func firstName(_ sender: UITextField) {
        // Needs to check if contains no numbers
        var firstNameOfEntrant = firstName.text
    }
    @IBAction func lastName(_ sender: UITextField) {
        // Needs to check if contains no numbers
        var lastNameOfEntrant = lastName.text
    }
    @IBAction func dateOfBirth(_ sender: UITextField) {
        // Needs to check of format is correct (DD-MM-YYYY)
        var dateOfBirthOfEntrant = dateOfBirth.text
    }
    @IBAction func streetAddress(_ sender: UITextField) {
        var streetAddressOfEntrant = streetAddress.text
    }
    @IBAction func city(_ sender: UITextField) {
        var cityOfEntrant = city.text
    }
    @IBAction func state(_ sender: UITextField) {
        var stateOfEntrant = state.text
    }
    @IBAction func zipCode(_ sender: UITextField) {
        // Needs to check of length is correct
        var zipCodeOfEntrant = zipCode.text
    }
    @IBAction func ssn(_ sender: UITextField) {
        // Needs to check of lenght is correct
        var ssnOfEntrant = ssn.text
    }
    @IBAction func company(_ sender: UITextField) {
        // Needs to check if either of the four companies provided
        var companyOfEntrant = company.text
    }
    @IBAction func dateOfVisit(_ sender: UITextField) {
        // Needs to check if format is correct (DD-MM-YYYY)
        // Same function as dateOfBirth: Rename "checkDateFormat"
        var dataOfVisitOfEntrant = dateOfVisit.text
    }
    @IBAction func projectNumber(_ sender: UITextField) {
        // Needs to check if either of the five projects
        var projectNumberOfEntrant = projectNumber
    }
    /*
    var passOfEntrant: Pass
    var firstNameOfEntrant: String = ""
    var lastNameOfEntrant: String = ""
    var dateOfBirthOfEntrant: String = ""
    var streetAddressOfEntrant: String = ""
    var cityOfEntrant: String = ""
    var stateOfEntrant: String = ""
    var zipCodeOfEntrant: String = ""
    var ssnOfEntrant: String = ""
    var companyOfEntrant: String = ""
    var dataOfVisitOfEntrant: String = ""
    var projectNumberOfEntrant: String = ""
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // hideManagerSubMenu()
        // showVendorMenu()
        hideAllLabelsAndTextFields()
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        // Do any additional setup after loading the view, typically from a nib.
        
        // These are testcases
        // Remove /**/ to before running program
        
        
         // Classic Guest
        
        /*
         let guestClassic = Guest(type: .classic, birthday: "01-03-1984")
         let classGuestPass = guestClassic.assignPassToGuest(entrant: guestClassic)
         if let classGuestPass = classGuestPass {
         AreaAccesPoint.check(pass: classGuestPass, forCheckpoint: .officeArea) // should have access
         AreaAccesPoint.check(pass: classGuestPass, forCheckpoint: .amusementArea) // should not have accedd
         PrivilegeSwipe.swipe(pass: classGuestPass, toCheck: .discountForMerchandise)
         PrivilegeSwipe.swipe(pass: classGuestPass, toCheck: .discountForFood)
         PrivilegeSwipe.swipe(pass: classGuestPass, toCheck: .skipLines)
         }
        */
        
        /*
         // VIP Guest
         let guestVIP = Guest(type: .vip, birthday: nil)
         let testVIPPass = guestVIP.assignPassToGuest(entrant: guestVIP)
         if let testVIPPass = testVIPPass {
         AreaAccesPoint.check(pass: testVIPPass, forCheckpoint: .officeArea) // should have access
         AreaAccesPoint.check(pass: testVIPPass, forCheckpoint: .amusementArea) // should not have accedd
         PrivilegeSwipe.swipe(pass: testVIPPass, toCheck: .discountForMerchandise)
         PrivilegeSwipe.swipe(pass: testVIPPass, toCheck: .discountForFood)
         PrivilegeSwipe.swipe(pass: testVIPPass, toCheck: .skipLines)
         }
         */
        
         /*
         // Child with birthday under 5
         let guestFreeChildDate =    Guest(type: .freeChild, birthday: "01-05-2018")
         let testFreeChildPass = guestFreeChildDate.assignPassToGuest(entrant: guestFreeChildDate)
         if let testFreeChildPass = testFreeChildPass {
         AreaAccesPoint.check(pass: testFreeChildPass, forCheckpoint: .officeArea) // should have access
         AreaAccesPoint.check(pass: testFreeChildPass, forCheckpoint: .amusementArea) // should not have accedd
         PrivilegeSwipe.swipe(pass: testFreeChildPass, toCheck: .discountForMerchandise)
         PrivilegeSwipe.swipe(pass: testFreeChildPass, toCheck: .discountForFood)
         PrivilegeSwipe.swipe(pass: testFreeChildPass, toCheck: .skipLines)
         }
        */
        
        /*
         // Child with missing birthday
         let guestFreeChildDate2 =    Guest(type: .freeChild, birthday: nil)
         let testFreeChildPass2 = guestFreeChildDate2.assignPassToGuest(entrant: guestFreeChildDate2)
         if let testFreeChildPass2 = testFreeChildPass2 {
         AreaAccesPoint.check(pass: testFreeChildPass2, forCheckpoint: .officeArea) // should have access
         AreaAccesPoint.check(pass: testFreeChildPass2, forCheckpoint: .amusementArea) // should not have accedd
         PrivilegeSwipe.swipe(pass: testFreeChildPass2, toCheck: .discountForMerchandise)
         PrivilegeSwipe.swipe(pass: testFreeChildPass2, toCheck: .discountForFood)
         PrivilegeSwipe.swipe(pass: testFreeChildPass2, toCheck: .skipLines)
         }
        */
        
        /*
         // 'Child' with birthday over 5
         let guestFreeChildDate3 = Guest(type: .freeChild, birthday: "18-05-1982") // Testcase with age above 5 years
         let testFreeChildPass3 = guestFreeChildDate3.assignPassToGuest(entrant: guestFreeChildDate3)
         if let testFreeChildPass3 = testFreeChildPass3 {
         AreaAccesPoint.check(pass: testFreeChildPass3, forCheckpoint: .amusementArea)
         PrivilegeSwipe.swipe(pass: testFreeChildPass3, toCheck: .discountForMerchandise)
         PrivilegeSwipe.swipe(pass: testFreeChildPass3, toCheck: .discountForFood)
         PrivilegeSwipe.swipe(pass: testFreeChildPass3, toCheck: .skipLines)
         }
         */
        
        /*
         // Food Service Employee
         let testEmployeeFoodServices =  Employee(type: .foodServices, firstName: "Naked", lastName: "Chef", streetAddress: "Spoonstreet 99", city: "Restauranttown", state: "Pizzastate", zipCode: "ChefZip")
         
         // Food Service Employee with missing info
         // let testEmployeeFoodServices =  Employee(type: .foodServices, firstName: "Dressed", lastName: "Chef", streetAddress: "", city: "Restauranttown", state: "Pizzastate", zipCode: "ChefZip") // missing info
         let testFoodServicesPass = testEmployeeFoodServices.assignPassToEmployee(entrant: testEmployeeFoodServices)
         if let testFoodServicePass = testFoodServicesPass {
         AreaAccesPoint.check(pass: testFoodServicePass, forCheckpoint: .officeArea) // should not have access
         AreaAccesPoint.check(pass: testFoodServicePass, forCheckpoint: .kitchenArea) // should have access
         PrivilegeSwipe.swipe(pass: testFoodServicePass, toCheck: .discountForMerchandise)
         PrivilegeSwipe.swipe(pass: testFoodServicePass, toCheck: .discountForFood)
         PrivilegeSwipe.swipe(pass: testFoodServicePass, toCheck: .skipLines)
         }
         */
        
        /*
         // Ride Service Employee
         let testEmployeeRideServices =  Employee(type: .rideServices, firstName: "Ernie", lastName: "Bertfriend", streetAddress: "Sesamestreet 1", city: "Sesametown", state: "Sesamestate", zipCode: "SesameZip")
         
         // Ride Service Employee with missing ingfo
         // let testEmployeeRideServices =  Employee(type: .rideServices, firstName: "Bert", lastName: "Erniefriend", streetAddress: "Sesamestreet 1", city: "Sesametown", state: "Sesamestate", zipCode: "") // missing info
         let testRideServicePass = testEmployeeRideServices.assignPassToEmployee(entrant: testEmployeeRideServices)
         if let testRideServicePass = testRideServicePass {
         AreaAccesPoint.check(pass: testRideServicePass, forCheckpoint: .officeArea) // should not have access
         AreaAccesPoint.check(pass: testRideServicePass, forCheckpoint: .rideControlArea) // should have control
         PrivilegeSwipe.swipe(pass: testRideServicePass, toCheck: .discountForMerchandise)
         PrivilegeSwipe.swipe(pass: testRideServicePass, toCheck: .discountForFood)
         PrivilegeSwipe.swipe(pass: testRideServicePass, toCheck: .skipLines)
         }
         */
        
         /*
         // Maintenance Employee
         let testEmployeeMaintenance =   Employee(type: .maintenance, firstName: "Bob", lastName: "Builder", streetAddress: "Builderstreet 101", city: "SimCity", state: "Finished", zipCode: "BuilderZip")
         
         // Maintence Employee missing info
         // let testEmployeeMaintenance =   Employee(type: .maintenance, firstName: "", lastName: "Builder", streetAddress: "Builderstreet 101", city: "SimCity", state: "Finished", zipCode: "BuilderZip") // missing info
         let testMaintenancePass = testEmployeeMaintenance.assignPassToEmployee(entrant: testEmployeeMaintenance)
         if let testMaintenancePass = testMaintenancePass {
         AreaAccesPoint.check(pass: testMaintenancePass, forCheckpoint: .mainenanceArea)
         AreaAccesPoint.check(pass: testMaintenancePass, forCheckpoint: .officeArea) // should not have access
         PrivilegeSwipe.swipe(pass: testMaintenancePass, toCheck: .discountForFood)
         PrivilegeSwipe.swipe(pass: testMaintenancePass, toCheck: .discountForMerchandise)
         PrivilegeSwipe.swipe(pass: testMaintenancePass, toCheck: .skipLines)
         }
         */
        
        /*
        // Manager info complete
        let testManager = Employee(type: .manager, firstName: "Bowser", lastName: "daBoss", streetAddress: "Princessstreet 1337", city: "Yoshitown", state: "Marioland", zipCode: "BossZip")
        
        // Manager missing info
        // let testManager = Employee(type: .manager, firstName: "Bowser", lastName: "daBoss", streetAddress: "Bosslane 1337", city: "Bossville", state: "", zipCode: "BossZip") // missing info
        let testManagerPass = testManager.assignPassToEmployee(entrant: testManager)
        if let testManagerPass = testManagerPass {
            AreaAccesPoint.check(pass: testManagerPass, forCheckpoint: .kitchenArea) // should have access
            AreaAccesPoint.check(pass: testManagerPass, forCheckpoint: .officeArea) // should have access
            PrivilegeSwipe.swipe(pass: testManagerPass, toCheck: .discountForMerchandise)
            PrivilegeSwipe.swipe(pass: testManagerPass, toCheck: .discountForFood)
            PrivilegeSwipe.swipe(pass: testManagerPass, toCheck: .skipLines) // should not be allowed to skip lines
         }
        */
            
        
    }
    
    @objc func keyboardWillShow(_ notfication: Notification) {
       // if let info = notfication.userInfo, let keyboardFrame = info [UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            // let frame = keyboardFrame.cgRectValue
            // textFieldBottomConstraint.constant = frame.size.height + 10
            
            UIView.animate(withDuration: 0.8) {
                self.view.layoutIfNeeded()
            }
        // }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        // textFieldBottomConstraintt.constant = 40
        
        UIView.animate(withDuration: 0.8) {
            self.view.layoutIfNeeded()
        }
    }
    
}





