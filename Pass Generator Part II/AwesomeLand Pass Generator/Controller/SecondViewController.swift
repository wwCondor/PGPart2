//
//  SecondViewController.swift
//  AwesomeLand Pass Generator
//
//  Created by Wouter Willebrands on 01/03/2019.
//  Copyright © 2019 Studio Willebrands. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    // Button takes you back to first screen
    // Should reset everything
    @IBAction func newEntrant(_ sender: Any) {
        dismiss(animated: true, completion: nil)
     
    }
    
    // Pass main information labels
    // These should get populated with info entered in previous screen
    @IBOutlet weak var typeOfPassLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var foodDiscountLabel: UILabel!
    @IBOutlet weak var merchandiseDiscountLabel: UILabel!
    
    
    // These buttons should check wether entrant has access to an area
    // If access granted "testFlag" should turn green
    // If access denied "testtFlag" should turn red
    @IBAction func amusementAreaButton(_ sender: UIButton) {
        //let amusementAreaCheck = AreaAccesPoint.check(pass: Pass, forCheckpoint: AreaAccesPoint.Area)
    }
    
    @IBAction func skipLinesPrivilege(_ sender: UIButton) {
    }
    
    @IBAction func rideAreaAccessButton(_ sender: UIButton) {
    }
    
    @IBAction func kitchenAreaButton(_ sender: UIButton) {
    }
    
    @IBAction func rideControlAreaButton(_ sender: UIButton) {
    }
    
    @IBAction func maintenanceAreaButton(_ sender: UIButton) {
    }
    
    @IBAction func officeAreaButton(_ sender: UIButton) {
    }
    
    
    
    // This flag should change when area access is granted/denied
    @IBOutlet weak var testFlag: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
