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
    
    // Optional pass variable
    var pass: Pass?
    var entrant: Entrant?
    
    // MARK: - Menu Selection Buttons
    // This is the main menu for Entrants
    @IBOutlet weak var guestButton: UIButton!
    @IBOutlet weak var employeeButton: UIButton!
    @IBOutlet weak var contractButton: UIButton!
    @IBOutlet weak var vendorButton: UIButton!
    
    // This is the employee submenu
    @IBOutlet weak var manager: UIButton!
    @IBOutlet weak var foodServices: UIButton!
    @IBOutlet weak var rideServices: UIButton!
    @IBOutlet weak var maintenance: UIButton!
    
    // This is the guest submenu
    @IBOutlet weak var classic: UIButton!
    @IBOutlet weak var vip: UIButton!
    @IBOutlet weak var freeChild: UIButton!
    @IBOutlet weak var season: UIButton!
    @IBOutlet weak var senior: UIButton!
    
    // This is the contractor submenu
    @IBOutlet weak var project1001: UIButton!
    @IBOutlet weak var project1002: UIButton!
    @IBOutlet weak var project1003: UIButton!
    @IBOutlet weak var project2001: UIButton!
    @IBOutlet weak var project2002: UIButton!
    
    // This is the vendor submenu
    @IBOutlet weak var acme: UIButton!
    @IBOutlet weak var orkin: UIButton!
    @IBOutlet weak var fedex: UIButton!
    @IBOutlet weak var nwElectrical: UIButton!
    
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
        
        // These have been moved outide the method
        // var entrant: Entrant?
        // var pass: Pass?
        
        // Depending on which buttons have been selected these are the initializers
        // These are the guestButton inits
        if guestButton.isSelected {
            if classic.isSelected {
                let type = GuestType.classic
                entrant = Guest(type: type, birthday: birthday)
            } else if vip.isSelected {
                let type = GuestType.vip
                entrant = Guest(type: type, birthday: birthday)
            } else if freeChild.isSelected {
                let type = GuestType.freeChild
                entrant = Guest(type: type, birthday: birthday)
            } else if season.isSelected {
                let type = GuestType.season
                entrant = SeasonGuest(firstName: firstName, lastName: lastName, streetAddress: street, city: city, state: state, zipCode: zipCode, type: type, birthday: birthday)
            } else if senior.isSelected {
                let type = GuestType.senior
                entrant = SeniorGuest(firstName: firstName, lastName: lastName, type: type, birthday: birthday)
            }
        
        // These are the employeeButton inits
        } else if employeeButton.isSelected {
            if manager.isSelected {
                let type = EmployeeType.manager
                entrant = Employee(type: type, firstName: firstName, lastName: lastName, streetAddress: street, city: city, state: state, zipCode: zipCode, birthday: birthday)
            } else if foodServices.isSelected {
                let type = EmployeeType.foodServices
                entrant = Employee(type: type, firstName: firstName, lastName: lastName, streetAddress: street, city: city, state: state, zipCode: zipCode, birthday: birthday)
            } else if rideServices.isSelected {
                let type = EmployeeType.rideServices
                entrant = Employee(type: type, firstName: firstName, lastName: lastName, streetAddress: street, city: city, state: state, zipCode: zipCode, birthday: birthday)
            } else if maintenance.isSelected {
                let type = EmployeeType.maintenance
                entrant = Employee(type: type, firstName: firstName, lastName: lastName, streetAddress: street, city: city, state: state, zipCode: zipCode, birthday: birthday)
            }
         
        // These are the contractButton inits
        } else if contractButton.isSelected {
            if project1001.isSelected {
                let type = EmployeeType.contract
                let project = Project.p1001
                entrant = ContractEmployee(socialSecurityNumber: ssn, projectNumber: project, type: type, firstName: firstName, lastName: lastName, streetAddress: street, city: city, state: state, zipCode: zipCode, birthday: birthday)
            } else if project1002.isSelected {
                let type = EmployeeType.contract
                let project = Project.p1002
                entrant = ContractEmployee(socialSecurityNumber: ssn, projectNumber: project, type: type, firstName: firstName, lastName: lastName, streetAddress: street, city: city, state: state, zipCode: zipCode, birthday: birthday)
            } else if project1003.isSelected {
                let type = EmployeeType.contract
                let project = Project.p1003
                entrant = ContractEmployee(socialSecurityNumber: ssn, projectNumber: project, type: type, firstName: firstName, lastName: lastName, streetAddress: street, city: city, state: state, zipCode: zipCode, birthday: birthday)
            } else if project2001.isSelected {
                let type = EmployeeType.contract
                let project = Project.p2001
                entrant = ContractEmployee(socialSecurityNumber: ssn, projectNumber: project, type: type, firstName: firstName, lastName: lastName, streetAddress: street, city: city, state: state, zipCode: zipCode, birthday: birthday)
            } else if project2002.isSelected {
                let type = EmployeeType.contract
                let project = Project.p2002
                entrant = ContractEmployee(socialSecurityNumber: ssn, projectNumber: project, type: type, firstName: firstName, lastName: lastName, streetAddress: street, city: city, state: state, zipCode: zipCode, birthday: birthday)
            }
        
        // These are the vendorButton inits
        } else if vendorButton.isSelected {
            if acme.isSelected {
                let type = Company.acme
                entrant = Vendor(company: type, firstName: firstName, lastName: lastName, visitingDate: dateOfVisit, birthday: birthday)
            } else  if orkin.isSelected {
                let type = Company.orkin
                entrant = Vendor(company: type, firstName: firstName, lastName: lastName, visitingDate: dateOfVisit, birthday: birthday)
            } else  if fedex.isSelected {
                let type = Company.fedex
                entrant = Vendor(company: type, firstName: firstName, lastName: lastName, visitingDate: dateOfVisit, birthday: birthday)
            } else  if nwElectrical.isSelected {
                let type = Company.nwElectrical
                entrant = Vendor(company: type, firstName: firstName, lastName: lastName, visitingDate: dateOfVisit, birthday: birthday)
            }
            
        }
        
        // If entrant has been created, a pass can be created as well.
        // If pass is not nil, we can safely go to second viewController
        if let entrant = entrant {
            pass = entrant.assignPass(entrant: entrant)
            performSegue(withIdentifier: "PassSegue", sender: self)
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
        manager.isHidden = false
        foodServices.isHidden = false
        rideServices.isHidden = false
        maintenance.isHidden = false
    }

    func showVendorMenu() {

        vendorView.isHidden = false
        vendorStack.isHidden = false
        acme.isHidden = false
        orkin.isHidden = false
        fedex.isHidden = false
        nwElectrical.isHidden = false
    }
    
    func showContractMenu() {

        projectView.isHidden = false
        projectStack.isHidden = false
        project1001.isHidden = false
        project1002.isHidden = false
        project1003.isHidden = false
        project2001.isHidden = false
        project2002.isHidden = false
   }
    
    
    func hideSubMenuStacks() {
        guestStack.isHidden = true
        employeeStack.isHidden = true
        projectStack.isHidden = true
        vendorStack.isHidden = true
    }
    
    // This hides all submenu buttons and input fields
    func hideAllLabelsAndTextFields() {

        // Hides submenu buttons
        // hideSubMenuStacks()
        
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
        classic.borderColor = UIColor.BorderColor.subMenuBorderColor
        vip.borderColor = UIColor.BorderColor.subMenuBorderColor
        freeChild.borderColor = UIColor.BorderColor.subMenuBorderColor
        season.borderColor = UIColor.BorderColor.subMenuBorderColor
        senior.borderColor = UIColor.BorderColor.subMenuBorderColor
        manager.borderColor = UIColor.BorderColor.subMenuBorderColor
        foodServices.borderColor = UIColor.BorderColor.subMenuBorderColor
        rideServices.borderColor = UIColor.BorderColor.subMenuBorderColor
        maintenance.borderColor = UIColor.BorderColor.subMenuBorderColor
        project1001.borderColor = UIColor.BorderColor.subMenuBorderColor
        project1002.borderColor = UIColor.BorderColor.subMenuBorderColor
        project1003.borderColor = UIColor.BorderColor.subMenuBorderColor
        project2001.borderColor = UIColor.BorderColor.subMenuBorderColor
        project2002.borderColor = UIColor.BorderColor.subMenuBorderColor
        acme.borderColor = UIColor.BorderColor.subMenuBorderColor
        orkin.borderColor = UIColor.BorderColor.subMenuBorderColor
        fedex.borderColor = UIColor.BorderColor.subMenuBorderColor
        nwElectrical.borderColor = UIColor.BorderColor.subMenuBorderColor
    }
    
    func resetMainMenuHighlight() {
        guestButton.borderColor = UIColor.BorderColor.mainMenuBorderColor
        employeeButton.borderColor = UIColor.BorderColor.mainMenuBorderColor
        vendorButton.borderColor = UIColor.BorderColor.mainMenuBorderColor
        contractButton.borderColor = UIColor.BorderColor.mainMenuBorderColor
    }
    
    // MARK: - Main Menu Selection
    @IBAction func mainMenuButtonManager(_ sender: UIButton) {
        resetSubMenuHighlight()
        resetMainMenuHighlight()
        sender.borderColor = UIColor.BorderColor.buttonSelectedBorderColor

      //  guestButton.addTarget(self, action: #selector(startHighlight), for: .touchDown)
        
        hideSubMenus()
        hideAllLabelsAndTextFields()
        
        switch sender {
        case guestButton:
            print("Guest Menu Selected")
            showGuestMenu()
        case employeeButton:
            print("Employee Menu Selected")
            showEmployeeMenu()
        case vendorButton:
            print("Vendor Menu Selected")
            showVendorMenu()
        case contractButton:
            print("Contract Employee Menu Selected")
            showContractMenu()
        default:
            break
        }
    }
    
    // MARK: Sub Menu Selection
    @IBAction func subMenuButtonManager(_ sender: UIButton) {
         resetSubMenuHighlight()
         sender.borderColor = UIColor.BorderColor.buttonSelectedBorderColor
        
         hideAllLabelsAndTextFields()
        
        switch sender {
        case classic:
            print("Classic")
            showDateOfBirthFields()
        case vip:
            print("VIP")
            showDateOfBirthFields()
        case freeChild:
            print("Free Child")
            showDateOfBirthFields()
        case season:
            print("Season")
            showDateOfBirthFields()
            showFirstAndLastNameFields()
            showStreetAddressStateZipFields()
        case senior:
            print("Senior")
            showDateOfBirthFields()
            showFirstAndLastNameFields()
            showDateOfBirthFields()
        case manager:
            print("Manager")
            showDateOfBirthFields()
            showFirstAndLastNameFields()
            showStreetAddressStateZipFields()
            showDateOfBirthFields()
            showSocialSecurityNumber()
        case foodServices:
            print("Food Service")
            showDateOfBirthFields()
            showFirstAndLastNameFields()
            showStreetAddressStateZipFields()
            showSocialSecurityNumber()
        case rideServices:
            print("Ride Service")
            showDateOfBirthFields()
            showFirstAndLastNameFields()
            showStreetAddressStateZipFields()
            showSocialSecurityNumber()
        case maintenance:
            print("Maintenance")
            showDateOfBirthFields()
            showFirstAndLastNameFields()
            showStreetAddressStateZipFields()
            showSocialSecurityNumber()
        case acme:
            print("Acme")
            showDateOfBirthFields()
            showVendorFields()
        case orkin:
            print("Orkin")
            showDateOfBirthFields()
            showVendorFields()
        case fedex:
            print("Fedex")
            showDateOfBirthFields()
            showVendorFields()
        case nwElectrical:
            print("NW Electrical")
            showDateOfBirthFields()
            showVendorFields()
        case project1001:
            print("Contract Employee")
            showDateOfBirthFields()
            showContractFields()
        case project1002:
            print("Contract Employee")
            showDateOfBirthFields()
            showContractFields()
        case project1003:
            print("Contract Employee")
            showDateOfBirthFields()
            showContractFields()
        case project2001:
            print("Contract Employee")
            showDateOfBirthFields()
            showContractFields()
        case project2002:
            showDateOfBirthFields()
            showContractFields()
        default:
            break
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideSubMenus()
        hideAllLabelsAndTextFields()
        
        // The keyboard code is copied from the storyboard app, need to update to current setup
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // This transfers the data to the second viewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is SecondViewController {
            let targetViewController = segue.destination as? SecondViewController
            
            targetViewController?.passForVisitor = pass
            targetViewController?.visitor = entrant
        }
    }
    // targetViewController?.visitor = entrant // not needed?

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // Copied from the storyboard app, need to update to current setup
    @objc func keyboardWillShow(_ notfication: Notification) {
       // if let keyboardFrame = notfication.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            // let frame = keyboardFrame.cgRectValue
            // textFieldBottomConstraint.constant = frame.size.height + 10
            
            UIView.animate(withDuration: 0.8) {
                self.view.layoutIfNeeded()
            }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        // textFieldBottomConstraintt.constant = 40
        
        UIView.animate(withDuration: 0.8) {
            self.view.layoutIfNeeded()
        }
    }
}

