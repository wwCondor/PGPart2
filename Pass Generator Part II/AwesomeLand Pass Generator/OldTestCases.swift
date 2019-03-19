//
//  OldTestCases.swift
//  AwesomeLand Pass Generator
//
//  Created by Wouter Willebrands on 12/03/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//

import Foundation

// These are testcases
// Place in viewDidLoad if needed
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
