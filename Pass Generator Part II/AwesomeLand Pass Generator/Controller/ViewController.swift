//
//  ViewController.swift
//  AwesomeLand Pass Generator
//
//  Created by Wouter Willebrands on 19/02/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    

    // These are all the textfields
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var dateOfBirthTF: UITextField!
    @IBOutlet weak var streetAddressTF: UITextField!
    @IBOutlet weak var cityTF: UITextField!
    @IBOutlet weak var stateTF: UITextField!
    @IBOutlet weak var zipCodeTF: UITextField!
    @IBOutlet weak var ssnTF: UITextField!
    @IBOutlet weak var dateOfVisitTF: UITextField!
    
    // These are all the labels for the input textfields
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var dateOfBirth: UILabel!
    @IBOutlet weak var ssn: UILabel!
    @IBOutlet weak var streetAddress: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var state: UILabel!
    @IBOutlet weak var zipCode: UILabel!
    @IBOutlet weak var dateOfVisit: UILabel!
    
    // This View contains all the information input fields
    @IBOutlet weak var informationView: UIView!
    
    // Optionals
    var pass: Pass?
    var entrant: Entrant?
    
    // MARK: - Menu Selection Buttons
    // This is the main menu for Entrants
    @IBOutlet weak var guestButton: UIButton!
    @IBOutlet weak var employeeButton: UIButton!
    @IBOutlet weak var contractButton: UIButton!
    @IBOutlet weak var vendorButton: UIButton!
    
    // This is the employee submenu
    @IBOutlet weak var managerButton: UIButton!
    @IBOutlet weak var foodServicesButton: UIButton!
    @IBOutlet weak var rideServicesButton: UIButton!
    @IBOutlet weak var maintenanceButton: UIButton!
    
    // This is the guest submenu
    @IBOutlet weak var classicButton: UIButton!
    @IBOutlet weak var vipButton: UIButton!
    @IBOutlet weak var freeChildButton: UIButton!
    @IBOutlet weak var seasonButton: UIButton!
    @IBOutlet weak var seniorButton: UIButton!
    
    // This is the contractor submenu
    @IBOutlet weak var project1001Button: UIButton!
    @IBOutlet weak var project1002Button: UIButton!
    @IBOutlet weak var project1003Button: UIButton!
    @IBOutlet weak var project2001Button: UIButton!
    @IBOutlet weak var project2002Button: UIButton!
    
    // This is the vendor submenu
    @IBOutlet weak var acmeButton: UIButton!
    @IBOutlet weak var orkinButton: UIButton!
    @IBOutlet weak var fedexButton: UIButton!
    @IBOutlet weak var nwElectricalButton: UIButton!
    
    // These are the views that hold the submenu stacks
    @IBOutlet weak var employeeView: UIView!
    @IBOutlet weak var employeeStack: UIStackView!
    
    @IBOutlet weak var guestView: UIView!
    @IBOutlet weak var guestStack: UIStackView!
    
    @IBOutlet weak var vendorView: UIView!
    @IBOutlet weak var vendorStack: UIStackView!
    
    @IBOutlet weak var projectView: UIView!
    @IBOutlet weak var projectStack: UIStackView!
    
    @IBOutlet weak var createPassOrPopulate: UIButton!
    
    
    @IBOutlet weak var streetCityStateZipStack: UIStackView!
    
    
    @IBAction func createPassButtonTapped(_ sender: Any) {
        
        guard let firstName = firstNameTF.text else { return }
        guard let lastName = lastNameTF.text else { return }
        guard let birthday = dateOfBirthTF.text else { return }
        
        guard let street = streetAddressTF.text else { return }
        guard let city = cityTF.text else { return }
        guard let state = stateTF.text else { return }
        guard let zipCode = zipCodeTF.text else { return }
        
        guard let ssn = ssnTF.text else { return }
        guard let dateOfVisit = dateOfVisitTF.text else { return }
        
        // Depending on which buttons have been selected these are the initializers
        // These are the guestButton inits
        if guestButton.isSelected {
            if classicButton.isSelected {
                let type = GuestType.classic
                entrant = Guest(type: type, birthday: birthday)
            } else if vipButton.isSelected {
                let type = GuestType.vip
                entrant = Guest(type: type, birthday: birthday)
            } else if freeChildButton.isSelected {
                let type = GuestType.freeChild
                entrant = Guest(type: type, birthday: birthday)
            } else if seasonButton.isSelected {
                let type = GuestType.season
                entrant = SeasonGuest(firstName: firstName, lastName: lastName, streetAddress: street, city: city, state: state, zipCode: zipCode, type: type, birthday: birthday)
            } else if seniorButton.isSelected {
                let type = GuestType.senior
                entrant = SeniorGuest(firstName: firstName, lastName: lastName, type: type, birthday: birthday)
            }
        
        // These are the employeeButton inits
        } else if employeeButton.isSelected {
            if managerButton.isSelected {
                let type = EmployeeType.manager
                entrant = Employee(type: type, firstName: firstName, lastName: lastName, streetAddress: street, city: city, state: state, zipCode: zipCode, ssn: ssn, birthday: birthday)
            } else if foodServicesButton.isSelected {
                let type = EmployeeType.foodServices
                entrant = Employee(type: type, firstName: firstName, lastName: lastName, streetAddress: street, city: city, state: state, zipCode: zipCode, ssn: ssn, birthday: birthday)
            } else if rideServicesButton.isSelected {
                let type = EmployeeType.rideServices
                entrant = Employee(type: type, firstName: firstName, lastName: lastName, streetAddress: street, city: city, state: state, zipCode: zipCode, ssn: ssn, birthday: birthday)
            } else if maintenanceButton.isSelected {
                let type = EmployeeType.maintenance
                entrant = Employee(type: type, firstName: firstName, lastName: lastName, streetAddress: street, city: city, state: state, zipCode: zipCode, ssn: ssn, birthday: birthday)
            }
         
        // These are the contractButton inits
        } else if contractButton.isSelected {
            if project1001Button.isSelected {
                let type = EmployeeType.contract
                let project = Project.p1001
                entrant = ContractEmployee(projectNumber: project, type: type, firstName: firstName, lastName: lastName, streetAddress: street, city: city, state: state, zipCode: zipCode, ssn: ssn, birthday: birthday)
            } else if project1002Button.isSelected {
                let type = EmployeeType.contract
                let project = Project.p1002
                entrant = ContractEmployee(projectNumber: project, type: type, firstName: firstName, lastName: lastName, streetAddress: street, city: city, state: state, zipCode: zipCode, ssn: ssn, birthday: birthday)
            } else if project1003Button.isSelected {
                let type = EmployeeType.contract
                let project = Project.p1003
                entrant = ContractEmployee(projectNumber: project, type: type, firstName: firstName, lastName: lastName, streetAddress: street, city: city, state: state, zipCode: zipCode, ssn: ssn, birthday: birthday)
            } else if project2001Button.isSelected {
                let type = EmployeeType.contract
                let project = Project.p2001
                entrant = ContractEmployee(projectNumber: project, type: type, firstName: firstName, lastName: lastName, streetAddress: street, city: city, state: state, zipCode: zipCode, ssn: ssn, birthday: birthday)
            } else if project2002Button.isSelected {
                let type = EmployeeType.contract
                let project = Project.p2002
                entrant = ContractEmployee(projectNumber: project, type: type, firstName: firstName, lastName: lastName, streetAddress: street, city: city, state: state, zipCode: zipCode, ssn: ssn, birthday: birthday)
            }
        
        // These are the vendorButton inits
        } else if vendorButton.isSelected {
            if acmeButton.isSelected {
                let type = Company.acme
                entrant = Vendor(company: type, firstName: firstName, lastName: lastName, visitingDate: dateOfVisit, birthday: birthday)
            } else  if orkinButton.isSelected {
                let type = Company.orkin
                entrant = Vendor(company: type, firstName: firstName, lastName: lastName, visitingDate: dateOfVisit, birthday: birthday)
            } else  if fedexButton.isSelected {
                let type = Company.fedex
                entrant = Vendor(company: type, firstName: firstName, lastName: lastName, visitingDate: dateOfVisit, birthday: birthday)
            } else  if nwElectricalButton.isSelected {
                let type = Company.nwElectrical
                entrant = Vendor(company: type, firstName: firstName, lastName: lastName, visitingDate: dateOfVisit, birthday: birthday)
            }
            
        }
//        let childSucces = entrant?.childRegistrationComplete()
//        let seasonSucces = entrant?.seasonRegistrationComplete(entrant: entrant) as? SeasonGuest
        // If entrant has been created, a pass can be created as well.
        // MARK: - SEGUE
        // if entrant = entrant && if either of the registrations is complete sgue may perform
        // Add registration complete condition
        if let entrant = entrant {
//            let succesChild = entrant.childRegistrationComplete()
//            let eployeeSucces = entrant.employeeRegistrationComplete(entrant: entrant) ||
//                entrant.seasonRegistrationComplete(entrant: entrant)  ||
//                entrant.seniorRegistrationComplete(entrant: entrant)  ||
//                entrant.vendorRegistrationComplete(entrant: entrant) == true
//            {
            pass = entrant.assignPass(entrant: entrant)
            performSegue(withIdentifier: "PassSegue", sender: self)
//            }
        }
    }
    
    // This provides a mockup visitor when Populate Button is pressed
    @IBAction func populateFields(_ sender: UIButton) {
        
        if guestButton.isSelected {
            if classicButton.isSelected {
                let mockupVisitor = MockupGuest.mockupClassic
                dateOfBirthTF.text = mockupVisitor.birthday
            } else if vipButton.isSelected {
                let mockupVisitor = MockupGuest.mockupVip
                dateOfBirthTF.text = mockupVisitor.birthday
            } else if freeChildButton.isSelected {
                let mockupVisitor = MockupGuest.mockupFreeChild
                dateOfBirthTF.text = mockupVisitor.birthday
            } else if seasonButton.isSelected {
                let mockupVisitor = MockupGuest.mockupSeason
                firstNameTF.text = mockupVisitor.firstName
                lastNameTF.text = mockupVisitor.lastName
                streetAddressTF.text = mockupVisitor.streetAddress
                cityTF.text = mockupVisitor.city
                stateTF.text = mockupVisitor.state
                zipCodeTF.text = mockupVisitor.zipCode
                dateOfBirthTF.text = mockupVisitor.birthday
            } else if seniorButton.isSelected {
                let mockupVisitor = MockupGuest.mockupSenior
                firstNameTF.text = mockupVisitor.firstName
                lastNameTF.text = mockupVisitor.lastName
                dateOfBirthTF.text = mockupVisitor.birthday
            }
            
        } else if employeeButton.isSelected {
            if managerButton.isSelected {
                let mockupVisitor = MockupGuest.mockupManager
                firstNameTF.text = mockupVisitor.firstName
                lastNameTF.text = mockupVisitor.lastName
                streetAddressTF.text = mockupVisitor.streetAddress
                cityTF.text = mockupVisitor.city
                stateTF.text = mockupVisitor.state
                zipCodeTF.text = mockupVisitor.zipCode
                dateOfBirthTF.text = mockupVisitor.birthday
                ssnTF.text = mockupVisitor.ssn
            } else if foodServicesButton.isSelected {
                let mockupVisitor = MockupGuest.mockupFoodService
                firstNameTF.text = mockupVisitor.firstName
                lastNameTF.text = mockupVisitor.lastName
                streetAddressTF.text = mockupVisitor.streetAddress
                cityTF.text = mockupVisitor.city
                stateTF.text = mockupVisitor.state
                zipCodeTF.text = mockupVisitor.zipCode
                dateOfBirthTF.text = mockupVisitor.birthday
                ssnTF.text = mockupVisitor.ssn
            } else if rideServicesButton.isSelected {
                let mockupVisitor = MockupGuest.mockupRideService
                firstNameTF.text = mockupVisitor.firstName
                lastNameTF.text = mockupVisitor.lastName
                streetAddressTF.text = mockupVisitor.streetAddress
                cityTF.text = mockupVisitor.city
                stateTF.text = mockupVisitor.state
                zipCodeTF.text = mockupVisitor.zipCode
                dateOfBirthTF.text = mockupVisitor.birthday
                ssnTF.text = mockupVisitor.ssn
            } else if maintenanceButton.isSelected {
                let mockupVisitor = MockupGuest.mockupMaintenance
                firstNameTF.text = mockupVisitor.firstName
                lastNameTF.text = mockupVisitor.lastName
                streetAddressTF.text = mockupVisitor.streetAddress
                cityTF.text = mockupVisitor.city
                stateTF.text = mockupVisitor.state
                zipCodeTF.text = mockupVisitor.zipCode
                dateOfBirthTF.text = mockupVisitor.birthday
                ssnTF.text = mockupVisitor.ssn
            }
            
        } else if contractButton.isSelected {
            if project1001Button.isSelected {
                let mockupVisitor = MockupGuest.mockupContractP1001
                firstNameTF.text = mockupVisitor.firstName
                lastNameTF.text = mockupVisitor.lastName
                streetAddressTF.text = mockupVisitor.streetAddress
                cityTF.text = mockupVisitor.city
                stateTF.text = mockupVisitor.state
                zipCodeTF.text = mockupVisitor.zipCode
                dateOfBirthTF.text = mockupVisitor.birthday
                ssnTF.text = mockupVisitor.ssn
            } else if project1002Button.isSelected {
                let mockupVisitor = MockupGuest.mockupContractP1002
                firstNameTF.text = mockupVisitor.firstName
                lastNameTF.text = mockupVisitor.lastName
                streetAddressTF.text = mockupVisitor.streetAddress
                cityTF.text = mockupVisitor.city
                stateTF.text = mockupVisitor.state
                zipCodeTF.text = mockupVisitor.zipCode
                dateOfBirthTF.text = mockupVisitor.birthday
                ssnTF.text = mockupVisitor.ssn
            } else if project1003Button.isSelected {
                let mockupVisitor = MockupGuest.mockupContractP1003
                firstNameTF.text = mockupVisitor.firstName
                lastNameTF.text = mockupVisitor.lastName
                streetAddressTF.text = mockupVisitor.streetAddress
                cityTF.text = mockupVisitor.city
                stateTF.text = mockupVisitor.state
                zipCodeTF.text = mockupVisitor.zipCode
                dateOfBirthTF.text = mockupVisitor.birthday
                ssnTF.text = mockupVisitor.ssn
            } else if project2001Button.isSelected {
                let mockupVisitor = MockupGuest.mockupContractP2001
                firstNameTF.text = mockupVisitor.firstName
                lastNameTF.text = mockupVisitor.lastName
                streetAddressTF.text = mockupVisitor.streetAddress
                cityTF.text = mockupVisitor.city
                stateTF.text = mockupVisitor.state
                zipCodeTF.text = mockupVisitor.zipCode
                dateOfBirthTF.text = mockupVisitor.birthday
                ssnTF.text = mockupVisitor.ssn
            } else if project2002Button.isSelected {
                let mockupVisitor = MockupGuest.mockupContractP2002
                firstNameTF.text = mockupVisitor.firstName
                lastNameTF.text = mockupVisitor.lastName
                streetAddressTF.text = mockupVisitor.streetAddress
                cityTF.text = mockupVisitor.city
                stateTF.text = mockupVisitor.state
                zipCodeTF.text = mockupVisitor.zipCode
                dateOfBirthTF.text = mockupVisitor.birthday
                ssnTF.text = mockupVisitor.ssn
            }
            
        } else if vendorButton.isSelected {
            if acmeButton.isSelected {
                let mockupVisitor = MockupGuest.mockupAcmeVendor
                firstNameTF.text = mockupVisitor.firstName
                lastNameTF.text = mockupVisitor.lastName
                dateOfBirthTF.text = mockupVisitor.birthday
                dateOfVisitTF.text = mockupVisitor.visitingDate
            } else  if orkinButton.isSelected {
                let mockupVisitor = MockupGuest.mockupOrkinVendor
                firstNameTF.text = mockupVisitor.firstName
                lastNameTF.text = mockupVisitor.lastName
                dateOfBirthTF.text = mockupVisitor.birthday
                dateOfVisitTF.text = mockupVisitor.visitingDate
            } else  if fedexButton.isSelected {
                let mockupVisitor = MockupGuest.mockupFedexVendor
                firstNameTF.text = mockupVisitor.firstName
                lastNameTF.text = mockupVisitor.lastName
                dateOfBirthTF.text = mockupVisitor.birthday
                dateOfVisitTF.text = mockupVisitor.visitingDate
            } else  if nwElectricalButton.isSelected {
                let mockupVisitor = MockupGuest.mockupNWElectricalVendor
                firstNameTF.text = mockupVisitor.firstName
                lastNameTF.text = mockupVisitor.lastName
                dateOfBirthTF.text = mockupVisitor.birthday
                dateOfVisitTF.text = mockupVisitor.visitingDate
            }
        } else {
            print("To generate data you need to select an entrant and type")
        }
        
    }
    
    func hideSubMenus() {
        guestStack.isHidden = true
        employeeStack.isHidden = true
        vendorStack.isHidden = true
        projectStack.isHidden = true
        guestView.isHidden = true
        employeeView.isHidden = true
        vendorView.isHidden = true
        projectView.isHidden = true
    }
    
    // MARK: - Hide/Show Buttons
    // These are the main entrant submenus
    func showGuestMenu() {
        guestView.isHidden = false
        employeeView.isHidden = true
        vendorView.isHidden = true
        projectView.isHidden = true
        
        guestStack.isHidden = false
        employeeStack.isHidden = true
        vendorStack.isHidden = true
        projectStack.isHidden = true

    }
    
    func showEmployeeMenu() {
        employeeView.isHidden = false
        employeeStack.isHidden = false
        managerButton.isHidden = false
        foodServicesButton.isHidden = false
        rideServicesButton.isHidden = false
        maintenanceButton.isHidden = false
    }

    func showVendorMenu() {
        vendorView.isHidden = false
        vendorStack.isHidden = false
        acmeButton.isHidden = false
        orkinButton.isHidden = false
        fedexButton.isHidden = false
        nwElectricalButton.isHidden = false
    }
    
    func showContractMenu() {
        projectView.isHidden = false
        projectStack.isHidden = false
        project1001Button.isHidden = false
        project1002Button.isHidden = false
        project1003Button.isHidden = false
        project2001Button.isHidden = false
        project2002Button.isHidden = false
   }
    
    
    func hideSubMenuStacks() {
        guestStack.isHidden = true
        employeeStack.isHidden = true
        projectStack.isHidden = true
        vendorStack.isHidden = true
    }
    
    // This hides all input fields
    func hideAllLabelsAndTextFields() {
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
        dateOfVisit.isHidden = true
        dateOfVisitTF.isHidden = true
 
    }
    
    // These show parts of the form needed for entrant
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
        showFirstAndLastNameFields()
        showStreetAddressStateZipFields()
        showSocialSecurityNumber()
    }
    
    func showVendorFields() {
        showFirstAndLastNameFields()
        showDateOfBirthFields()
        dateOfVisit.isHidden = false
        dateOfVisitTF.isHidden = false
    }
    
    // These functions handle changing border color of the buttons when selected
    func resetSubMenuHighlight() {
        classicButton.borderColor = UIColor.BorderColor.subMenuBorderColor
        classicButton.isSelected = false
        vipButton.borderColor = UIColor.BorderColor.subMenuBorderColor
        vipButton.isSelected = false
        freeChildButton.borderColor = UIColor.BorderColor.subMenuBorderColor
        freeChildButton.isSelected = false
        seasonButton.borderColor = UIColor.BorderColor.subMenuBorderColor
        seasonButton.isSelected = false
        seniorButton.borderColor = UIColor.BorderColor.subMenuBorderColor
        seniorButton.isSelected = false
        managerButton.borderColor = UIColor.BorderColor.subMenuBorderColor
        managerButton.isSelected = false
        foodServicesButton.borderColor = UIColor.BorderColor.subMenuBorderColor
        foodServicesButton.isSelected = false
        rideServicesButton.borderColor = UIColor.BorderColor.subMenuBorderColor
        rideServicesButton.isSelected = false
        maintenanceButton.borderColor = UIColor.BorderColor.subMenuBorderColor
        maintenanceButton.isSelected = false
        project1001Button.borderColor = UIColor.BorderColor.subMenuBorderColor
        project1001Button.isSelected = false
        project1002Button.borderColor = UIColor.BorderColor.subMenuBorderColor
        project1002Button.isSelected = false
        project1003Button.borderColor = UIColor.BorderColor.subMenuBorderColor
        project1003Button.isSelected = false
        project2001Button.borderColor = UIColor.BorderColor.subMenuBorderColor
        project2001Button.isSelected = false
        project2002Button.borderColor = UIColor.BorderColor.subMenuBorderColor
        project2002Button.isSelected = false
        acmeButton.borderColor = UIColor.BorderColor.subMenuBorderColor
        acmeButton.isSelected = false
        orkinButton.borderColor = UIColor.BorderColor.subMenuBorderColor
        orkinButton.isSelected = false
        fedexButton.borderColor = UIColor.BorderColor.subMenuBorderColor
        fedexButton.isSelected = false
        nwElectricalButton.borderColor = UIColor.BorderColor.subMenuBorderColor
        nwElectricalButton.isSelected = false
    }
    
    func resetMainMenuHighlight() {
        guestButton.borderColor = UIColor.BorderColor.mainMenuBorderColor
        guestButton.isSelected = false
        employeeButton.borderColor = UIColor.BorderColor.mainMenuBorderColor
        employeeButton.isSelected = false
        vendorButton.borderColor = UIColor.BorderColor.mainMenuBorderColor
        vendorButton.isSelected = false
        contractButton.borderColor = UIColor.BorderColor.mainMenuBorderColor
        contractButton.isSelected = false
    }
    
    // MARK: - Main Menu Selection
    @IBAction func mainMenuButtonManager(_ sender: UIButton) {
        resetInputFields()
        resetSubMenuHighlight() // These set the normal border color state
        resetMainMenuHighlight() // Thse set the normal border color state
        sender.borderColor = UIColor.BorderColor.buttonSelectedBorderColor // This is selected border color state
        
        hideSubMenus()
        hideAllLabelsAndTextFields()
        
        switch sender {
        case guestButton:
            guestButton.isSelected = true
            print("Guest Menu Selected")
            showGuestMenu()
        case employeeButton:
            employeeButton.isSelected = true
            print("Employee Menu Selected")
            showEmployeeMenu()
        case vendorButton:
            vendorButton.isSelected = true
            print("Vendor Menu Selected")
            showVendorMenu()
        case contractButton:
            contractButton.isSelected = true
            print("Contract Employee Menu Selected")
            showContractMenu()
        default:
            break
        }
    }
    
    // MARK: Sub Menu Selection
    @IBAction func subMenuButtonManager(_ sender: UIButton) {
         resetInputFields()
         resetSubMenuHighlight() // Thse set the normal border color state
         sender.borderColor = UIColor.BorderColor.buttonSelectedBorderColor // This is selected border color state
        
         hideAllLabelsAndTextFields()
        
        switch sender {
        case classicButton:
            classicButton.isSelected = true
            print("Classic")
            showDateOfBirthFields()
        case vipButton:
            vipButton.isSelected = true
            print("VIP")
            showDateOfBirthFields()
        case freeChildButton:
            freeChildButton.isSelected = true
            print("Free Child")
            showDateOfBirthFields()
        case seasonButton:
            seasonButton.isSelected = true
            print("Season")
            showDateOfBirthFields()
            showFirstAndLastNameFields()
            showStreetAddressStateZipFields()
        case seniorButton:
            seniorButton.isSelected = true
            print("Senior")
            showDateOfBirthFields()
            showFirstAndLastNameFields()
            showDateOfBirthFields()
        case managerButton:
            print("Manager")
            managerButton.isSelected = true
            showDateOfBirthFields()
            showFirstAndLastNameFields()
            showStreetAddressStateZipFields()
            showDateOfBirthFields()
            showSocialSecurityNumber()
        case foodServicesButton:
            foodServicesButton.isSelected = true
            print("Food Service")
            showDateOfBirthFields()
            showFirstAndLastNameFields()
            showStreetAddressStateZipFields()
            showSocialSecurityNumber()
        case rideServicesButton:
            rideServicesButton.isSelected = true
            print("Ride Service")
            showDateOfBirthFields()
            showFirstAndLastNameFields()
            showStreetAddressStateZipFields()
            showSocialSecurityNumber()
        case maintenanceButton:
            rideServicesButton.isSelected = true
            print("Maintenance")
            showDateOfBirthFields()
            showFirstAndLastNameFields()
            showStreetAddressStateZipFields()
            showSocialSecurityNumber()
        case acmeButton:
            acmeButton.isSelected = true
            print("Acme")
            showDateOfBirthFields()
            showVendorFields()
        case orkinButton:
            orkinButton.isSelected = true
            print("Orkin")
            showDateOfBirthFields()
            showVendorFields()
        case fedexButton:
            fedexButton.isSelected = true
            print("Fedex")
            showDateOfBirthFields()
            showVendorFields()
        case nwElectricalButton:
            nwElectricalButton.isSelected = true
            print("NW Electrical")
            showDateOfBirthFields()
            showVendorFields()
        case project1001Button:
            project1001Button.isSelected = true
            print("Contract Employee")
            showDateOfBirthFields()
            showContractFields()
        case project1002Button:
            project1002Button.isSelected = true
            print("Contract Employee")
            showDateOfBirthFields()
            showContractFields()
        case project1003Button:
            project1003Button.isSelected = true
            print("Contract Employee")
            showDateOfBirthFields()
            showContractFields()
        case project2001Button:
            project2001Button.isSelected = true
            print("Contract Employee")
            showDateOfBirthFields()
            showContractFields()
        case project2002Button:
            project2002Button.isSelected = true
            showDateOfBirthFields()
            showContractFields()
        default:
            break
            
        }
    }
    
    func resetInputFields() {
        firstNameTF.text = ""
        lastNameTF.text = ""
        dateOfBirthTF.text = ""
        streetAddressTF.text = ""
        zipCodeTF.text = ""
        cityTF.text = ""
        stateTF.text = ""
        ssnTF.text = ""
        dateOfVisitTF.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    // MARK: - Keyboard
    @objc func keyboardWillShow(_ notfication: Notification) {
        UIView.animate(withDuration: 0.8) { self.view.layoutIfNeeded() }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        UIView.animate(withDuration: 0.8) { self.view.layoutIfNeeded() }
    }
    
    // This transfers the data to the second viewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is SecondViewController {
            let targetViewController = segue.destination as? SecondViewController
            
            targetViewController?.passForVisitor = pass
            targetViewController?.visitor = entrant // not sure if this is needed
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        pass = nil // Resets pass
        entrant = nil // Not sure if this one is needed
        hideSubMenus()
        hideAllLabelsAndTextFields()
        resetInputFields() // This empties all input fields to prepare for new visitor
        resetSubMenuHighlight() // This resets the main menu button border colors
        resetMainMenuHighlight() // This resets the sub menu button border colors
    }
    
    
}

